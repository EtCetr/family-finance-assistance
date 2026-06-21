import 'package:drift/drift.dart';
import 'database.dart';

part 'analytics_dao.g.dart';

/// DAO для аналитических SQL-запросов (Раздел 5 ТЗ)
@DriftAccessor(
  tables: [Transactions, Accounts, Categories, AppSettings, BudgetLimits],
)
class AnalyticsDao extends DatabaseAccessor<AppDatabase>
    with _$AnalyticsDaoMixin {
  AnalyticsDao(super.db);

  // ============================================================
  // 1. СУММА ТРАТ ПО КАТЕГОРИИ ЗА МЕСЯЦ (ТЗ п.5.1)
  // Исключает audit_status = 'ignored'
  // ============================================================

  /// Получить сумму расходов по конкретной категории за месяц
  Future<double> getCategoryExpenseSum({
    required String categoryId,
    required int year,
    required int month,
  }) async {
    final query = customSelect(
      '''
      SELECT COALESCE(SUM(amount), 0.0) as total
      FROM transactions
      WHERE custom_category_id = ?
        AND audit_status != 'ignored'
        AND type = 'expense'
        AND CAST(strftime('%Y', date) AS INTEGER) = ?
        AND CAST(strftime('%m', date) AS INTEGER) = ?
      ''',
      variables: [
        Variable<String>(categoryId),
        Variable<int>(year),
        Variable<int>(month),
      ],
      readsFrom: {transactions},
    );

    final row = await query.getSingle();
    return row.read<double>('total');
  }

  /// Получить суммы по всем категориям за месяц (для графика)
  Future<List<CategoryExpense>> getCategoryExpensesForMonth({
    required int year,
    required int month,
  }) async {
    final query = customSelect(
      '''
      SELECT 
        t.custom_category_id,
        c.name as category_name,
        COALESCE(SUM(t.amount), 0.0) as total
      FROM transactions t
      LEFT JOIN categories c ON t.custom_category_id = c.id
      WHERE t.audit_status != 'ignored'
        AND t.type = 'expense'
        AND CAST(strftime('%Y', t.date) AS INTEGER) = ?
        AND CAST(strftime('%m', t.date) AS INTEGER) = ?
      GROUP BY t.custom_category_id, c.name
      ORDER BY total DESC
      ''',
      variables: [Variable<int>(year), Variable<int>(month)],
      readsFrom: {transactions, categories},
    );

    final rows = await query.get();
    return rows
        .map(
          (row) => CategoryExpense(
            categoryId: row.read<String>('custom_category_id'),
            categoryName: row.read<String>('category_name'),
            total: row.read<double>('total'),
          ),
        )
        .toList();
  }

  // ============================================================
  // 2. ЧЕСТНОЕ СКОЛЬЗЯЩЕЕ СРЕДНЕЕ (ТЗ п.5.2)
  // Деление на N_active (кол-во месяцев с тратами), а не на 12
  // ============================================================

  /// Получить количество месяцев с тратами за год (N_active)
  Future<int> getActiveMonthsCount({
    required int year,
    String? categoryId,
  }) async {
    final categoryFilter = categoryId != null
        ? 'AND custom_category_id = ?'
        : '';
    final variables = <Variable>[Variable<int>(year)];
    if (categoryId != null) {
      variables.add(Variable<String>(categoryId));
    }

    final query = customSelect(
      '''
      SELECT COUNT(DISTINCT CAST(strftime('%m', date) AS INTEGER)) as active_months
      FROM transactions
      WHERE type = 'expense'
        AND audit_status != 'ignored'
        AND CAST(strftime('%Y', date) AS INTEGER) = ?
        $categoryFilter
      ''',
      variables: variables,
      readsFrom: {transactions},
    );

    final row = await query.getSingle();
    return row.read<int>('active_months');
  }

  /// Рассчитать честное среднее расходов по категории за год
  Future<double> getHonestAverageExpense({
    required String categoryId,
    required int year,
  }) async {
    final totalQuery = customSelect(
      '''
      SELECT COALESCE(SUM(amount), 0.0) as total
      FROM transactions
      WHERE custom_category_id = ?
        AND type = 'expense'
        AND audit_status != 'ignored'
        AND CAST(strftime('%Y', date) AS INTEGER) = ?
      ''',
      variables: [Variable<String>(categoryId), Variable<int>(year)],
      readsFrom: {transactions},
    );

    final totalRow = await totalQuery.getSingle();
    final total = totalRow.read<double>('total');

    final activeMonths = await getActiveMonthsCount(
      year: year,
      categoryId: categoryId,
    );

    if (activeMonths == 0) return 0.0;
    return total / activeMonths;
  }

  // ============================================================
  // 3. ПОДУШКА БЕЗОПАСНОСТИ (ТЗ п.5.2)
  // Накопления / Среднее расходов за 3 месяца
  // ============================================================

  /// Рассчитать подушку безопасности (в месяцах)
  Future<double> getSafetyCushion({required String userId}) async {
    // 1. Получить общий баланс (сумма всех счетов с include_in_personal_balance = TRUE)
    final balanceQuery = customSelect(
      '''
      SELECT COALESCE(SUM(current_balance), 0.0) as total_balance
      FROM accounts
      WHERE user_id = ?
        AND include_in_personal_balance = TRUE
        AND account_type != 'investment_broker'
      ''',
      variables: [Variable<String>(userId)],
      readsFrom: {accounts},
    );

    final balanceRow = await balanceQuery.getSingle();
    final totalBalance = balanceRow.read<double>('total_balance');

    // 2. Получить средние расходы за последние 3 месяца
    final avgExpensesQuery = customSelect(
      '''
      SELECT COALESCE(SUM(amount), 0.0) / 3.0 as avg_expenses
      FROM transactions
      WHERE type = 'expense'
        AND audit_status != 'ignored'
        AND date >= date('now', '-3 months')
      ''',
      readsFrom: {transactions},
    );

    final avgRow = await avgExpensesQuery.getSingle();
    final avgExpenses = avgRow.read<double>('avg_expenses');

    if (avgExpenses == 0) return 0.0;
    return totalBalance / avgExpenses;
  }

  // ============================================================
  // 4. ПЛАВАЮЩИЕ ЛИМИТЫ (ТЗ п.5.3)
  // Логика через свитчи inherit_limit_from_previous_month
  // и carry_over_unused_limit
  // ============================================================

  /// Рассчитать эффективный лимит с учётом свитчей
  Future<double> getEffectiveLimit({
    required String categoryId,
    required int year,
    required int month,
  }) async {
    // 1. Получить настройки пользователя
    final settingsQuery = customSelect(
      '''
      SELECT inherit_limit_from_previous_month, carry_over_unused_limit
      FROM app_settings
      LIMIT 1
      ''',
      readsFrom: {appSettings},
    );

    final settingsRow = await settingsQuery.getSingleOrNull();
    if (settingsRow == null) {
      // Если настроек нет, вернуть базовый лимит
      return await _getBaseLimit(categoryId, year, month);
    }

    final inheritLimit = settingsRow.read<bool>(
      'inherit_limit_from_previous_month',
    );
    final carryOver = settingsRow.read<bool>('carry_over_unused_limit');

    // 2. Получить базовый лимит на текущий месяц
    double effectiveLimit = await _getBaseLimit(categoryId, year, month);

    // 3. Применить логику наследования от прошлого месяца
    if (inheritLimit) {
      final previousMonth = month == 1 ? 12 : month - 1;
      final previousYear = month == 1 ? year - 1 : year;

      final previousLimit = await _getBaseLimit(
        categoryId,
        previousYear,
        previousMonth,
      );

      if (previousLimit > 0) {
        effectiveLimit = previousLimit;
      }
    }

    // 4. Применить логику переноса остатка
    if (carryOver) {
      final previousMonth = month == 1 ? 12 : month - 1;
      final previousYear = month == 1 ? year - 1 : year;

      final previousLimit = await _getBaseLimit(
        categoryId,
        previousYear,
        previousMonth,
      );

      final previousExpenses = await getCategoryExpenseSum(
        categoryId: categoryId,
        year: previousYear,
        month: previousMonth,
      );

      final unusedLimit = previousLimit - previousExpenses;
      if (unusedLimit > 0) {
        effectiveLimit += unusedLimit;
      }
    }

    return effectiveLimit;
  }

  /// Получить базовый лимит из таблицы budget_limits
  Future<double> _getBaseLimit(String categoryId, int year, int month) async {
    final query = customSelect(
      '''
      SELECT COALESCE(limit_amount, 0.0) as limit_amount
      FROM budget_limits
      WHERE category_id = ?
        AND year = ?
        AND month = ?
      ''',
      variables: [
        Variable<String>(categoryId),
        Variable<int>(year),
        Variable<int>(month),
      ],
      readsFrom: {budgetLimits},
    );

    final row = await query.getSingleOrNull();
    return row?.read<double>('limit_amount') ?? 0.0;
  }

  // ============================================================
  // 5. КОНСТРУКТОР ОБЩЕГО БАЛАНСА (ТЗ п.3.3)
  // Суммирует балансы только тех счетов, где
  // include_in_personal_balance = TRUE или include_in_family_balance = TRUE
  // ============================================================

  /// Получить личный баланс (include_in_personal_balance = TRUE)
  Future<double> getPersonalBalance({required String userId}) async {
    final query = customSelect(
      '''
      SELECT COALESCE(SUM(current_balance), 0.0) as total
      FROM accounts
      WHERE user_id = ?
        AND include_in_personal_balance = TRUE
      ''',
      variables: [Variable<String>(userId)],
      readsFrom: {accounts},
    );

    final row = await query.getSingle();
    return row.read<double>('total');
  }

  /// Получить семейный баланс (include_in_family_balance = TRUE)
  Future<double> getFamilyBalance({required String userId}) async {
    final query = customSelect(
      '''
      SELECT COALESCE(SUM(a.current_balance), 0.0) as total
      FROM accounts a
      INNER JOIN users u ON a.user_id = u.id
      WHERE u.space_id = (
        SELECT space_id FROM users WHERE id = ?
      )
        AND a.include_in_family_balance = TRUE
      ''',
      variables: [Variable<String>(userId)],
      readsFrom: {accounts, users},
    );

    final row = await query.getSingle();
    return row.read<double>('total');
  }

  /// Получить детализацию по счетам для личного баланса
  Future<List<AccountBalance>> getPersonalBalanceDetails({
    required String userId,
  }) async {
    final query = customSelect(
      '''
      SELECT 
        id,
        bank_name,
        custom_name,
        card_number_mask,
        current_balance,
        currency
      FROM accounts
      WHERE user_id = ?
        AND include_in_personal_balance = TRUE
      ORDER BY current_balance DESC
      ''',
      variables: [Variable<String>(userId)],
      readsFrom: {accounts},
    );

    final rows = await query.get();
    return rows
        .map(
          (row) => AccountBalance(
            accountId: row.read<String>('id'),
            bankName: row.read<String>('bank_name'),
            customName: row.read<String>('custom_name'),
            cardMask: row.read<String>('card_number_mask'),
            balance: row.read<double>('current_balance'),
            currency: row.read<String>('currency'),
          ),
        )
        .toList();
  }

  /// Получить Savings Rate (ТЗ п.5.2)
  /// (Доходы - Расходы) / Доходы * 100%
  Future<double> getSavingsRate({required int year, required int month}) async {
    final query = customSelect(
      '''
      SELECT 
        COALESCE(SUM(CASE WHEN type = 'income' THEN amount ELSE 0.0 END), 0.0) as total_income,
        COALESCE(SUM(CASE WHEN type = 'expense' THEN amount ELSE 0.0 END), 0.0) as total_expense
      FROM transactions
      WHERE audit_status != 'ignored'
        AND CAST(strftime('%Y', date) AS INTEGER) = ?
        AND CAST(strftime('%m', date) AS INTEGER) = ?
      ''',
      variables: [Variable<int>(year), Variable<int>(month)],
      readsFrom: {transactions},
    );

    final row = await query.getSingle();
    final income = row.read<double>('total_income');
    final expense = row.read<double>('total_expense');

    if (income == 0) return 0.0;
    return ((income - expense) / income) * 100.0;
  }
}

// ============================================================
// DTO-модели для результатов
// ============================================================

class CategoryExpense {
  final String categoryId;
  final String categoryName;
  final double total;

  CategoryExpense({
    required this.categoryId,
    required this.categoryName,
    required this.total,
  });
}

class AccountBalance {
  final String accountId;
  final String bankName;
  final String customName;
  final String cardMask;
  final double balance;
  final String currency;

  AccountBalance({
    required this.accountId,
    required this.bankName,
    required this.customName,
    required this.cardMask,
    required this.balance,
    required this.currency,
  });
}