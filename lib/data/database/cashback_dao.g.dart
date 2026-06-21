// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashback_dao.dart';

// ignore_for_file: type=lint
mixin _$CashbackDaoMixin on DatabaseAccessor<AppDatabase> {
  $SpacesTable get spaces => attachedDatabase.spaces;
  $UsersTable get users => attachedDatabase.users;
  $AccountsTable get accounts => attachedDatabase.accounts;
  $CashbackMatrixTable get cashbackMatrix => attachedDatabase.cashbackMatrix;
  $CashbackRemindersTable get cashbackReminders =>
      attachedDatabase.cashbackReminders;
  $CategoriesTable get categories => attachedDatabase.categories;
  $TransactionsTable get transactions => attachedDatabase.transactions;
  CashbackDaoManager get managers => CashbackDaoManager(this);
}

class CashbackDaoManager {
  final _$CashbackDaoMixin _db;
  CashbackDaoManager(this._db);
  $$SpacesTableTableManager get spaces =>
      $$SpacesTableTableManager(_db.attachedDatabase, _db.spaces);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db.attachedDatabase, _db.accounts);
  $$CashbackMatrixTableTableManager get cashbackMatrix =>
      $$CashbackMatrixTableTableManager(
        _db.attachedDatabase,
        _db.cashbackMatrix,
      );
  $$CashbackRemindersTableTableManager get cashbackReminders =>
      $$CashbackRemindersTableTableManager(
        _db.attachedDatabase,
        _db.cashbackReminders,
      );
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db.attachedDatabase, _db.transactions);
}
