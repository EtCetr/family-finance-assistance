import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../database/database.dart';
import '../database/transactions_dao.dart';
import '../datasources/supabase_client.dart';
import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

/// Движок синхронизации: Drift <-> Supabase
class SyncEngine {
  final AppDatabase _localDb;
  final TransactionsDao _transactionsDao;
  final SupabaseClient _supabase;

  SyncEngine({
    required AppDatabase localDb,
    required SupabaseClientService supabaseClient,
  }) : _localDb = localDb,
       _transactionsDao = TransactionsDao(localDb), // Создаем DAO явно
       _supabase = supabaseClient.client;

  /// Синхронизация всех pending-записей
  Future<SyncResult> syncPendingData() async {
    try {
      _logger.i('[SyncEngine] Начинаю синхронизацию...');

      final pendingTransactions = await _transactionsDao
          .getPendingTransactions();

      if (pendingTransactions.isEmpty) {
        _logger.i('[SyncEngine] Нет pending-записей');
        return SyncResult(success: true, syncedCount: 0, conflictCount: 0);
      }

      _logger.i(
        '[SyncEngine] Найдено ${pendingTransactions.length} pending-записей',
      );

      int syncedCount = 0;
      int conflictCount = 0;

      final payload = pendingTransactions.map((t) {
        return {
          'id': t.id,
          'account_id': t.accountId,
          'bank_transaction_id': t.bankTransactionId,
          'date': t.date.toIso8601String(),
          'amount': t.amount,
          'original_currency': t.originalCurrency,
          'original_amount': t.originalAmount,
          'type': t.type.name,
          'is_refund': t.isRefund,
          'bank_category': t.bankCategory,
          'custom_category_id': t.customCategoryId,
          'comment': t.comment,
          'is_user_edited': t.isUserEdited,
          'sync_status': 'pending',
          'is_hidden_by_calendar': t.isHiddenByCalendar,
          'hidden_until_date': t.hiddenUntilDate?.toIso8601String(),
          'audit_status': t.auditStatus.name,
          'is_archived_for_space': t.isArchivedForSpace,
          'business_mirror': t.businessMirror,
          'updated_at': DateTime.now().toIso8601String(),
        };
      }).toList();

      try {
        await _supabase
            .from('transactions')
            .upsert(payload, onConflict: 'bank_transaction_id');

        _logger.i('[SyncEngine] UPSERT выполнен успешно');

        final syncedIds = pendingTransactions.map((t) => t.id).toList();
        await _transactionsDao.markAllAsSynced(syncedIds);

        syncedCount = syncedIds.length;
      } on PostgrestException catch (e) {
        _logger.i('[SyncEngine] Ошибка UPSERT: ${e.message}');

        if (e.code == '23505') {
          _logger.i('[SyncEngine] Обнаружен конфликт уникальности');

          for (final transaction in pendingTransactions) {
            await _handleConflict(transaction, e);
            conflictCount++;
          }
        } else {
          rethrow;
        }
      }

      _logger.i(
        '[SyncEngine] Синхронизация завершена: '
        '$syncedCount успешно, $conflictCount конфликтов',
      );

      return SyncResult(
        success: true,
        syncedCount: syncedCount,
        conflictCount: conflictCount,
      );
    } catch (e, stackTrace) {
      _logger.i('[SyncEngine] Критическая ошибка: $e');
      _logger.i('[SyncEngine] Stack: $stackTrace');

      return SyncResult(
        success: false,
        syncedCount: 0,
        conflictCount: 0,
        error: e.toString(),
      );
    }
  }

  /// Обработка конфликта синхронизации
  Future<void> _handleConflict(
    Transaction localTransaction,
    PostgrestException exception,
  ) async {
    try {
      final remoteData = await _supabase
          .from('transactions')
          .select()
          .eq('bank_transaction_id', localTransaction.bankTransactionId!)
          .single();

      final conflict = SyncConflictsCompanion(
        entityType: Value('transaction'),
        entityId: Value(localTransaction.id),
        localValue: Value(
          jsonEncode({
            'amount': localTransaction.amount,
            'comment': localTransaction.comment,
            'custom_category_id': localTransaction.customCategoryId,
            'updated_at': DateTime.now().toIso8601String(),
          }),
        ),
        remoteValue: Value(jsonEncode(remoteData)),
        createdAt: Value(DateTime.now()),
      );

      await _localDb.into(_localDb.syncConflicts).insert(conflict);

      _logger.i('[SyncEngine] Конфликт сохранён: ${localTransaction.id}');
    } catch (e) {
      _logger.i('[SyncEngine] Ошибка сохранения конфликта: $e');
    }
  }

  /// Получить количество pending-записей
  Future<int> getPendingCount() async {
    return await _transactionsDao.countPending();
  }

  /// Принудительная синхронизация одной транзакции
  Future<bool> syncSingleTransaction(String transactionId) async {
    try {
      final transaction = await (_localDb.select(
        _localDb.transactions,
      )..where((t) => t.id.equals(transactionId))).getSingleOrNull();

      if (transaction == null) return false;

      final payload = {
        'id': transaction.id,
        'account_id': transaction.accountId,
        'bank_transaction_id': transaction.bankTransactionId,
        'date': transaction.date.toIso8601String(),
        'amount': transaction.amount,
        'type': transaction.type.name,
        'is_refund': transaction.isRefund,
        'updated_at': DateTime.now().toIso8601String(),
      };

      await _supabase.from('transactions').upsert(payload);
      await _transactionsDao.markAsSynced(transactionId);

      return true;
    } catch (e) {
      _logger.i('[SyncEngine] Ошибка синхронизации транзакции: $e');
      return false;
    }
  }
}

/// Результат операции синхронизации
class SyncResult {
  final bool success;
  final int syncedCount;
  final int conflictCount;
  final String? error;

  SyncResult({
    required this.success,
    required this.syncedCount,
    required this.conflictCount,
    this.error,
  });

  @override
  String toString() {
    if (success) {
      return 'SyncResult: $syncedCount синхронизировано, '
          '$conflictCount конфликтов';
    } else {
      return 'SyncResult: ошибка — $error';
    }
  }
}