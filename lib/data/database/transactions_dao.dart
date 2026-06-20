import 'package:drift/drift.dart';
import 'database.dart';

part 'transactions_dao.g.dart';

// ============================================================
// 🧩 DAO: TransactionsDao
// ============================================================
@DriftAccessor(tables: [Transactions])
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  TransactionsDao(super.db);

  /// Вставка транзакции с проверкой дублей по bank_transaction_id
  Future<String?> insertTransaction(TransactionsCompanion transaction) async {
    return await db.transaction(() async {
      final bankTxId = transaction.bankTransactionId.value;
      if (bankTxId != null && bankTxId.isNotEmpty) {
        final existing =
            await (select(transactions)
                  ..where((t) => t.bankTransactionId.equals(bankTxId)))
                .getSingleOrNull();

        if (existing != null) {
          return null; // Дубликат найден
        }
      }

      await into(transactions).insert(transaction);
      return transaction.id.value;
    });
  }

  /// Получить все pending-транзакции для синхронизации
  Future<List<Transaction>> getPendingTransactions() {
    return (select(transactions)..where(
          (t) =>
              t.syncStatus.equals('pending') &
              t.isArchivedForSpace.equals(false),
        ))
        .get();
  }

  /// Пометить одну транзакцию как синхронизированную
  Future<int> markAsSynced(String transactionId) {
    return (update(
      transactions,
    )..where((t) => t.id.equals(transactionId))).write(
      TransactionsCompanion(syncStatus: const Value(SyncStatus.synced)),
    );
  }

  /// Массовая пометка как синхронизированные
  Future<void> markAllAsSynced(List<String> ids) async {
    if (ids.isEmpty) return;

    final placeholders = ids.map((_) => '?').join(',');
    await customUpdate(
      'UPDATE transactions SET sync_status = ? WHERE id IN ($placeholders)',
      variables: [
        Variable<String>('synced'),
        ...ids.map((id) => Variable<String>(id)),
      ],
      updates: {transactions},
    );
  }

  /// Получить количество pending-транзакций
  Future<int> countPending() {
    final countExp = transactions.id.count();
    final query = selectOnly(transactions)
      ..where(transactions.syncStatus.equals('pending'));
    return query.map((row) => row.read(countExp) ?? 0).getSingle();
  }
}
