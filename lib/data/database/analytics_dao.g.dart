// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_dao.dart';

// ignore_for_file: type=lint
mixin _$AnalyticsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SpacesTable get spaces => attachedDatabase.spaces;
  $UsersTable get users => attachedDatabase.users;
  $AccountsTable get accounts => attachedDatabase.accounts;
  $CategoriesTable get categories => attachedDatabase.categories;
  $TransactionsTable get transactions => attachedDatabase.transactions;
  $AppSettingsTable get appSettings => attachedDatabase.appSettings;
  $BudgetLimitsTable get budgetLimits => attachedDatabase.budgetLimits;
  AnalyticsDaoManager get managers => AnalyticsDaoManager(this);
}

class AnalyticsDaoManager {
  final _$AnalyticsDaoMixin _db;
  AnalyticsDaoManager(this._db);
  $$SpacesTableTableManager get spaces =>
      $$SpacesTableTableManager(_db.attachedDatabase, _db.spaces);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db.attachedDatabase, _db.accounts);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db.attachedDatabase, _db.transactions);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db.attachedDatabase, _db.appSettings);
  $$BudgetLimitsTableTableManager get budgetLimits =>
      $$BudgetLimitsTableTableManager(_db.attachedDatabase, _db.budgetLimits);
}
