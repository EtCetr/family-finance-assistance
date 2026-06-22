import 'package:drift/drift.dart';

// ================= ТОМ 1: БАЗОВЫЕ СУЩНОСТИ =================

class Spaces extends Table {
  TextColumn get id => text()(); // UUID
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
  TextColumn get role => text()(); // 'admin', 'member'
  TextColumn get displayName => text()();
  TextColumn get groupStatus =>
      text().withDefault(const Constant('active'))(); // 'active', 'left'
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
  TextColumn get accountType =>
      text()(); // 'debit', 'credit', 'investment_broker', 'cash'
  TextColumn get currency => text().withDefault(const Constant('RUB'))();
  RealColumn get creditLimit => real().nullable()();
  DateTimeColumn get gracePeriodEnd => dateTime().nullable()();
  RealColumn get minPaymentAmount => real().nullable()();
  RealColumn get currentBalance => real()();
  BoolColumn get includeInPersonalBalance =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get includeInFamilyBalance =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isSharedBalance => boolean()();
  BoolColumn get isSharedExpenses => boolean()();
  TextColumn get expenseDetailLevel => text()(); // 'total_only', 'full_detail'
  BoolColumn get isSharedIncomes => boolean()();
  TextColumn get incomeDetailLevel => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class AppSettings extends Table {
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get baseCurrency => text().withDefault(const Constant('RUB'))();
  BoolColumn get useHistoricalExchangeRate => boolean()();
  BoolColumn get refundsOffsetExpenses => boolean()();
  BoolColumn get inheritLimitFromPreviousMonth => boolean()();
  BoolColumn get carryOverUnusedLimit => boolean()();
  TextColumn get limitAlertMode =>
      text()(); // 'global_percent', 'global_amount', 'individual'
  IntColumn get globalAlertPercent => integer().nullable()();
  RealColumn get globalAlertAmount => real().nullable()();
  RealColumn get largeTransactionThreshold => real()();
  IntColumn get secrecyTimeoutSeconds =>
      integer().withDefault(const Constant(120))();
  IntColumn get secrecyDaysBefore => integer()();
  BoolColumn get enableReceiveOthersSyncErrors => boolean()();
  TextColumn get digestConfig => text()(); // JSON string

  @override
  Set<Column> get primaryKey => {userId};
}

// ================= ТОМ 2: ТРАНЗАКЦИИ И ЛИМИТЫ =================

class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get accountId => text().references(Accounts, #id)();
  TextColumn get bankTransactionId => text().nullable()(); // Защита от дублей
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()(); // Всегда положительная
  TextColumn get originalCurrency => text().nullable()();
  RealColumn get originalAmount => real().nullable()();
  TextColumn get type => text()(); // 'expense', 'income', 'transfer'
  BoolColumn get isRefund => boolean().withDefault(const Constant(false))();
  TextColumn get bankCategory => text().nullable()();
  TextColumn get customCategoryId => text().nullable()();
  TextColumn get comment => text().nullable()();
  BoolColumn get isUserEdited => boolean().withDefault(const Constant(false))();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('pending'))(); // 'synced', 'pending'
  BoolColumn get isHiddenByCalendar =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get hiddenUntilDate => dateTime().nullable()();
  TextColumn get auditStatus => text().withDefault(
    const Constant('verified'),
  )(); // 'verified', 'suspicious', 'ignored'
  BoolColumn get isArchivedForSpace =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get businessMirror =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class BudgetLimits extends Table {
  TextColumn get id => text()();
  TextColumn get spaceId => text().references(Spaces, #id)();
  TextColumn get categoryId => text()();
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
  TextColumn get status => text()(); // 'potential', 'approved'
  TextColumn get lifetimeType => text()(); // 'monthly', 'weekly'
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// ================= ТОМ 3 & 4: СЛУЖЕБНЫЕ И НАСТРОЙКИ =================

class Notifications extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  TextColumn get relatedTransactionId => text().nullable()();
  TextColumn get actionTaken => text().nullable()(); // 'confirmed', 'dismissed'
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class SyncConflicts extends Table {
  TextColumn get id => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get localValue => text()(); // JSON
  TextColumn get remoteValue => text()(); // JSON
  TextColumn get resolution =>
      text().nullable()(); // 'local', 'remote', 'merged'

  @override
  Set<Column> get primaryKey => {id};
}

// Остальные таблицы (Categories, CustomDashboards, DashboardRules, CategoryRules, 
// TrustedCounterparties, ExchangeRates, CashbackReminders) создаются по аналогии 
// строго на основе полей из ТЗ v5.1.