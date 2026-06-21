import '../database/database.dart';
import '../database/analytics_dao.dart';

/// Repository для аналитических данных
class AnalyticsRepository {
  final AnalyticsDao _dao;

  AnalyticsRepository({required AppDatabase database})
    : _dao = AnalyticsDao(database);

  // 1. Сумма трат по категории
  Future<double> getCategoryExpenseSum({
    required String categoryId,
    required int year,
    required int month,
  }) => _dao.getCategoryExpenseSum(
    categoryId: categoryId,
    year: year,
    month: month,
  );

  // 2. Честное среднее
  Future<double> getHonestAverageExpense({
    required String categoryId,
    required int year,
  }) => _dao.getHonestAverageExpense(categoryId: categoryId, year: year);

  // 3. Подушка безопасности
  Future<double> getSafetyCushion({required String userId}) =>
      _dao.getSafetyCushion(userId: userId);

  // 4. Эффективный лимит
  Future<double> getEffectiveLimit({
    required String categoryId,
    required int year,
    required int month,
  }) =>
      _dao.getEffectiveLimit(categoryId: categoryId, year: year, month: month);

  // 5. Балансы
  Future<double> getPersonalBalance({required String userId}) =>
      _dao.getPersonalBalance(userId: userId);

  Future<double> getFamilyBalance({required String userId}) =>
      _dao.getFamilyBalance(userId: userId);

  Future<List<AccountBalance>> getPersonalBalanceDetails({
    required String userId,
  }) => _dao.getPersonalBalanceDetails(userId: userId);

  // Savings Rate
  Future<double> getSavingsRate({required int year, required int month}) =>
      _dao.getSavingsRate(year: year, month: month);
}