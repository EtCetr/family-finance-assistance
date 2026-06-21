import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';


part 'database.g.dart';

// ============================================================
// ENUM-ТИПЫ
// ============================================================

enum SyncStatus { pending, synced }

enum AccountType { debit, credit, investmentBroker, cash }

enum TransactionType { expense, income, transfer }

enum AuditStatus { verified, suspicious, ignored }

enum UserRole { admin, member }

enum GroupStatus { active, left }

enum CategoryType { expense, income }

enum CashbackStatus { potential, approved }

enum CashbackLifetimeType { monthly, weekly }

enum LimitAlertMode { globalPercent, globalAmount, individual }

enum NotificationAction { confirmed, dismissed }

enum DashboardTriggerType { merchantName, bankCategory, keywordInComment }

// ============================================================
// 1-17. ТАБЛИЦЫ
// ============================================================

class Spaces extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get encryptionSalt => text()();
  BoolColumn get enableSecrecyMode =>
      boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get spaceId => text().nullable().references(Spaces, #id)();
  TextColumn get role => textEnum<UserRole>()();
  TextColumn get displayName => text()();
  TextColumn get groupStatus =>
      textEnum<GroupStatus>().withDefault(const Constant('active'))();
  DateTimeColumn get leftAt => dateTime().nullable()();
  DateTimeColumn get rejoinedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Accounts extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get bankName => text()();
  TextColumn get customName => text()();
  TextColumn get cardNumberMask => text().nullable()();
  TextColumn get accountType => textEnum<AccountType>()();
  TextColumn get currency => text().withDefault(const Constant('RUB'))();
  RealColumn get creditLimit => real().nullable()();
  DateTimeColumn get gracePeriodEnd => dateTime().nullable()();
  RealColumn get minPaymentAmount => real().nullable()();
  RealColumn get currentBalance => real().withDefault(const Constant(0.0))();
  BoolColumn get includeInPersonalBalance =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get includeInFamilyBalance =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isSharedBalance =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isSharedExpenses =>
      boolean().withDefault(const Constant(false))();
  TextColumn get expenseDetailLevel =>
      text().withDefault(const Constant('total_only'))();
  BoolColumn get isSharedIncomes =>
      boolean().withDefault(const Constant(false))();
  TextColumn get incomeDetailLevel =>
      text().withDefault(const Constant('total_only'))();

  @override
  Set<Column> get primaryKey => {id};
}

class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get spaceId => text().nullable().references(Spaces, #id)();
  TextColumn get parentId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get type => textEnum<CategoryType>()();
  BoolColumn get isPinnedForCashback =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get accountId => text().references(Accounts, #id)();
  TextColumn get bankTransactionId => text().nullable().unique()();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
  TextColumn get originalCurrency => text().nullable()();
  RealColumn get originalAmount => real().nullable()();
  TextColumn get type => textEnum<TransactionType>()();
  BoolColumn get isRefund => boolean().withDefault(const Constant(false))();
  TextColumn get bankCategory => text().nullable()();
  TextColumn get customCategoryId =>
      text().nullable().references(Categories, #id)();
  TextColumn get comment => text().nullable()();
  BoolColumn get isUserEdited => boolean().withDefault(const Constant(false))();
  TextColumn get syncStatus =>
      textEnum<SyncStatus>().withDefault(const Constant('pending'))();
  BoolColumn get isHiddenByCalendar =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get hiddenUntilDate => dateTime().nullable()();
  TextColumn get auditStatus =>
      textEnum<AuditStatus>().withDefault(const Constant('verified'))();
  BoolColumn get isArchivedForSpace =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get businessMirror =>
      boolean().withDefault(const Constant(false))();

  @override
  String? get tableName => 'transactions';

  @override
  Set<Column> get primaryKey => {id};
}

class CustomDashboards extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get dashboardName => text()();
  BoolColumn get isEnabledPAndL =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class DashboardTransactions extends Table {
  TextColumn get dashboardId => text().references(CustomDashboards, #id)();
  TextColumn get transactionId => text().references(Transactions, #id)();

  @override
  Set<Column> get primaryKey => {dashboardId, transactionId};
}

class DashboardRules extends Table {
  TextColumn get id => text()();
  TextColumn get dashboardId => text().references(CustomDashboards, #id)();
  TextColumn get triggerType => textEnum<DashboardTriggerType>()();
  TextColumn get triggerValue => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class CategoryRules extends Table {
  TextColumn get id => text()();
  TextColumn get spaceId => text().references(Spaces, #id)();
  TextColumn get bankName => text()(); // 'ANY' или конкретный банк
  TextColumn get triggerString => text()();
  TextColumn get targetCategoryId => text().references(Categories, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class TrustedCounterparties extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get counterpartyIdentity => text()();
  BoolColumn get excludeExpenses =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get excludeIncomes =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class BudgetLimits extends Table {
  TextColumn get id => text()();
  TextColumn get spaceId => text().references(Spaces, #id)();
  TextColumn get categoryId => text().references(Categories, #id)();
  IntColumn get year => integer()();
  IntColumn get month => integer()();
  RealColumn get limitAmount => real()();
  IntColumn get alertPercent => integer().nullable()();
  RealColumn get alertAmount => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class CashbackMatrix extends Table {
  TextColumn get id => text()();
  TextColumn get accountId => text().references(Accounts, #id)();
  TextColumn get categoryName => text()();
  RealColumn get percent => real()();
  TextColumn get status => textEnum<CashbackStatus>()();
  TextColumn get lifetimeType => textEnum<CashbackLifetimeType>()();
  DateTimeColumn get expiresAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class ExchangeRates extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get fromCurrency => text()();
  TextColumn get toCurrency => text()();
  RealColumn get rate => real()();
  TextColumn get source => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class AppSettings extends Table {
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get baseCurrency => text().withDefault(const Constant('RUB'))();
  BoolColumn get useHistoricalExchangeRate =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get refundsOffsetExpenses =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get inheritLimitFromPreviousMonth =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get carryOverUnusedLimit =>
      boolean().withDefault(const Constant(false))();
  TextColumn get limitAlertMode =>
      textEnum<LimitAlertMode>().withDefault(const Constant('globalPercent'))();
  IntColumn get globalAlertPercent =>
      integer().withDefault(const Constant(80))();
  RealColumn get globalAlertAmount => real().nullable()();
  RealColumn get largeTransactionThreshold =>
      real().withDefault(const Constant(10000.0))();
  IntColumn get secrecyTimeoutSeconds =>
      integer().withDefault(const Constant(120))();
  IntColumn get secrecyDaysBefore => integer().withDefault(const Constant(7))();
  BoolColumn get enableReceiveOthersSyncErrors =>
      boolean().withDefault(const Constant(false))();
  TextColumn get digestConfig => text().nullable()();

  @override
  Set<Column> get primaryKey => {userId};
}

class Notifications extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  TextColumn get relatedTransactionId => text().nullable()();
  TextColumn get actionTaken => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class CashbackReminders extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  DateTimeColumn get scheduledAt => dateTime()();
  TextColumn get repeatType => text()(); // daily/weekly/monthly/none
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

class SyncConflicts extends Table {
  TextColumn get id => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get localValue => text()();
  TextColumn get remoteValue => text()();
  TextColumn get resolution => text().nullable()(); // 'local'/'remote'/'merged'
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Spaces,
    Users,
    Accounts,
    Categories,
    Transactions,
    CustomDashboards,
    DashboardTransactions,
    DashboardRules,
    CategoryRules,
    TrustedCounterparties,
    BudgetLimits,
    CashbackMatrix,
    ExchangeRates,
    AppSettings,
    Notifications,
    CashbackReminders,
    SyncConflicts,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Будущие миграции
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      await customStatement('PRAGMA journal_mode = WAL');
    },
  );
}

// ============================================================
// 🔌 ОТКРЫТИЕ СОЕДИНЕНИЯ
// ============================================================
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/family_finance.sqlite');

    return driftDatabase(
      name: 'family_finance',
      native: DriftNativeOptions(databasePath: () async => file.path),
    );
  });
}
