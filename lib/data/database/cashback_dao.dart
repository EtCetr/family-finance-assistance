import 'package:drift/drift.dart';
import 'database.dart';

part 'cashback_dao.g.dart';

/// DAO для работы с кэшбэком (Раздел 6 ТЗ)
@DriftAccessor(tables: [
  CashbackMatrix, 
  CashbackReminders,
  Categories,
  Transactions,
  ])
class CashbackDao extends DatabaseAccessor<AppDatabase>
    with _$CashbackDaoMixin {
  CashbackDao(super.db);

  // ============================================================
  // 1. ОЧИСТКА ПО ТАЙМЕРУ (ТЗ п.6.1)
  // ============================================================

  /// Очистить monthly-кэшбэки (1-е число каждого месяца)
  Future<int> clearMonthlyCashback() async {
    return (delete(
      cashbackMatrix,
    )..where((t) => t.lifetimeType.equals('monthly'))).go();
  }

  /// Очистить weekly-кэшбэки (воскресенье 23:59:59)
  Future<int> clearWeeklyCashback() async {
    return (delete(
      cashbackMatrix,
    )..where((t) => t.lifetimeType.equals('weekly'))).go();
  }

  /// Очистить просроченные кэшбэки (expires_at < now)
  Future<int> clearExpiredCashback() async {
    final now = DateTime.now();
    return (delete(
      cashbackMatrix,
    )..where((t) => t.expiresAt.isSmallerThanValue(now))).go();
  }

  // ============================================================
  // 2. ПОЛУЧЕНИЕ КЭШБЭКОВ (ТЗ п.6.3)
  // ============================================================

  /// Получить все активные кэшбэки для аккаунта
  Future<List<CashbackMatrixData>> getActiveCashbacks({
    required String accountId,
  }) async {
    final now = DateTime.now();
    return (select(cashbackMatrix)..where(
          (t) =>
              t.accountId.equals(accountId) &
              (t.expiresAt.isNull() | t.expiresAt.isBiggerThanValue(now)),
        ))
        .get();
  }

  /// Получить кэшбэки с сортировкой по убыванию процента
  Future<List<CashbackMatrixData>> getCashbacksSortedByPercent({
    required String accountId,
  }) async {
    final now = DateTime.now();
    return (select(cashbackMatrix)
          ..where(
            (t) =>
                t.accountId.equals(accountId) &
                (t.expiresAt.isNull() | t.expiresAt.isBiggerThanValue(now)),
          )
          ..orderBy([(t) => OrderingTerm.desc(t.percent)]))
        .get();
  }

  /// Получить только "закреплённые" категории (is_pinned_for_cashback = TRUE)
  Future<List<CashbackMatrixData>> getPinnedCashbacks({
    required String accountId,
  }) async {
    final query = customSelect(
      '''
      SELECT cm.*
      FROM cashback_matrix cm
      INNER JOIN categories c ON cm.category_name = c.name
      WHERE cm.account_id = ?
        AND c.is_pinned_for_cashback = TRUE
        AND (cm.expires_at IS NULL OR cm.expires_at > ?)
      ORDER BY cm.percent DESC
      ''',
      variables: [
        Variable<String>(accountId),
        Variable<DateTime>(DateTime.now()),
      ],
      readsFrom: {cashbackMatrix, categories},
    );

    final rows = await query.get();
    return rows
        .map(
          (row) => CashbackMatrixData(
            id: row.read<String>('id'),
            accountId: row.read<String>('account_id'),
            categoryName: row.read<String>('category_name'),
            percent: row.read<double>('percent'),
            status: CashbackStatus.values.firstWhere(
              (e) => e.name == row.read<String>('status'),
            ),
            lifetimeType: CashbackLifetimeType.values.firstWhere(
              (e) => e.name == row.read<String>('lifetime_type'),
            ),
            expiresAt: row.read<DateTime?>('expires_at'),
          ),
        )
        .toList();
  }

  // ============================================================
  // 3. ПРОГРЕСС-БАР ЛИМИТОВ (ТЗ п.6.3)
  // ============================================================

  /// Рассчитать прогресс лимита выплат для категории
  Future<CashbackProgress> getCashbackProgress({
    required String accountId,
    required String categoryName,
    required int year,
    required int month,
  }) async {
    // 1. Получить процент кэшбэка
    final cashbackQuery = customSelect(
      '''
      SELECT percent, status
      FROM cashback_matrix
      WHERE account_id = ?
        AND category_name = ?
        AND (expires_at IS NULL OR expires_at > ?)
      LIMIT 1
      ''',
      variables: [
        Variable<String>(accountId),
        Variable<String>(categoryName),
        Variable<DateTime>(DateTime.now()),
      ],
      readsFrom: {cashbackMatrix},
    );

    final cashbackRow = await cashbackQuery.getSingleOrNull();
    if (cashbackRow == null) {
      return CashbackProgress(
        categoryName: categoryName,
        percent: 0.0,
        earned: 0.0,
        limit: 0.0,
        progress: 0.0,
      );
    }

    final percent = cashbackRow.read<double>('percent');

    // 2. Рассчитать заработанный кэшбэк за месяц
    final earnedQuery = customSelect(
      '''
      SELECT COALESCE(SUM(amount * ? / 100.0), 0.0) as earned
      FROM transactions
      WHERE account_id = ?
        AND custom_category_id IN (
          SELECT id FROM categories WHERE name = ?
        )
        AND type = 'expense'
        AND audit_status != 'ignored'
        AND CAST(strftime('%Y', date) AS INTEGER) = ?
        AND CAST(strftime('%m', date) AS INTEGER) = ?
      ''',
      variables: [
        Variable<double>(percent),
        Variable<String>(accountId),
        Variable<String>(categoryName),
        Variable<int>(year),
        Variable<int>(month),
      ],
      readsFrom: {transactions, categories},
    );

    final earnedRow = await earnedQuery.getSingle();
    final earned = earnedRow.read<double>('earned');

    // 3. Лимит (пока хардкод, потом из БД)
    const limit = 3000.0; // Максимум выплат по категории в месяц

    return CashbackProgress(
      categoryName: categoryName,
      percent: percent,
      earned: earned,
      limit: limit,
      progress: earned / limit,
    );
  }

  // ============================================================
  // 4. НАПОМИНАНИЯ О КЭШБЭКЕ (ТЗ п.6.1)
  // ============================================================

  /// Получить все активные напоминания
  Future<List<CashbackReminder>> getActiveReminders({required String userId}) {
    return (select(
      cashbackReminders,
    )..where((t) => t.userId.equals(userId) & t.isEnabled.equals(true))).get();
  }

  /// Создать напоминание
  Future<int> createReminder(CashbackRemindersCompanion reminder) {
    return into(cashbackReminders).insert(reminder);
  }

  /// Обновить напоминание
  Future<bool> updateReminder(CashbackReminder reminder) {
    return update(cashbackReminders).replace(reminder);
  }

  /// Удалить напоминание
  Future<int> deleteReminder(String reminderId) {
    return (delete(
      cashbackReminders,
    )..where((t) => t.id.equals(reminderId))).go();
  }
}

/// DTO для прогресса кэшбэка
class CashbackProgress {
  final String categoryName;
  final double percent;
  final double earned;
  final double limit;
  final double progress; // 0.0 - 1.0

  CashbackProgress({
    required this.categoryName,
    required this.percent,
    required this.earned,
    required this.limit,
    required this.progress,
  });

  bool get isLimitReached => earned >= limit;
}