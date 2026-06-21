import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/database.dart';
import '../../data/repositories/analytics_repository.dart';
import '../../data/database/analytics_dao.dart';

// ============================================================
// Repository Provider
// ============================================================

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return AnalyticsRepository(database: database);
});

// Заглушка для databaseProvider (замените на реальный)
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// ============================================================
// 1. Сумма трат по категории за месяц
// ============================================================

class CategoryExpenseParams {
  final String categoryId;
  final int year;
  final int month;

  CategoryExpenseParams({
    required this.categoryId,
    required this.year,
    required this.month,
  });
}

final categoryExpenseProvider =
    FutureProvider.family<double, CategoryExpenseParams>((ref, params) async {
      final repository = ref.watch(analyticsRepositoryProvider);
      return repository.getCategoryExpenseSum(
        categoryId: params.categoryId,
        year: params.year,
        month: params.month,
      );
    });

// ============================================================
// 2. Честное скользящее среднее
// ============================================================

class HonestAverageParams {
  final String categoryId;
  final int year;

  HonestAverageParams({required this.categoryId, required this.year});
}

final honestAverageExpenseProvider =
    FutureProvider.family<double, HonestAverageParams>((ref, params) async {
      final repository = ref.watch(analyticsRepositoryProvider);
      return repository.getHonestAverageExpense(
        categoryId: params.categoryId,
        year: params.year,
      );
    });

// ============================================================
// 3. Подушка безопасности
// ============================================================

final safetyCushionProvider = FutureProvider.family<double, String>((
  ref,
  userId,
) async {
  final repository = ref.watch(analyticsRepositoryProvider);
  return repository.getSafetyCushion(userId: userId);
});

// ============================================================
// 4. Эффективный лимит (плавающие лимиты)
// ============================================================

class EffectiveLimitParams {
  final String categoryId;
  final int year;
  final int month;

  EffectiveLimitParams({
    required this.categoryId,
    required this.year,
    required this.month,
  });
}

final effectiveLimitProvider =
    FutureProvider.family<double, EffectiveLimitParams>((ref, params) async {
      final repository = ref.watch(analyticsRepositoryProvider);
      return repository.getEffectiveLimit(
        categoryId: params.categoryId,
        year: params.year,
        month: params.month,
      );
    });

// ============================================================
// 5. Конструктор общего баланса
// ============================================================

final personalBalanceProvider = FutureProvider.family<double, String>((
  ref,
  userId,
) async {
  final repository = ref.watch(analyticsRepositoryProvider);
  return repository.getPersonalBalance(userId: userId);
});

final familyBalanceProvider = FutureProvider.family<double, String>((
  ref,
  userId,
) async {
  final repository = ref.watch(analyticsRepositoryProvider);
  return repository.getFamilyBalance(userId: userId);
});

final personalBalanceDetailsProvider =
    FutureProvider.family<List<AccountBalance>, String>((ref, userId) async {
      final repository = ref.watch(analyticsRepositoryProvider);
      return repository.getPersonalBalanceDetails(userId: userId);
    });

// ============================================================
// Savings Rate
// ============================================================

class SavingsRateParams {
  final int year;
  final int month;

  SavingsRateParams({required this.year, required this.month});
}

final savingsRateProvider = FutureProvider.family<double, SavingsRateParams>((
  ref,
  params,
) async {
  final repository = ref.watch(analyticsRepositoryProvider);
  return repository.getSavingsRate(year: params.year, month: params.month);
});