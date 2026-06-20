// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SpacesTable extends Spaces with TableInfo<$SpacesTable, Space> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _encryptionSaltMeta = const VerificationMeta(
    'encryptionSalt',
  );
  @override
  late final GeneratedColumn<String> encryptionSalt = GeneratedColumn<String>(
    'encryption_salt',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enableSecrecyModeMeta = const VerificationMeta(
    'enableSecrecyMode',
  );
  @override
  late final GeneratedColumn<bool> enableSecrecyMode = GeneratedColumn<bool>(
    'enable_secrecy_mode',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enable_secrecy_mode" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    encryptionSalt,
    enableSecrecyMode,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'spaces';
  @override
  VerificationContext validateIntegrity(
    Insertable<Space> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('encryption_salt')) {
      context.handle(
        _encryptionSaltMeta,
        encryptionSalt.isAcceptableOrUnknown(
          data['encryption_salt']!,
          _encryptionSaltMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_encryptionSaltMeta);
    }
    if (data.containsKey('enable_secrecy_mode')) {
      context.handle(
        _enableSecrecyModeMeta,
        enableSecrecyMode.isAcceptableOrUnknown(
          data['enable_secrecy_mode']!,
          _enableSecrecyModeMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Space map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Space(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      encryptionSalt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}encryption_salt'],
      )!,
      enableSecrecyMode: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enable_secrecy_mode'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SpacesTable createAlias(String alias) {
    return $SpacesTable(attachedDatabase, alias);
  }
}

class Space extends DataClass implements Insertable<Space> {
  final String id;
  final String name;
  final String encryptionSalt;
  final bool enableSecrecyMode;
  final DateTime createdAt;
  const Space({
    required this.id,
    required this.name,
    required this.encryptionSalt,
    required this.enableSecrecyMode,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['encryption_salt'] = Variable<String>(encryptionSalt);
    map['enable_secrecy_mode'] = Variable<bool>(enableSecrecyMode);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SpacesCompanion toCompanion(bool nullToAbsent) {
    return SpacesCompanion(
      id: Value(id),
      name: Value(name),
      encryptionSalt: Value(encryptionSalt),
      enableSecrecyMode: Value(enableSecrecyMode),
      createdAt: Value(createdAt),
    );
  }

  factory Space.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Space(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      encryptionSalt: serializer.fromJson<String>(json['encryptionSalt']),
      enableSecrecyMode: serializer.fromJson<bool>(json['enableSecrecyMode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'encryptionSalt': serializer.toJson<String>(encryptionSalt),
      'enableSecrecyMode': serializer.toJson<bool>(enableSecrecyMode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Space copyWith({
    String? id,
    String? name,
    String? encryptionSalt,
    bool? enableSecrecyMode,
    DateTime? createdAt,
  }) => Space(
    id: id ?? this.id,
    name: name ?? this.name,
    encryptionSalt: encryptionSalt ?? this.encryptionSalt,
    enableSecrecyMode: enableSecrecyMode ?? this.enableSecrecyMode,
    createdAt: createdAt ?? this.createdAt,
  );
  Space copyWithCompanion(SpacesCompanion data) {
    return Space(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      encryptionSalt: data.encryptionSalt.present
          ? data.encryptionSalt.value
          : this.encryptionSalt,
      enableSecrecyMode: data.enableSecrecyMode.present
          ? data.enableSecrecyMode.value
          : this.enableSecrecyMode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Space(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('encryptionSalt: $encryptionSalt, ')
          ..write('enableSecrecyMode: $enableSecrecyMode, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, encryptionSalt, enableSecrecyMode, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Space &&
          other.id == this.id &&
          other.name == this.name &&
          other.encryptionSalt == this.encryptionSalt &&
          other.enableSecrecyMode == this.enableSecrecyMode &&
          other.createdAt == this.createdAt);
}

class SpacesCompanion extends UpdateCompanion<Space> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> encryptionSalt;
  final Value<bool> enableSecrecyMode;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SpacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.encryptionSalt = const Value.absent(),
    this.enableSecrecyMode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpacesCompanion.insert({
    required String id,
    required String name,
    required String encryptionSalt,
    this.enableSecrecyMode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       encryptionSalt = Value(encryptionSalt);
  static Insertable<Space> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? encryptionSalt,
    Expression<bool>? enableSecrecyMode,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (encryptionSalt != null) 'encryption_salt': encryptionSalt,
      if (enableSecrecyMode != null) 'enable_secrecy_mode': enableSecrecyMode,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpacesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? encryptionSalt,
    Value<bool>? enableSecrecyMode,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return SpacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      encryptionSalt: encryptionSalt ?? this.encryptionSalt,
      enableSecrecyMode: enableSecrecyMode ?? this.enableSecrecyMode,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (encryptionSalt.present) {
      map['encryption_salt'] = Variable<String>(encryptionSalt.value);
    }
    if (enableSecrecyMode.present) {
      map['enable_secrecy_mode'] = Variable<bool>(enableSecrecyMode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpacesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('encryptionSalt: $encryptionSalt, ')
          ..write('enableSecrecyMode: $enableSecrecyMode, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spaceIdMeta = const VerificationMeta(
    'spaceId',
  );
  @override
  late final GeneratedColumn<String> spaceId = GeneratedColumn<String>(
    'space_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES spaces (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<UserRole, String> role =
      GeneratedColumn<String>(
        'role',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UserRole>($UsersTable.$converterrole);
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<GroupStatus, String> groupStatus =
      GeneratedColumn<String>(
        'group_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('active'),
      ).withConverter<GroupStatus>($UsersTable.$convertergroupStatus);
  static const VerificationMeta _leftAtMeta = const VerificationMeta('leftAt');
  @override
  late final GeneratedColumn<DateTime> leftAt = GeneratedColumn<DateTime>(
    'left_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rejoinedAtMeta = const VerificationMeta(
    'rejoinedAt',
  );
  @override
  late final GeneratedColumn<DateTime> rejoinedAt = GeneratedColumn<DateTime>(
    'rejoined_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    spaceId,
    role,
    displayName,
    groupStatus,
    leftAt,
    rejoinedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('space_id')) {
      context.handle(
        _spaceIdMeta,
        spaceId.isAcceptableOrUnknown(data['space_id']!, _spaceIdMeta),
      );
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('left_at')) {
      context.handle(
        _leftAtMeta,
        leftAt.isAcceptableOrUnknown(data['left_at']!, _leftAtMeta),
      );
    }
    if (data.containsKey('rejoined_at')) {
      context.handle(
        _rejoinedAtMeta,
        rejoinedAt.isAcceptableOrUnknown(data['rejoined_at']!, _rejoinedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      spaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}space_id'],
      ),
      role: $UsersTable.$converterrole.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}role'],
        )!,
      ),
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      groupStatus: $UsersTable.$convertergroupStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}group_status'],
        )!,
      ),
      leftAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}left_at'],
      ),
      rejoinedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}rejoined_at'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserRole, String, String> $converterrole =
      const EnumNameConverter<UserRole>(UserRole.values);
  static JsonTypeConverter2<GroupStatus, String, String> $convertergroupStatus =
      const EnumNameConverter<GroupStatus>(GroupStatus.values);
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String? spaceId;
  final UserRole role;
  final String displayName;
  final GroupStatus groupStatus;
  final DateTime? leftAt;
  final DateTime? rejoinedAt;
  const User({
    required this.id,
    this.spaceId,
    required this.role,
    required this.displayName,
    required this.groupStatus,
    this.leftAt,
    this.rejoinedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || spaceId != null) {
      map['space_id'] = Variable<String>(spaceId);
    }
    {
      map['role'] = Variable<String>($UsersTable.$converterrole.toSql(role));
    }
    map['display_name'] = Variable<String>(displayName);
    {
      map['group_status'] = Variable<String>(
        $UsersTable.$convertergroupStatus.toSql(groupStatus),
      );
    }
    if (!nullToAbsent || leftAt != null) {
      map['left_at'] = Variable<DateTime>(leftAt);
    }
    if (!nullToAbsent || rejoinedAt != null) {
      map['rejoined_at'] = Variable<DateTime>(rejoinedAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      spaceId: spaceId == null && nullToAbsent
          ? const Value.absent()
          : Value(spaceId),
      role: Value(role),
      displayName: Value(displayName),
      groupStatus: Value(groupStatus),
      leftAt: leftAt == null && nullToAbsent
          ? const Value.absent()
          : Value(leftAt),
      rejoinedAt: rejoinedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(rejoinedAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      spaceId: serializer.fromJson<String?>(json['spaceId']),
      role: $UsersTable.$converterrole.fromJson(
        serializer.fromJson<String>(json['role']),
      ),
      displayName: serializer.fromJson<String>(json['displayName']),
      groupStatus: $UsersTable.$convertergroupStatus.fromJson(
        serializer.fromJson<String>(json['groupStatus']),
      ),
      leftAt: serializer.fromJson<DateTime?>(json['leftAt']),
      rejoinedAt: serializer.fromJson<DateTime?>(json['rejoinedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'spaceId': serializer.toJson<String?>(spaceId),
      'role': serializer.toJson<String>(
        $UsersTable.$converterrole.toJson(role),
      ),
      'displayName': serializer.toJson<String>(displayName),
      'groupStatus': serializer.toJson<String>(
        $UsersTable.$convertergroupStatus.toJson(groupStatus),
      ),
      'leftAt': serializer.toJson<DateTime?>(leftAt),
      'rejoinedAt': serializer.toJson<DateTime?>(rejoinedAt),
    };
  }

  User copyWith({
    String? id,
    Value<String?> spaceId = const Value.absent(),
    UserRole? role,
    String? displayName,
    GroupStatus? groupStatus,
    Value<DateTime?> leftAt = const Value.absent(),
    Value<DateTime?> rejoinedAt = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    spaceId: spaceId.present ? spaceId.value : this.spaceId,
    role: role ?? this.role,
    displayName: displayName ?? this.displayName,
    groupStatus: groupStatus ?? this.groupStatus,
    leftAt: leftAt.present ? leftAt.value : this.leftAt,
    rejoinedAt: rejoinedAt.present ? rejoinedAt.value : this.rejoinedAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      spaceId: data.spaceId.present ? data.spaceId.value : this.spaceId,
      role: data.role.present ? data.role.value : this.role,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      groupStatus: data.groupStatus.present
          ? data.groupStatus.value
          : this.groupStatus,
      leftAt: data.leftAt.present ? data.leftAt.value : this.leftAt,
      rejoinedAt: data.rejoinedAt.present
          ? data.rejoinedAt.value
          : this.rejoinedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('spaceId: $spaceId, ')
          ..write('role: $role, ')
          ..write('displayName: $displayName, ')
          ..write('groupStatus: $groupStatus, ')
          ..write('leftAt: $leftAt, ')
          ..write('rejoinedAt: $rejoinedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    spaceId,
    role,
    displayName,
    groupStatus,
    leftAt,
    rejoinedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.spaceId == this.spaceId &&
          other.role == this.role &&
          other.displayName == this.displayName &&
          other.groupStatus == this.groupStatus &&
          other.leftAt == this.leftAt &&
          other.rejoinedAt == this.rejoinedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String?> spaceId;
  final Value<UserRole> role;
  final Value<String> displayName;
  final Value<GroupStatus> groupStatus;
  final Value<DateTime?> leftAt;
  final Value<DateTime?> rejoinedAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.spaceId = const Value.absent(),
    this.role = const Value.absent(),
    this.displayName = const Value.absent(),
    this.groupStatus = const Value.absent(),
    this.leftAt = const Value.absent(),
    this.rejoinedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    this.spaceId = const Value.absent(),
    required UserRole role,
    required String displayName,
    this.groupStatus = const Value.absent(),
    this.leftAt = const Value.absent(),
    this.rejoinedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       role = Value(role),
       displayName = Value(displayName);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? spaceId,
    Expression<String>? role,
    Expression<String>? displayName,
    Expression<String>? groupStatus,
    Expression<DateTime>? leftAt,
    Expression<DateTime>? rejoinedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (spaceId != null) 'space_id': spaceId,
      if (role != null) 'role': role,
      if (displayName != null) 'display_name': displayName,
      if (groupStatus != null) 'group_status': groupStatus,
      if (leftAt != null) 'left_at': leftAt,
      if (rejoinedAt != null) 'rejoined_at': rejoinedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String?>? spaceId,
    Value<UserRole>? role,
    Value<String>? displayName,
    Value<GroupStatus>? groupStatus,
    Value<DateTime?>? leftAt,
    Value<DateTime?>? rejoinedAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      spaceId: spaceId ?? this.spaceId,
      role: role ?? this.role,
      displayName: displayName ?? this.displayName,
      groupStatus: groupStatus ?? this.groupStatus,
      leftAt: leftAt ?? this.leftAt,
      rejoinedAt: rejoinedAt ?? this.rejoinedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (spaceId.present) {
      map['space_id'] = Variable<String>(spaceId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(
        $UsersTable.$converterrole.toSql(role.value),
      );
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (groupStatus.present) {
      map['group_status'] = Variable<String>(
        $UsersTable.$convertergroupStatus.toSql(groupStatus.value),
      );
    }
    if (leftAt.present) {
      map['left_at'] = Variable<DateTime>(leftAt.value);
    }
    if (rejoinedAt.present) {
      map['rejoined_at'] = Variable<DateTime>(rejoinedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('spaceId: $spaceId, ')
          ..write('role: $role, ')
          ..write('displayName: $displayName, ')
          ..write('groupStatus: $groupStatus, ')
          ..write('leftAt: $leftAt, ')
          ..write('rejoinedAt: $rejoinedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customNameMeta = const VerificationMeta(
    'customName',
  );
  @override
  late final GeneratedColumn<String> customName = GeneratedColumn<String>(
    'custom_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardNumberMaskMeta = const VerificationMeta(
    'cardNumberMask',
  );
  @override
  late final GeneratedColumn<String> cardNumberMask = GeneratedColumn<String>(
    'card_number_mask',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, String> accountType =
      GeneratedColumn<String>(
        'account_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AccountType>($AccountsTable.$converteraccountType);
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('RUB'),
  );
  static const VerificationMeta _creditLimitMeta = const VerificationMeta(
    'creditLimit',
  );
  @override
  late final GeneratedColumn<double> creditLimit = GeneratedColumn<double>(
    'credit_limit',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gracePeriodEndMeta = const VerificationMeta(
    'gracePeriodEnd',
  );
  @override
  late final GeneratedColumn<DateTime> gracePeriodEnd =
      GeneratedColumn<DateTime>(
        'grace_period_end',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _minPaymentAmountMeta = const VerificationMeta(
    'minPaymentAmount',
  );
  @override
  late final GeneratedColumn<double> minPaymentAmount = GeneratedColumn<double>(
    'min_payment_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentBalanceMeta = const VerificationMeta(
    'currentBalance',
  );
  @override
  late final GeneratedColumn<double> currentBalance = GeneratedColumn<double>(
    'current_balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _includeInPersonalBalanceMeta =
      const VerificationMeta('includeInPersonalBalance');
  @override
  late final GeneratedColumn<bool> includeInPersonalBalance =
      GeneratedColumn<bool>(
        'include_in_personal_balance',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("include_in_personal_balance" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _includeInFamilyBalanceMeta =
      const VerificationMeta('includeInFamilyBalance');
  @override
  late final GeneratedColumn<bool> includeInFamilyBalance =
      GeneratedColumn<bool>(
        'include_in_family_balance',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("include_in_family_balance" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _isSharedBalanceMeta = const VerificationMeta(
    'isSharedBalance',
  );
  @override
  late final GeneratedColumn<bool> isSharedBalance = GeneratedColumn<bool>(
    'is_shared_balance',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_shared_balance" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSharedExpensesMeta = const VerificationMeta(
    'isSharedExpenses',
  );
  @override
  late final GeneratedColumn<bool> isSharedExpenses = GeneratedColumn<bool>(
    'is_shared_expenses',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_shared_expenses" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _expenseDetailLevelMeta =
      const VerificationMeta('expenseDetailLevel');
  @override
  late final GeneratedColumn<String> expenseDetailLevel =
      GeneratedColumn<String>(
        'expense_detail_level',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('total_only'),
      );
  static const VerificationMeta _isSharedIncomesMeta = const VerificationMeta(
    'isSharedIncomes',
  );
  @override
  late final GeneratedColumn<bool> isSharedIncomes = GeneratedColumn<bool>(
    'is_shared_incomes',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_shared_incomes" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _incomeDetailLevelMeta = const VerificationMeta(
    'incomeDetailLevel',
  );
  @override
  late final GeneratedColumn<String> incomeDetailLevel =
      GeneratedColumn<String>(
        'income_detail_level',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('total_only'),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    bankName,
    customName,
    cardNumberMask,
    accountType,
    currency,
    creditLimit,
    gracePeriodEnd,
    minPaymentAmount,
    currentBalance,
    includeInPersonalBalance,
    includeInFamilyBalance,
    isSharedBalance,
    isSharedExpenses,
    expenseDetailLevel,
    isSharedIncomes,
    incomeDetailLevel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Account> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    } else if (isInserting) {
      context.missing(_bankNameMeta);
    }
    if (data.containsKey('custom_name')) {
      context.handle(
        _customNameMeta,
        customName.isAcceptableOrUnknown(data['custom_name']!, _customNameMeta),
      );
    } else if (isInserting) {
      context.missing(_customNameMeta);
    }
    if (data.containsKey('card_number_mask')) {
      context.handle(
        _cardNumberMaskMeta,
        cardNumberMask.isAcceptableOrUnknown(
          data['card_number_mask']!,
          _cardNumberMaskMeta,
        ),
      );
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
        _creditLimitMeta,
        creditLimit.isAcceptableOrUnknown(
          data['credit_limit']!,
          _creditLimitMeta,
        ),
      );
    }
    if (data.containsKey('grace_period_end')) {
      context.handle(
        _gracePeriodEndMeta,
        gracePeriodEnd.isAcceptableOrUnknown(
          data['grace_period_end']!,
          _gracePeriodEndMeta,
        ),
      );
    }
    if (data.containsKey('min_payment_amount')) {
      context.handle(
        _minPaymentAmountMeta,
        minPaymentAmount.isAcceptableOrUnknown(
          data['min_payment_amount']!,
          _minPaymentAmountMeta,
        ),
      );
    }
    if (data.containsKey('current_balance')) {
      context.handle(
        _currentBalanceMeta,
        currentBalance.isAcceptableOrUnknown(
          data['current_balance']!,
          _currentBalanceMeta,
        ),
      );
    }
    if (data.containsKey('include_in_personal_balance')) {
      context.handle(
        _includeInPersonalBalanceMeta,
        includeInPersonalBalance.isAcceptableOrUnknown(
          data['include_in_personal_balance']!,
          _includeInPersonalBalanceMeta,
        ),
      );
    }
    if (data.containsKey('include_in_family_balance')) {
      context.handle(
        _includeInFamilyBalanceMeta,
        includeInFamilyBalance.isAcceptableOrUnknown(
          data['include_in_family_balance']!,
          _includeInFamilyBalanceMeta,
        ),
      );
    }
    if (data.containsKey('is_shared_balance')) {
      context.handle(
        _isSharedBalanceMeta,
        isSharedBalance.isAcceptableOrUnknown(
          data['is_shared_balance']!,
          _isSharedBalanceMeta,
        ),
      );
    }
    if (data.containsKey('is_shared_expenses')) {
      context.handle(
        _isSharedExpensesMeta,
        isSharedExpenses.isAcceptableOrUnknown(
          data['is_shared_expenses']!,
          _isSharedExpensesMeta,
        ),
      );
    }
    if (data.containsKey('expense_detail_level')) {
      context.handle(
        _expenseDetailLevelMeta,
        expenseDetailLevel.isAcceptableOrUnknown(
          data['expense_detail_level']!,
          _expenseDetailLevelMeta,
        ),
      );
    }
    if (data.containsKey('is_shared_incomes')) {
      context.handle(
        _isSharedIncomesMeta,
        isSharedIncomes.isAcceptableOrUnknown(
          data['is_shared_incomes']!,
          _isSharedIncomesMeta,
        ),
      );
    }
    if (data.containsKey('income_detail_level')) {
      context.handle(
        _incomeDetailLevelMeta,
        incomeDetailLevel.isAcceptableOrUnknown(
          data['income_detail_level']!,
          _incomeDetailLevelMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      )!,
      customName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_name'],
      )!,
      cardNumberMask: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_number_mask'],
      ),
      accountType: $AccountsTable.$converteraccountType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}account_type'],
        )!,
      ),
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      creditLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}credit_limit'],
      ),
      gracePeriodEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}grace_period_end'],
      ),
      minPaymentAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}min_payment_amount'],
      ),
      currentBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_balance'],
      )!,
      includeInPersonalBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}include_in_personal_balance'],
      )!,
      includeInFamilyBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}include_in_family_balance'],
      )!,
      isSharedBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_shared_balance'],
      )!,
      isSharedExpenses: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_shared_expenses'],
      )!,
      expenseDetailLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expense_detail_level'],
      )!,
      isSharedIncomes: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_shared_incomes'],
      )!,
      incomeDetailLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}income_detail_level'],
      )!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, String, String> $converteraccountType =
      const EnumNameConverter<AccountType>(AccountType.values);
}

class Account extends DataClass implements Insertable<Account> {
  final String id;
  final String userId;
  final String bankName;
  final String customName;
  final String? cardNumberMask;
  final AccountType accountType;
  final String currency;
  final double? creditLimit;
  final DateTime? gracePeriodEnd;
  final double? minPaymentAmount;
  final double currentBalance;
  final bool includeInPersonalBalance;
  final bool includeInFamilyBalance;
  final bool isSharedBalance;
  final bool isSharedExpenses;
  final String expenseDetailLevel;
  final bool isSharedIncomes;
  final String incomeDetailLevel;
  const Account({
    required this.id,
    required this.userId,
    required this.bankName,
    required this.customName,
    this.cardNumberMask,
    required this.accountType,
    required this.currency,
    this.creditLimit,
    this.gracePeriodEnd,
    this.minPaymentAmount,
    required this.currentBalance,
    required this.includeInPersonalBalance,
    required this.includeInFamilyBalance,
    required this.isSharedBalance,
    required this.isSharedExpenses,
    required this.expenseDetailLevel,
    required this.isSharedIncomes,
    required this.incomeDetailLevel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['bank_name'] = Variable<String>(bankName);
    map['custom_name'] = Variable<String>(customName);
    if (!nullToAbsent || cardNumberMask != null) {
      map['card_number_mask'] = Variable<String>(cardNumberMask);
    }
    {
      map['account_type'] = Variable<String>(
        $AccountsTable.$converteraccountType.toSql(accountType),
      );
    }
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || creditLimit != null) {
      map['credit_limit'] = Variable<double>(creditLimit);
    }
    if (!nullToAbsent || gracePeriodEnd != null) {
      map['grace_period_end'] = Variable<DateTime>(gracePeriodEnd);
    }
    if (!nullToAbsent || minPaymentAmount != null) {
      map['min_payment_amount'] = Variable<double>(minPaymentAmount);
    }
    map['current_balance'] = Variable<double>(currentBalance);
    map['include_in_personal_balance'] = Variable<bool>(
      includeInPersonalBalance,
    );
    map['include_in_family_balance'] = Variable<bool>(includeInFamilyBalance);
    map['is_shared_balance'] = Variable<bool>(isSharedBalance);
    map['is_shared_expenses'] = Variable<bool>(isSharedExpenses);
    map['expense_detail_level'] = Variable<String>(expenseDetailLevel);
    map['is_shared_incomes'] = Variable<bool>(isSharedIncomes);
    map['income_detail_level'] = Variable<String>(incomeDetailLevel);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      userId: Value(userId),
      bankName: Value(bankName),
      customName: Value(customName),
      cardNumberMask: cardNumberMask == null && nullToAbsent
          ? const Value.absent()
          : Value(cardNumberMask),
      accountType: Value(accountType),
      currency: Value(currency),
      creditLimit: creditLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(creditLimit),
      gracePeriodEnd: gracePeriodEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(gracePeriodEnd),
      minPaymentAmount: minPaymentAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(minPaymentAmount),
      currentBalance: Value(currentBalance),
      includeInPersonalBalance: Value(includeInPersonalBalance),
      includeInFamilyBalance: Value(includeInFamilyBalance),
      isSharedBalance: Value(isSharedBalance),
      isSharedExpenses: Value(isSharedExpenses),
      expenseDetailLevel: Value(expenseDetailLevel),
      isSharedIncomes: Value(isSharedIncomes),
      incomeDetailLevel: Value(incomeDetailLevel),
    );
  }

  factory Account.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      bankName: serializer.fromJson<String>(json['bankName']),
      customName: serializer.fromJson<String>(json['customName']),
      cardNumberMask: serializer.fromJson<String?>(json['cardNumberMask']),
      accountType: $AccountsTable.$converteraccountType.fromJson(
        serializer.fromJson<String>(json['accountType']),
      ),
      currency: serializer.fromJson<String>(json['currency']),
      creditLimit: serializer.fromJson<double?>(json['creditLimit']),
      gracePeriodEnd: serializer.fromJson<DateTime?>(json['gracePeriodEnd']),
      minPaymentAmount: serializer.fromJson<double?>(json['minPaymentAmount']),
      currentBalance: serializer.fromJson<double>(json['currentBalance']),
      includeInPersonalBalance: serializer.fromJson<bool>(
        json['includeInPersonalBalance'],
      ),
      includeInFamilyBalance: serializer.fromJson<bool>(
        json['includeInFamilyBalance'],
      ),
      isSharedBalance: serializer.fromJson<bool>(json['isSharedBalance']),
      isSharedExpenses: serializer.fromJson<bool>(json['isSharedExpenses']),
      expenseDetailLevel: serializer.fromJson<String>(
        json['expenseDetailLevel'],
      ),
      isSharedIncomes: serializer.fromJson<bool>(json['isSharedIncomes']),
      incomeDetailLevel: serializer.fromJson<String>(json['incomeDetailLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'bankName': serializer.toJson<String>(bankName),
      'customName': serializer.toJson<String>(customName),
      'cardNumberMask': serializer.toJson<String?>(cardNumberMask),
      'accountType': serializer.toJson<String>(
        $AccountsTable.$converteraccountType.toJson(accountType),
      ),
      'currency': serializer.toJson<String>(currency),
      'creditLimit': serializer.toJson<double?>(creditLimit),
      'gracePeriodEnd': serializer.toJson<DateTime?>(gracePeriodEnd),
      'minPaymentAmount': serializer.toJson<double?>(minPaymentAmount),
      'currentBalance': serializer.toJson<double>(currentBalance),
      'includeInPersonalBalance': serializer.toJson<bool>(
        includeInPersonalBalance,
      ),
      'includeInFamilyBalance': serializer.toJson<bool>(includeInFamilyBalance),
      'isSharedBalance': serializer.toJson<bool>(isSharedBalance),
      'isSharedExpenses': serializer.toJson<bool>(isSharedExpenses),
      'expenseDetailLevel': serializer.toJson<String>(expenseDetailLevel),
      'isSharedIncomes': serializer.toJson<bool>(isSharedIncomes),
      'incomeDetailLevel': serializer.toJson<String>(incomeDetailLevel),
    };
  }

  Account copyWith({
    String? id,
    String? userId,
    String? bankName,
    String? customName,
    Value<String?> cardNumberMask = const Value.absent(),
    AccountType? accountType,
    String? currency,
    Value<double?> creditLimit = const Value.absent(),
    Value<DateTime?> gracePeriodEnd = const Value.absent(),
    Value<double?> minPaymentAmount = const Value.absent(),
    double? currentBalance,
    bool? includeInPersonalBalance,
    bool? includeInFamilyBalance,
    bool? isSharedBalance,
    bool? isSharedExpenses,
    String? expenseDetailLevel,
    bool? isSharedIncomes,
    String? incomeDetailLevel,
  }) => Account(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    bankName: bankName ?? this.bankName,
    customName: customName ?? this.customName,
    cardNumberMask: cardNumberMask.present
        ? cardNumberMask.value
        : this.cardNumberMask,
    accountType: accountType ?? this.accountType,
    currency: currency ?? this.currency,
    creditLimit: creditLimit.present ? creditLimit.value : this.creditLimit,
    gracePeriodEnd: gracePeriodEnd.present
        ? gracePeriodEnd.value
        : this.gracePeriodEnd,
    minPaymentAmount: minPaymentAmount.present
        ? minPaymentAmount.value
        : this.minPaymentAmount,
    currentBalance: currentBalance ?? this.currentBalance,
    includeInPersonalBalance:
        includeInPersonalBalance ?? this.includeInPersonalBalance,
    includeInFamilyBalance:
        includeInFamilyBalance ?? this.includeInFamilyBalance,
    isSharedBalance: isSharedBalance ?? this.isSharedBalance,
    isSharedExpenses: isSharedExpenses ?? this.isSharedExpenses,
    expenseDetailLevel: expenseDetailLevel ?? this.expenseDetailLevel,
    isSharedIncomes: isSharedIncomes ?? this.isSharedIncomes,
    incomeDetailLevel: incomeDetailLevel ?? this.incomeDetailLevel,
  );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      customName: data.customName.present
          ? data.customName.value
          : this.customName,
      cardNumberMask: data.cardNumberMask.present
          ? data.cardNumberMask.value
          : this.cardNumberMask,
      accountType: data.accountType.present
          ? data.accountType.value
          : this.accountType,
      currency: data.currency.present ? data.currency.value : this.currency,
      creditLimit: data.creditLimit.present
          ? data.creditLimit.value
          : this.creditLimit,
      gracePeriodEnd: data.gracePeriodEnd.present
          ? data.gracePeriodEnd.value
          : this.gracePeriodEnd,
      minPaymentAmount: data.minPaymentAmount.present
          ? data.minPaymentAmount.value
          : this.minPaymentAmount,
      currentBalance: data.currentBalance.present
          ? data.currentBalance.value
          : this.currentBalance,
      includeInPersonalBalance: data.includeInPersonalBalance.present
          ? data.includeInPersonalBalance.value
          : this.includeInPersonalBalance,
      includeInFamilyBalance: data.includeInFamilyBalance.present
          ? data.includeInFamilyBalance.value
          : this.includeInFamilyBalance,
      isSharedBalance: data.isSharedBalance.present
          ? data.isSharedBalance.value
          : this.isSharedBalance,
      isSharedExpenses: data.isSharedExpenses.present
          ? data.isSharedExpenses.value
          : this.isSharedExpenses,
      expenseDetailLevel: data.expenseDetailLevel.present
          ? data.expenseDetailLevel.value
          : this.expenseDetailLevel,
      isSharedIncomes: data.isSharedIncomes.present
          ? data.isSharedIncomes.value
          : this.isSharedIncomes,
      incomeDetailLevel: data.incomeDetailLevel.present
          ? data.incomeDetailLevel.value
          : this.incomeDetailLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('bankName: $bankName, ')
          ..write('customName: $customName, ')
          ..write('cardNumberMask: $cardNumberMask, ')
          ..write('accountType: $accountType, ')
          ..write('currency: $currency, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('gracePeriodEnd: $gracePeriodEnd, ')
          ..write('minPaymentAmount: $minPaymentAmount, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('includeInPersonalBalance: $includeInPersonalBalance, ')
          ..write('includeInFamilyBalance: $includeInFamilyBalance, ')
          ..write('isSharedBalance: $isSharedBalance, ')
          ..write('isSharedExpenses: $isSharedExpenses, ')
          ..write('expenseDetailLevel: $expenseDetailLevel, ')
          ..write('isSharedIncomes: $isSharedIncomes, ')
          ..write('incomeDetailLevel: $incomeDetailLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    bankName,
    customName,
    cardNumberMask,
    accountType,
    currency,
    creditLimit,
    gracePeriodEnd,
    minPaymentAmount,
    currentBalance,
    includeInPersonalBalance,
    includeInFamilyBalance,
    isSharedBalance,
    isSharedExpenses,
    expenseDetailLevel,
    isSharedIncomes,
    incomeDetailLevel,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.bankName == this.bankName &&
          other.customName == this.customName &&
          other.cardNumberMask == this.cardNumberMask &&
          other.accountType == this.accountType &&
          other.currency == this.currency &&
          other.creditLimit == this.creditLimit &&
          other.gracePeriodEnd == this.gracePeriodEnd &&
          other.minPaymentAmount == this.minPaymentAmount &&
          other.currentBalance == this.currentBalance &&
          other.includeInPersonalBalance == this.includeInPersonalBalance &&
          other.includeInFamilyBalance == this.includeInFamilyBalance &&
          other.isSharedBalance == this.isSharedBalance &&
          other.isSharedExpenses == this.isSharedExpenses &&
          other.expenseDetailLevel == this.expenseDetailLevel &&
          other.isSharedIncomes == this.isSharedIncomes &&
          other.incomeDetailLevel == this.incomeDetailLevel);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> bankName;
  final Value<String> customName;
  final Value<String?> cardNumberMask;
  final Value<AccountType> accountType;
  final Value<String> currency;
  final Value<double?> creditLimit;
  final Value<DateTime?> gracePeriodEnd;
  final Value<double?> minPaymentAmount;
  final Value<double> currentBalance;
  final Value<bool> includeInPersonalBalance;
  final Value<bool> includeInFamilyBalance;
  final Value<bool> isSharedBalance;
  final Value<bool> isSharedExpenses;
  final Value<String> expenseDetailLevel;
  final Value<bool> isSharedIncomes;
  final Value<String> incomeDetailLevel;
  final Value<int> rowid;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.bankName = const Value.absent(),
    this.customName = const Value.absent(),
    this.cardNumberMask = const Value.absent(),
    this.accountType = const Value.absent(),
    this.currency = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.gracePeriodEnd = const Value.absent(),
    this.minPaymentAmount = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.includeInPersonalBalance = const Value.absent(),
    this.includeInFamilyBalance = const Value.absent(),
    this.isSharedBalance = const Value.absent(),
    this.isSharedExpenses = const Value.absent(),
    this.expenseDetailLevel = const Value.absent(),
    this.isSharedIncomes = const Value.absent(),
    this.incomeDetailLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    required String id,
    required String userId,
    required String bankName,
    required String customName,
    this.cardNumberMask = const Value.absent(),
    required AccountType accountType,
    this.currency = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.gracePeriodEnd = const Value.absent(),
    this.minPaymentAmount = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.includeInPersonalBalance = const Value.absent(),
    this.includeInFamilyBalance = const Value.absent(),
    this.isSharedBalance = const Value.absent(),
    this.isSharedExpenses = const Value.absent(),
    this.expenseDetailLevel = const Value.absent(),
    this.isSharedIncomes = const Value.absent(),
    this.incomeDetailLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       bankName = Value(bankName),
       customName = Value(customName),
       accountType = Value(accountType);
  static Insertable<Account> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? bankName,
    Expression<String>? customName,
    Expression<String>? cardNumberMask,
    Expression<String>? accountType,
    Expression<String>? currency,
    Expression<double>? creditLimit,
    Expression<DateTime>? gracePeriodEnd,
    Expression<double>? minPaymentAmount,
    Expression<double>? currentBalance,
    Expression<bool>? includeInPersonalBalance,
    Expression<bool>? includeInFamilyBalance,
    Expression<bool>? isSharedBalance,
    Expression<bool>? isSharedExpenses,
    Expression<String>? expenseDetailLevel,
    Expression<bool>? isSharedIncomes,
    Expression<String>? incomeDetailLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (bankName != null) 'bank_name': bankName,
      if (customName != null) 'custom_name': customName,
      if (cardNumberMask != null) 'card_number_mask': cardNumberMask,
      if (accountType != null) 'account_type': accountType,
      if (currency != null) 'currency': currency,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (gracePeriodEnd != null) 'grace_period_end': gracePeriodEnd,
      if (minPaymentAmount != null) 'min_payment_amount': minPaymentAmount,
      if (currentBalance != null) 'current_balance': currentBalance,
      if (includeInPersonalBalance != null)
        'include_in_personal_balance': includeInPersonalBalance,
      if (includeInFamilyBalance != null)
        'include_in_family_balance': includeInFamilyBalance,
      if (isSharedBalance != null) 'is_shared_balance': isSharedBalance,
      if (isSharedExpenses != null) 'is_shared_expenses': isSharedExpenses,
      if (expenseDetailLevel != null)
        'expense_detail_level': expenseDetailLevel,
      if (isSharedIncomes != null) 'is_shared_incomes': isSharedIncomes,
      if (incomeDetailLevel != null) 'income_detail_level': incomeDetailLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? bankName,
    Value<String>? customName,
    Value<String?>? cardNumberMask,
    Value<AccountType>? accountType,
    Value<String>? currency,
    Value<double?>? creditLimit,
    Value<DateTime?>? gracePeriodEnd,
    Value<double?>? minPaymentAmount,
    Value<double>? currentBalance,
    Value<bool>? includeInPersonalBalance,
    Value<bool>? includeInFamilyBalance,
    Value<bool>? isSharedBalance,
    Value<bool>? isSharedExpenses,
    Value<String>? expenseDetailLevel,
    Value<bool>? isSharedIncomes,
    Value<String>? incomeDetailLevel,
    Value<int>? rowid,
  }) {
    return AccountsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      bankName: bankName ?? this.bankName,
      customName: customName ?? this.customName,
      cardNumberMask: cardNumberMask ?? this.cardNumberMask,
      accountType: accountType ?? this.accountType,
      currency: currency ?? this.currency,
      creditLimit: creditLimit ?? this.creditLimit,
      gracePeriodEnd: gracePeriodEnd ?? this.gracePeriodEnd,
      minPaymentAmount: minPaymentAmount ?? this.minPaymentAmount,
      currentBalance: currentBalance ?? this.currentBalance,
      includeInPersonalBalance:
          includeInPersonalBalance ?? this.includeInPersonalBalance,
      includeInFamilyBalance:
          includeInFamilyBalance ?? this.includeInFamilyBalance,
      isSharedBalance: isSharedBalance ?? this.isSharedBalance,
      isSharedExpenses: isSharedExpenses ?? this.isSharedExpenses,
      expenseDetailLevel: expenseDetailLevel ?? this.expenseDetailLevel,
      isSharedIncomes: isSharedIncomes ?? this.isSharedIncomes,
      incomeDetailLevel: incomeDetailLevel ?? this.incomeDetailLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (customName.present) {
      map['custom_name'] = Variable<String>(customName.value);
    }
    if (cardNumberMask.present) {
      map['card_number_mask'] = Variable<String>(cardNumberMask.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(
        $AccountsTable.$converteraccountType.toSql(accountType.value),
      );
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<double>(creditLimit.value);
    }
    if (gracePeriodEnd.present) {
      map['grace_period_end'] = Variable<DateTime>(gracePeriodEnd.value);
    }
    if (minPaymentAmount.present) {
      map['min_payment_amount'] = Variable<double>(minPaymentAmount.value);
    }
    if (currentBalance.present) {
      map['current_balance'] = Variable<double>(currentBalance.value);
    }
    if (includeInPersonalBalance.present) {
      map['include_in_personal_balance'] = Variable<bool>(
        includeInPersonalBalance.value,
      );
    }
    if (includeInFamilyBalance.present) {
      map['include_in_family_balance'] = Variable<bool>(
        includeInFamilyBalance.value,
      );
    }
    if (isSharedBalance.present) {
      map['is_shared_balance'] = Variable<bool>(isSharedBalance.value);
    }
    if (isSharedExpenses.present) {
      map['is_shared_expenses'] = Variable<bool>(isSharedExpenses.value);
    }
    if (expenseDetailLevel.present) {
      map['expense_detail_level'] = Variable<String>(expenseDetailLevel.value);
    }
    if (isSharedIncomes.present) {
      map['is_shared_incomes'] = Variable<bool>(isSharedIncomes.value);
    }
    if (incomeDetailLevel.present) {
      map['income_detail_level'] = Variable<String>(incomeDetailLevel.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('bankName: $bankName, ')
          ..write('customName: $customName, ')
          ..write('cardNumberMask: $cardNumberMask, ')
          ..write('accountType: $accountType, ')
          ..write('currency: $currency, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('gracePeriodEnd: $gracePeriodEnd, ')
          ..write('minPaymentAmount: $minPaymentAmount, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('includeInPersonalBalance: $includeInPersonalBalance, ')
          ..write('includeInFamilyBalance: $includeInFamilyBalance, ')
          ..write('isSharedBalance: $isSharedBalance, ')
          ..write('isSharedExpenses: $isSharedExpenses, ')
          ..write('expenseDetailLevel: $expenseDetailLevel, ')
          ..write('isSharedIncomes: $isSharedIncomes, ')
          ..write('incomeDetailLevel: $incomeDetailLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spaceIdMeta = const VerificationMeta(
    'spaceId',
  );
  @override
  late final GeneratedColumn<String> spaceId = GeneratedColumn<String>(
    'space_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES spaces (id)',
    ),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CategoryType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CategoryType>($CategoriesTable.$convertertype);
  static const VerificationMeta _isPinnedForCashbackMeta =
      const VerificationMeta('isPinnedForCashback');
  @override
  late final GeneratedColumn<bool> isPinnedForCashback = GeneratedColumn<bool>(
    'is_pinned_for_cashback',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pinned_for_cashback" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    spaceId,
    parentId,
    name,
    type,
    isPinnedForCashback,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('space_id')) {
      context.handle(
        _spaceIdMeta,
        spaceId.isAcceptableOrUnknown(data['space_id']!, _spaceIdMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_pinned_for_cashback')) {
      context.handle(
        _isPinnedForCashbackMeta,
        isPinnedForCashback.isAcceptableOrUnknown(
          data['is_pinned_for_cashback']!,
          _isPinnedForCashbackMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      spaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}space_id'],
      ),
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: $CategoriesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      isPinnedForCashback: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pinned_for_cashback'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CategoryType, String, String> $convertertype =
      const EnumNameConverter<CategoryType>(CategoryType.values);
}

class Category extends DataClass implements Insertable<Category> {
  final String id;
  final String? spaceId;
  final String? parentId;
  final String name;
  final CategoryType type;
  final bool isPinnedForCashback;
  const Category({
    required this.id,
    this.spaceId,
    this.parentId,
    required this.name,
    required this.type,
    required this.isPinnedForCashback,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || spaceId != null) {
      map['space_id'] = Variable<String>(spaceId);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>(
        $CategoriesTable.$convertertype.toSql(type),
      );
    }
    map['is_pinned_for_cashback'] = Variable<bool>(isPinnedForCashback);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      spaceId: spaceId == null && nullToAbsent
          ? const Value.absent()
          : Value(spaceId),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      name: Value(name),
      type: Value(type),
      isPinnedForCashback: Value(isPinnedForCashback),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      spaceId: serializer.fromJson<String?>(json['spaceId']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      name: serializer.fromJson<String>(json['name']),
      type: $CategoriesTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      isPinnedForCashback: serializer.fromJson<bool>(
        json['isPinnedForCashback'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'spaceId': serializer.toJson<String?>(spaceId),
      'parentId': serializer.toJson<String?>(parentId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(
        $CategoriesTable.$convertertype.toJson(type),
      ),
      'isPinnedForCashback': serializer.toJson<bool>(isPinnedForCashback),
    };
  }

  Category copyWith({
    String? id,
    Value<String?> spaceId = const Value.absent(),
    Value<String?> parentId = const Value.absent(),
    String? name,
    CategoryType? type,
    bool? isPinnedForCashback,
  }) => Category(
    id: id ?? this.id,
    spaceId: spaceId.present ? spaceId.value : this.spaceId,
    parentId: parentId.present ? parentId.value : this.parentId,
    name: name ?? this.name,
    type: type ?? this.type,
    isPinnedForCashback: isPinnedForCashback ?? this.isPinnedForCashback,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      spaceId: data.spaceId.present ? data.spaceId.value : this.spaceId,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      isPinnedForCashback: data.isPinnedForCashback.present
          ? data.isPinnedForCashback.value
          : this.isPinnedForCashback,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('spaceId: $spaceId, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('isPinnedForCashback: $isPinnedForCashback')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, spaceId, parentId, name, type, isPinnedForCashback);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.spaceId == this.spaceId &&
          other.parentId == this.parentId &&
          other.name == this.name &&
          other.type == this.type &&
          other.isPinnedForCashback == this.isPinnedForCashback);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<String?> spaceId;
  final Value<String?> parentId;
  final Value<String> name;
  final Value<CategoryType> type;
  final Value<bool> isPinnedForCashback;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.spaceId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.isPinnedForCashback = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    this.spaceId = const Value.absent(),
    this.parentId = const Value.absent(),
    required String name,
    required CategoryType type,
    this.isPinnedForCashback = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       type = Value(type);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? spaceId,
    Expression<String>? parentId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<bool>? isPinnedForCashback,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (spaceId != null) 'space_id': spaceId,
      if (parentId != null) 'parent_id': parentId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (isPinnedForCashback != null)
        'is_pinned_for_cashback': isPinnedForCashback,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String?>? spaceId,
    Value<String?>? parentId,
    Value<String>? name,
    Value<CategoryType>? type,
    Value<bool>? isPinnedForCashback,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      spaceId: spaceId ?? this.spaceId,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      type: type ?? this.type,
      isPinnedForCashback: isPinnedForCashback ?? this.isPinnedForCashback,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (spaceId.present) {
      map['space_id'] = Variable<String>(spaceId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $CategoriesTable.$convertertype.toSql(type.value),
      );
    }
    if (isPinnedForCashback.present) {
      map['is_pinned_for_cashback'] = Variable<bool>(isPinnedForCashback.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('spaceId: $spaceId, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('isPinnedForCashback: $isPinnedForCashback, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id)',
    ),
  );
  static const VerificationMeta _bankTransactionIdMeta = const VerificationMeta(
    'bankTransactionId',
  );
  @override
  late final GeneratedColumn<String> bankTransactionId =
      GeneratedColumn<String>(
        'bank_transaction_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
      );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalCurrencyMeta = const VerificationMeta(
    'originalCurrency',
  );
  @override
  late final GeneratedColumn<String> originalCurrency = GeneratedColumn<String>(
    'original_currency',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalAmountMeta = const VerificationMeta(
    'originalAmount',
  );
  @override
  late final GeneratedColumn<double> originalAmount = GeneratedColumn<double>(
    'original_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TransactionType>($TransactionsTable.$convertertype);
  static const VerificationMeta _isRefundMeta = const VerificationMeta(
    'isRefund',
  );
  @override
  late final GeneratedColumn<bool> isRefund = GeneratedColumn<bool>(
    'is_refund',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_refund" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _bankCategoryMeta = const VerificationMeta(
    'bankCategory',
  );
  @override
  late final GeneratedColumn<String> bankCategory = GeneratedColumn<String>(
    'bank_category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customCategoryIdMeta = const VerificationMeta(
    'customCategoryId',
  );
  @override
  late final GeneratedColumn<String> customCategoryId = GeneratedColumn<String>(
    'custom_category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isUserEditedMeta = const VerificationMeta(
    'isUserEdited',
  );
  @override
  late final GeneratedColumn<bool> isUserEdited = GeneratedColumn<bool>(
    'is_user_edited',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_user_edited" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('pending'),
      ).withConverter<SyncStatus>($TransactionsTable.$convertersyncStatus);
  static const VerificationMeta _isHiddenByCalendarMeta =
      const VerificationMeta('isHiddenByCalendar');
  @override
  late final GeneratedColumn<bool> isHiddenByCalendar = GeneratedColumn<bool>(
    'is_hidden_by_calendar',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_hidden_by_calendar" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hiddenUntilDateMeta = const VerificationMeta(
    'hiddenUntilDate',
  );
  @override
  late final GeneratedColumn<DateTime> hiddenUntilDate =
      GeneratedColumn<DateTime>(
        'hidden_until_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  late final GeneratedColumnWithTypeConverter<AuditStatus, String> auditStatus =
      GeneratedColumn<String>(
        'audit_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('verified'),
      ).withConverter<AuditStatus>($TransactionsTable.$converterauditStatus);
  static const VerificationMeta _isArchivedForSpaceMeta =
      const VerificationMeta('isArchivedForSpace');
  @override
  late final GeneratedColumn<bool> isArchivedForSpace = GeneratedColumn<bool>(
    'is_archived_for_space',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived_for_space" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _businessMirrorMeta = const VerificationMeta(
    'businessMirror',
  );
  @override
  late final GeneratedColumn<bool> businessMirror = GeneratedColumn<bool>(
    'business_mirror',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("business_mirror" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    bankTransactionId,
    date,
    amount,
    originalCurrency,
    originalAmount,
    type,
    isRefund,
    bankCategory,
    customCategoryId,
    comment,
    isUserEdited,
    syncStatus,
    isHiddenByCalendar,
    hiddenUntilDate,
    auditStatus,
    isArchivedForSpace,
    businessMirror,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Transaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('bank_transaction_id')) {
      context.handle(
        _bankTransactionIdMeta,
        bankTransactionId.isAcceptableOrUnknown(
          data['bank_transaction_id']!,
          _bankTransactionIdMeta,
        ),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('original_currency')) {
      context.handle(
        _originalCurrencyMeta,
        originalCurrency.isAcceptableOrUnknown(
          data['original_currency']!,
          _originalCurrencyMeta,
        ),
      );
    }
    if (data.containsKey('original_amount')) {
      context.handle(
        _originalAmountMeta,
        originalAmount.isAcceptableOrUnknown(
          data['original_amount']!,
          _originalAmountMeta,
        ),
      );
    }
    if (data.containsKey('is_refund')) {
      context.handle(
        _isRefundMeta,
        isRefund.isAcceptableOrUnknown(data['is_refund']!, _isRefundMeta),
      );
    }
    if (data.containsKey('bank_category')) {
      context.handle(
        _bankCategoryMeta,
        bankCategory.isAcceptableOrUnknown(
          data['bank_category']!,
          _bankCategoryMeta,
        ),
      );
    }
    if (data.containsKey('custom_category_id')) {
      context.handle(
        _customCategoryIdMeta,
        customCategoryId.isAcceptableOrUnknown(
          data['custom_category_id']!,
          _customCategoryIdMeta,
        ),
      );
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('is_user_edited')) {
      context.handle(
        _isUserEditedMeta,
        isUserEdited.isAcceptableOrUnknown(
          data['is_user_edited']!,
          _isUserEditedMeta,
        ),
      );
    }
    if (data.containsKey('is_hidden_by_calendar')) {
      context.handle(
        _isHiddenByCalendarMeta,
        isHiddenByCalendar.isAcceptableOrUnknown(
          data['is_hidden_by_calendar']!,
          _isHiddenByCalendarMeta,
        ),
      );
    }
    if (data.containsKey('hidden_until_date')) {
      context.handle(
        _hiddenUntilDateMeta,
        hiddenUntilDate.isAcceptableOrUnknown(
          data['hidden_until_date']!,
          _hiddenUntilDateMeta,
        ),
      );
    }
    if (data.containsKey('is_archived_for_space')) {
      context.handle(
        _isArchivedForSpaceMeta,
        isArchivedForSpace.isAcceptableOrUnknown(
          data['is_archived_for_space']!,
          _isArchivedForSpaceMeta,
        ),
      );
    }
    if (data.containsKey('business_mirror')) {
      context.handle(
        _businessMirrorMeta,
        businessMirror.isAcceptableOrUnknown(
          data['business_mirror']!,
          _businessMirrorMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      bankTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_transaction_id'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      originalCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_currency'],
      ),
      originalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}original_amount'],
      ),
      type: $TransactionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      isRefund: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_refund'],
      )!,
      bankCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_category'],
      ),
      customCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_category_id'],
      ),
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
      isUserEdited: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_user_edited'],
      )!,
      syncStatus: $TransactionsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      isHiddenByCalendar: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_hidden_by_calendar'],
      )!,
      hiddenUntilDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hidden_until_date'],
      ),
      auditStatus: $TransactionsTable.$converterauditStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}audit_status'],
        )!,
      ),
      isArchivedForSpace: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived_for_space'],
      )!,
      businessMirror: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}business_mirror'],
      )!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionType, String, String> $convertertype =
      const EnumNameConverter<TransactionType>(TransactionType.values);
  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<AuditStatus, String, String> $converterauditStatus =
      const EnumNameConverter<AuditStatus>(AuditStatus.values);
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String id;
  final String accountId;
  final String? bankTransactionId;
  final DateTime date;
  final double amount;
  final String? originalCurrency;
  final double? originalAmount;
  final TransactionType type;
  final bool isRefund;
  final String? bankCategory;
  final String? customCategoryId;
  final String? comment;
  final bool isUserEdited;
  final SyncStatus syncStatus;
  final bool isHiddenByCalendar;
  final DateTime? hiddenUntilDate;
  final AuditStatus auditStatus;
  final bool isArchivedForSpace;
  final bool businessMirror;
  const Transaction({
    required this.id,
    required this.accountId,
    this.bankTransactionId,
    required this.date,
    required this.amount,
    this.originalCurrency,
    this.originalAmount,
    required this.type,
    required this.isRefund,
    this.bankCategory,
    this.customCategoryId,
    this.comment,
    required this.isUserEdited,
    required this.syncStatus,
    required this.isHiddenByCalendar,
    this.hiddenUntilDate,
    required this.auditStatus,
    required this.isArchivedForSpace,
    required this.businessMirror,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['account_id'] = Variable<String>(accountId);
    if (!nullToAbsent || bankTransactionId != null) {
      map['bank_transaction_id'] = Variable<String>(bankTransactionId);
    }
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || originalCurrency != null) {
      map['original_currency'] = Variable<String>(originalCurrency);
    }
    if (!nullToAbsent || originalAmount != null) {
      map['original_amount'] = Variable<double>(originalAmount);
    }
    {
      map['type'] = Variable<String>(
        $TransactionsTable.$convertertype.toSql(type),
      );
    }
    map['is_refund'] = Variable<bool>(isRefund);
    if (!nullToAbsent || bankCategory != null) {
      map['bank_category'] = Variable<String>(bankCategory);
    }
    if (!nullToAbsent || customCategoryId != null) {
      map['custom_category_id'] = Variable<String>(customCategoryId);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['is_user_edited'] = Variable<bool>(isUserEdited);
    {
      map['sync_status'] = Variable<String>(
        $TransactionsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['is_hidden_by_calendar'] = Variable<bool>(isHiddenByCalendar);
    if (!nullToAbsent || hiddenUntilDate != null) {
      map['hidden_until_date'] = Variable<DateTime>(hiddenUntilDate);
    }
    {
      map['audit_status'] = Variable<String>(
        $TransactionsTable.$converterauditStatus.toSql(auditStatus),
      );
    }
    map['is_archived_for_space'] = Variable<bool>(isArchivedForSpace);
    map['business_mirror'] = Variable<bool>(businessMirror);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      accountId: Value(accountId),
      bankTransactionId: bankTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(bankTransactionId),
      date: Value(date),
      amount: Value(amount),
      originalCurrency: originalCurrency == null && nullToAbsent
          ? const Value.absent()
          : Value(originalCurrency),
      originalAmount: originalAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(originalAmount),
      type: Value(type),
      isRefund: Value(isRefund),
      bankCategory: bankCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(bankCategory),
      customCategoryId: customCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(customCategoryId),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      isUserEdited: Value(isUserEdited),
      syncStatus: Value(syncStatus),
      isHiddenByCalendar: Value(isHiddenByCalendar),
      hiddenUntilDate: hiddenUntilDate == null && nullToAbsent
          ? const Value.absent()
          : Value(hiddenUntilDate),
      auditStatus: Value(auditStatus),
      isArchivedForSpace: Value(isArchivedForSpace),
      businessMirror: Value(businessMirror),
    );
  }

  factory Transaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      accountId: serializer.fromJson<String>(json['accountId']),
      bankTransactionId: serializer.fromJson<String?>(
        json['bankTransactionId'],
      ),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<double>(json['amount']),
      originalCurrency: serializer.fromJson<String?>(json['originalCurrency']),
      originalAmount: serializer.fromJson<double?>(json['originalAmount']),
      type: $TransactionsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      isRefund: serializer.fromJson<bool>(json['isRefund']),
      bankCategory: serializer.fromJson<String?>(json['bankCategory']),
      customCategoryId: serializer.fromJson<String?>(json['customCategoryId']),
      comment: serializer.fromJson<String?>(json['comment']),
      isUserEdited: serializer.fromJson<bool>(json['isUserEdited']),
      syncStatus: $TransactionsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      isHiddenByCalendar: serializer.fromJson<bool>(json['isHiddenByCalendar']),
      hiddenUntilDate: serializer.fromJson<DateTime?>(json['hiddenUntilDate']),
      auditStatus: $TransactionsTable.$converterauditStatus.fromJson(
        serializer.fromJson<String>(json['auditStatus']),
      ),
      isArchivedForSpace: serializer.fromJson<bool>(json['isArchivedForSpace']),
      businessMirror: serializer.fromJson<bool>(json['businessMirror']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'accountId': serializer.toJson<String>(accountId),
      'bankTransactionId': serializer.toJson<String?>(bankTransactionId),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<double>(amount),
      'originalCurrency': serializer.toJson<String?>(originalCurrency),
      'originalAmount': serializer.toJson<double?>(originalAmount),
      'type': serializer.toJson<String>(
        $TransactionsTable.$convertertype.toJson(type),
      ),
      'isRefund': serializer.toJson<bool>(isRefund),
      'bankCategory': serializer.toJson<String?>(bankCategory),
      'customCategoryId': serializer.toJson<String?>(customCategoryId),
      'comment': serializer.toJson<String?>(comment),
      'isUserEdited': serializer.toJson<bool>(isUserEdited),
      'syncStatus': serializer.toJson<String>(
        $TransactionsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'isHiddenByCalendar': serializer.toJson<bool>(isHiddenByCalendar),
      'hiddenUntilDate': serializer.toJson<DateTime?>(hiddenUntilDate),
      'auditStatus': serializer.toJson<String>(
        $TransactionsTable.$converterauditStatus.toJson(auditStatus),
      ),
      'isArchivedForSpace': serializer.toJson<bool>(isArchivedForSpace),
      'businessMirror': serializer.toJson<bool>(businessMirror),
    };
  }

  Transaction copyWith({
    String? id,
    String? accountId,
    Value<String?> bankTransactionId = const Value.absent(),
    DateTime? date,
    double? amount,
    Value<String?> originalCurrency = const Value.absent(),
    Value<double?> originalAmount = const Value.absent(),
    TransactionType? type,
    bool? isRefund,
    Value<String?> bankCategory = const Value.absent(),
    Value<String?> customCategoryId = const Value.absent(),
    Value<String?> comment = const Value.absent(),
    bool? isUserEdited,
    SyncStatus? syncStatus,
    bool? isHiddenByCalendar,
    Value<DateTime?> hiddenUntilDate = const Value.absent(),
    AuditStatus? auditStatus,
    bool? isArchivedForSpace,
    bool? businessMirror,
  }) => Transaction(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    bankTransactionId: bankTransactionId.present
        ? bankTransactionId.value
        : this.bankTransactionId,
    date: date ?? this.date,
    amount: amount ?? this.amount,
    originalCurrency: originalCurrency.present
        ? originalCurrency.value
        : this.originalCurrency,
    originalAmount: originalAmount.present
        ? originalAmount.value
        : this.originalAmount,
    type: type ?? this.type,
    isRefund: isRefund ?? this.isRefund,
    bankCategory: bankCategory.present ? bankCategory.value : this.bankCategory,
    customCategoryId: customCategoryId.present
        ? customCategoryId.value
        : this.customCategoryId,
    comment: comment.present ? comment.value : this.comment,
    isUserEdited: isUserEdited ?? this.isUserEdited,
    syncStatus: syncStatus ?? this.syncStatus,
    isHiddenByCalendar: isHiddenByCalendar ?? this.isHiddenByCalendar,
    hiddenUntilDate: hiddenUntilDate.present
        ? hiddenUntilDate.value
        : this.hiddenUntilDate,
    auditStatus: auditStatus ?? this.auditStatus,
    isArchivedForSpace: isArchivedForSpace ?? this.isArchivedForSpace,
    businessMirror: businessMirror ?? this.businessMirror,
  );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      bankTransactionId: data.bankTransactionId.present
          ? data.bankTransactionId.value
          : this.bankTransactionId,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
      originalCurrency: data.originalCurrency.present
          ? data.originalCurrency.value
          : this.originalCurrency,
      originalAmount: data.originalAmount.present
          ? data.originalAmount.value
          : this.originalAmount,
      type: data.type.present ? data.type.value : this.type,
      isRefund: data.isRefund.present ? data.isRefund.value : this.isRefund,
      bankCategory: data.bankCategory.present
          ? data.bankCategory.value
          : this.bankCategory,
      customCategoryId: data.customCategoryId.present
          ? data.customCategoryId.value
          : this.customCategoryId,
      comment: data.comment.present ? data.comment.value : this.comment,
      isUserEdited: data.isUserEdited.present
          ? data.isUserEdited.value
          : this.isUserEdited,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      isHiddenByCalendar: data.isHiddenByCalendar.present
          ? data.isHiddenByCalendar.value
          : this.isHiddenByCalendar,
      hiddenUntilDate: data.hiddenUntilDate.present
          ? data.hiddenUntilDate.value
          : this.hiddenUntilDate,
      auditStatus: data.auditStatus.present
          ? data.auditStatus.value
          : this.auditStatus,
      isArchivedForSpace: data.isArchivedForSpace.present
          ? data.isArchivedForSpace.value
          : this.isArchivedForSpace,
      businessMirror: data.businessMirror.present
          ? data.businessMirror.value
          : this.businessMirror,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('bankTransactionId: $bankTransactionId, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('originalCurrency: $originalCurrency, ')
          ..write('originalAmount: $originalAmount, ')
          ..write('type: $type, ')
          ..write('isRefund: $isRefund, ')
          ..write('bankCategory: $bankCategory, ')
          ..write('customCategoryId: $customCategoryId, ')
          ..write('comment: $comment, ')
          ..write('isUserEdited: $isUserEdited, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('isHiddenByCalendar: $isHiddenByCalendar, ')
          ..write('hiddenUntilDate: $hiddenUntilDate, ')
          ..write('auditStatus: $auditStatus, ')
          ..write('isArchivedForSpace: $isArchivedForSpace, ')
          ..write('businessMirror: $businessMirror')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    bankTransactionId,
    date,
    amount,
    originalCurrency,
    originalAmount,
    type,
    isRefund,
    bankCategory,
    customCategoryId,
    comment,
    isUserEdited,
    syncStatus,
    isHiddenByCalendar,
    hiddenUntilDate,
    auditStatus,
    isArchivedForSpace,
    businessMirror,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.bankTransactionId == this.bankTransactionId &&
          other.date == this.date &&
          other.amount == this.amount &&
          other.originalCurrency == this.originalCurrency &&
          other.originalAmount == this.originalAmount &&
          other.type == this.type &&
          other.isRefund == this.isRefund &&
          other.bankCategory == this.bankCategory &&
          other.customCategoryId == this.customCategoryId &&
          other.comment == this.comment &&
          other.isUserEdited == this.isUserEdited &&
          other.syncStatus == this.syncStatus &&
          other.isHiddenByCalendar == this.isHiddenByCalendar &&
          other.hiddenUntilDate == this.hiddenUntilDate &&
          other.auditStatus == this.auditStatus &&
          other.isArchivedForSpace == this.isArchivedForSpace &&
          other.businessMirror == this.businessMirror);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<String> accountId;
  final Value<String?> bankTransactionId;
  final Value<DateTime> date;
  final Value<double> amount;
  final Value<String?> originalCurrency;
  final Value<double?> originalAmount;
  final Value<TransactionType> type;
  final Value<bool> isRefund;
  final Value<String?> bankCategory;
  final Value<String?> customCategoryId;
  final Value<String?> comment;
  final Value<bool> isUserEdited;
  final Value<SyncStatus> syncStatus;
  final Value<bool> isHiddenByCalendar;
  final Value<DateTime?> hiddenUntilDate;
  final Value<AuditStatus> auditStatus;
  final Value<bool> isArchivedForSpace;
  final Value<bool> businessMirror;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.bankTransactionId = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
    this.originalCurrency = const Value.absent(),
    this.originalAmount = const Value.absent(),
    this.type = const Value.absent(),
    this.isRefund = const Value.absent(),
    this.bankCategory = const Value.absent(),
    this.customCategoryId = const Value.absent(),
    this.comment = const Value.absent(),
    this.isUserEdited = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.isHiddenByCalendar = const Value.absent(),
    this.hiddenUntilDate = const Value.absent(),
    this.auditStatus = const Value.absent(),
    this.isArchivedForSpace = const Value.absent(),
    this.businessMirror = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required String accountId,
    this.bankTransactionId = const Value.absent(),
    required DateTime date,
    required double amount,
    this.originalCurrency = const Value.absent(),
    this.originalAmount = const Value.absent(),
    required TransactionType type,
    this.isRefund = const Value.absent(),
    this.bankCategory = const Value.absent(),
    this.customCategoryId = const Value.absent(),
    this.comment = const Value.absent(),
    this.isUserEdited = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.isHiddenByCalendar = const Value.absent(),
    this.hiddenUntilDate = const Value.absent(),
    this.auditStatus = const Value.absent(),
    this.isArchivedForSpace = const Value.absent(),
    this.businessMirror = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       accountId = Value(accountId),
       date = Value(date),
       amount = Value(amount),
       type = Value(type);
  static Insertable<Transaction> custom({
    Expression<String>? id,
    Expression<String>? accountId,
    Expression<String>? bankTransactionId,
    Expression<DateTime>? date,
    Expression<double>? amount,
    Expression<String>? originalCurrency,
    Expression<double>? originalAmount,
    Expression<String>? type,
    Expression<bool>? isRefund,
    Expression<String>? bankCategory,
    Expression<String>? customCategoryId,
    Expression<String>? comment,
    Expression<bool>? isUserEdited,
    Expression<String>? syncStatus,
    Expression<bool>? isHiddenByCalendar,
    Expression<DateTime>? hiddenUntilDate,
    Expression<String>? auditStatus,
    Expression<bool>? isArchivedForSpace,
    Expression<bool>? businessMirror,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (bankTransactionId != null) 'bank_transaction_id': bankTransactionId,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
      if (originalCurrency != null) 'original_currency': originalCurrency,
      if (originalAmount != null) 'original_amount': originalAmount,
      if (type != null) 'type': type,
      if (isRefund != null) 'is_refund': isRefund,
      if (bankCategory != null) 'bank_category': bankCategory,
      if (customCategoryId != null) 'custom_category_id': customCategoryId,
      if (comment != null) 'comment': comment,
      if (isUserEdited != null) 'is_user_edited': isUserEdited,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (isHiddenByCalendar != null)
        'is_hidden_by_calendar': isHiddenByCalendar,
      if (hiddenUntilDate != null) 'hidden_until_date': hiddenUntilDate,
      if (auditStatus != null) 'audit_status': auditStatus,
      if (isArchivedForSpace != null)
        'is_archived_for_space': isArchivedForSpace,
      if (businessMirror != null) 'business_mirror': businessMirror,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? accountId,
    Value<String?>? bankTransactionId,
    Value<DateTime>? date,
    Value<double>? amount,
    Value<String?>? originalCurrency,
    Value<double?>? originalAmount,
    Value<TransactionType>? type,
    Value<bool>? isRefund,
    Value<String?>? bankCategory,
    Value<String?>? customCategoryId,
    Value<String?>? comment,
    Value<bool>? isUserEdited,
    Value<SyncStatus>? syncStatus,
    Value<bool>? isHiddenByCalendar,
    Value<DateTime?>? hiddenUntilDate,
    Value<AuditStatus>? auditStatus,
    Value<bool>? isArchivedForSpace,
    Value<bool>? businessMirror,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      bankTransactionId: bankTransactionId ?? this.bankTransactionId,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      originalCurrency: originalCurrency ?? this.originalCurrency,
      originalAmount: originalAmount ?? this.originalAmount,
      type: type ?? this.type,
      isRefund: isRefund ?? this.isRefund,
      bankCategory: bankCategory ?? this.bankCategory,
      customCategoryId: customCategoryId ?? this.customCategoryId,
      comment: comment ?? this.comment,
      isUserEdited: isUserEdited ?? this.isUserEdited,
      syncStatus: syncStatus ?? this.syncStatus,
      isHiddenByCalendar: isHiddenByCalendar ?? this.isHiddenByCalendar,
      hiddenUntilDate: hiddenUntilDate ?? this.hiddenUntilDate,
      auditStatus: auditStatus ?? this.auditStatus,
      isArchivedForSpace: isArchivedForSpace ?? this.isArchivedForSpace,
      businessMirror: businessMirror ?? this.businessMirror,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (bankTransactionId.present) {
      map['bank_transaction_id'] = Variable<String>(bankTransactionId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (originalCurrency.present) {
      map['original_currency'] = Variable<String>(originalCurrency.value);
    }
    if (originalAmount.present) {
      map['original_amount'] = Variable<double>(originalAmount.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $TransactionsTable.$convertertype.toSql(type.value),
      );
    }
    if (isRefund.present) {
      map['is_refund'] = Variable<bool>(isRefund.value);
    }
    if (bankCategory.present) {
      map['bank_category'] = Variable<String>(bankCategory.value);
    }
    if (customCategoryId.present) {
      map['custom_category_id'] = Variable<String>(customCategoryId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (isUserEdited.present) {
      map['is_user_edited'] = Variable<bool>(isUserEdited.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $TransactionsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (isHiddenByCalendar.present) {
      map['is_hidden_by_calendar'] = Variable<bool>(isHiddenByCalendar.value);
    }
    if (hiddenUntilDate.present) {
      map['hidden_until_date'] = Variable<DateTime>(hiddenUntilDate.value);
    }
    if (auditStatus.present) {
      map['audit_status'] = Variable<String>(
        $TransactionsTable.$converterauditStatus.toSql(auditStatus.value),
      );
    }
    if (isArchivedForSpace.present) {
      map['is_archived_for_space'] = Variable<bool>(isArchivedForSpace.value);
    }
    if (businessMirror.present) {
      map['business_mirror'] = Variable<bool>(businessMirror.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('bankTransactionId: $bankTransactionId, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('originalCurrency: $originalCurrency, ')
          ..write('originalAmount: $originalAmount, ')
          ..write('type: $type, ')
          ..write('isRefund: $isRefund, ')
          ..write('bankCategory: $bankCategory, ')
          ..write('customCategoryId: $customCategoryId, ')
          ..write('comment: $comment, ')
          ..write('isUserEdited: $isUserEdited, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('isHiddenByCalendar: $isHiddenByCalendar, ')
          ..write('hiddenUntilDate: $hiddenUntilDate, ')
          ..write('auditStatus: $auditStatus, ')
          ..write('isArchivedForSpace: $isArchivedForSpace, ')
          ..write('businessMirror: $businessMirror, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomDashboardsTable extends CustomDashboards
    with TableInfo<$CustomDashboardsTable, CustomDashboard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomDashboardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _dashboardNameMeta = const VerificationMeta(
    'dashboardName',
  );
  @override
  late final GeneratedColumn<String> dashboardName = GeneratedColumn<String>(
    'dashboard_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isEnabledPAndLMeta = const VerificationMeta(
    'isEnabledPAndL',
  );
  @override
  late final GeneratedColumn<bool> isEnabledPAndL = GeneratedColumn<bool>(
    'is_enabled_p_and_l',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled_p_and_l" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    dashboardName,
    isEnabledPAndL,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_dashboards';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomDashboard> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('dashboard_name')) {
      context.handle(
        _dashboardNameMeta,
        dashboardName.isAcceptableOrUnknown(
          data['dashboard_name']!,
          _dashboardNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dashboardNameMeta);
    }
    if (data.containsKey('is_enabled_p_and_l')) {
      context.handle(
        _isEnabledPAndLMeta,
        isEnabledPAndL.isAcceptableOrUnknown(
          data['is_enabled_p_and_l']!,
          _isEnabledPAndLMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomDashboard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomDashboard(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      dashboardName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dashboard_name'],
      )!,
      isEnabledPAndL: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled_p_and_l'],
      )!,
    );
  }

  @override
  $CustomDashboardsTable createAlias(String alias) {
    return $CustomDashboardsTable(attachedDatabase, alias);
  }
}

class CustomDashboard extends DataClass implements Insertable<CustomDashboard> {
  final String id;
  final String userId;
  final String dashboardName;
  final bool isEnabledPAndL;
  const CustomDashboard({
    required this.id,
    required this.userId,
    required this.dashboardName,
    required this.isEnabledPAndL,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['dashboard_name'] = Variable<String>(dashboardName);
    map['is_enabled_p_and_l'] = Variable<bool>(isEnabledPAndL);
    return map;
  }

  CustomDashboardsCompanion toCompanion(bool nullToAbsent) {
    return CustomDashboardsCompanion(
      id: Value(id),
      userId: Value(userId),
      dashboardName: Value(dashboardName),
      isEnabledPAndL: Value(isEnabledPAndL),
    );
  }

  factory CustomDashboard.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomDashboard(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      dashboardName: serializer.fromJson<String>(json['dashboardName']),
      isEnabledPAndL: serializer.fromJson<bool>(json['isEnabledPAndL']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'dashboardName': serializer.toJson<String>(dashboardName),
      'isEnabledPAndL': serializer.toJson<bool>(isEnabledPAndL),
    };
  }

  CustomDashboard copyWith({
    String? id,
    String? userId,
    String? dashboardName,
    bool? isEnabledPAndL,
  }) => CustomDashboard(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    dashboardName: dashboardName ?? this.dashboardName,
    isEnabledPAndL: isEnabledPAndL ?? this.isEnabledPAndL,
  );
  CustomDashboard copyWithCompanion(CustomDashboardsCompanion data) {
    return CustomDashboard(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      dashboardName: data.dashboardName.present
          ? data.dashboardName.value
          : this.dashboardName,
      isEnabledPAndL: data.isEnabledPAndL.present
          ? data.isEnabledPAndL.value
          : this.isEnabledPAndL,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomDashboard(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('dashboardName: $dashboardName, ')
          ..write('isEnabledPAndL: $isEnabledPAndL')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, dashboardName, isEnabledPAndL);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomDashboard &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.dashboardName == this.dashboardName &&
          other.isEnabledPAndL == this.isEnabledPAndL);
}

class CustomDashboardsCompanion extends UpdateCompanion<CustomDashboard> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> dashboardName;
  final Value<bool> isEnabledPAndL;
  final Value<int> rowid;
  const CustomDashboardsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.dashboardName = const Value.absent(),
    this.isEnabledPAndL = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomDashboardsCompanion.insert({
    required String id,
    required String userId,
    required String dashboardName,
    this.isEnabledPAndL = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       dashboardName = Value(dashboardName);
  static Insertable<CustomDashboard> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? dashboardName,
    Expression<bool>? isEnabledPAndL,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (dashboardName != null) 'dashboard_name': dashboardName,
      if (isEnabledPAndL != null) 'is_enabled_p_and_l': isEnabledPAndL,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomDashboardsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? dashboardName,
    Value<bool>? isEnabledPAndL,
    Value<int>? rowid,
  }) {
    return CustomDashboardsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      dashboardName: dashboardName ?? this.dashboardName,
      isEnabledPAndL: isEnabledPAndL ?? this.isEnabledPAndL,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (dashboardName.present) {
      map['dashboard_name'] = Variable<String>(dashboardName.value);
    }
    if (isEnabledPAndL.present) {
      map['is_enabled_p_and_l'] = Variable<bool>(isEnabledPAndL.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomDashboardsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('dashboardName: $dashboardName, ')
          ..write('isEnabledPAndL: $isEnabledPAndL, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DashboardTransactionsTable extends DashboardTransactions
    with TableInfo<$DashboardTransactionsTable, DashboardTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DashboardTransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dashboardIdMeta = const VerificationMeta(
    'dashboardId',
  );
  @override
  late final GeneratedColumn<String> dashboardId = GeneratedColumn<String>(
    'dashboard_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES custom_dashboards (id)',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [dashboardId, transactionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dashboard_transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DashboardTransaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dashboard_id')) {
      context.handle(
        _dashboardIdMeta,
        dashboardId.isAcceptableOrUnknown(
          data['dashboard_id']!,
          _dashboardIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dashboardIdMeta);
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dashboardId, transactionId};
  @override
  DashboardTransaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DashboardTransaction(
      dashboardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dashboard_id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transaction_id'],
      )!,
    );
  }

  @override
  $DashboardTransactionsTable createAlias(String alias) {
    return $DashboardTransactionsTable(attachedDatabase, alias);
  }
}

class DashboardTransaction extends DataClass
    implements Insertable<DashboardTransaction> {
  final String dashboardId;
  final String transactionId;
  const DashboardTransaction({
    required this.dashboardId,
    required this.transactionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dashboard_id'] = Variable<String>(dashboardId);
    map['transaction_id'] = Variable<String>(transactionId);
    return map;
  }

  DashboardTransactionsCompanion toCompanion(bool nullToAbsent) {
    return DashboardTransactionsCompanion(
      dashboardId: Value(dashboardId),
      transactionId: Value(transactionId),
    );
  }

  factory DashboardTransaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DashboardTransaction(
      dashboardId: serializer.fromJson<String>(json['dashboardId']),
      transactionId: serializer.fromJson<String>(json['transactionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dashboardId': serializer.toJson<String>(dashboardId),
      'transactionId': serializer.toJson<String>(transactionId),
    };
  }

  DashboardTransaction copyWith({String? dashboardId, String? transactionId}) =>
      DashboardTransaction(
        dashboardId: dashboardId ?? this.dashboardId,
        transactionId: transactionId ?? this.transactionId,
      );
  DashboardTransaction copyWithCompanion(DashboardTransactionsCompanion data) {
    return DashboardTransaction(
      dashboardId: data.dashboardId.present
          ? data.dashboardId.value
          : this.dashboardId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DashboardTransaction(')
          ..write('dashboardId: $dashboardId, ')
          ..write('transactionId: $transactionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dashboardId, transactionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DashboardTransaction &&
          other.dashboardId == this.dashboardId &&
          other.transactionId == this.transactionId);
}

class DashboardTransactionsCompanion
    extends UpdateCompanion<DashboardTransaction> {
  final Value<String> dashboardId;
  final Value<String> transactionId;
  final Value<int> rowid;
  const DashboardTransactionsCompanion({
    this.dashboardId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DashboardTransactionsCompanion.insert({
    required String dashboardId,
    required String transactionId,
    this.rowid = const Value.absent(),
  }) : dashboardId = Value(dashboardId),
       transactionId = Value(transactionId);
  static Insertable<DashboardTransaction> custom({
    Expression<String>? dashboardId,
    Expression<String>? transactionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dashboardId != null) 'dashboard_id': dashboardId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DashboardTransactionsCompanion copyWith({
    Value<String>? dashboardId,
    Value<String>? transactionId,
    Value<int>? rowid,
  }) {
    return DashboardTransactionsCompanion(
      dashboardId: dashboardId ?? this.dashboardId,
      transactionId: transactionId ?? this.transactionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dashboardId.present) {
      map['dashboard_id'] = Variable<String>(dashboardId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DashboardTransactionsCompanion(')
          ..write('dashboardId: $dashboardId, ')
          ..write('transactionId: $transactionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DashboardRulesTable extends DashboardRules
    with TableInfo<$DashboardRulesTable, DashboardRule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DashboardRulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dashboardIdMeta = const VerificationMeta(
    'dashboardId',
  );
  @override
  late final GeneratedColumn<String> dashboardId = GeneratedColumn<String>(
    'dashboard_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES custom_dashboards (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<DashboardTriggerType, String>
  triggerType =
      GeneratedColumn<String>(
        'trigger_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DashboardTriggerType>(
        $DashboardRulesTable.$convertertriggerType,
      );
  static const VerificationMeta _triggerValueMeta = const VerificationMeta(
    'triggerValue',
  );
  @override
  late final GeneratedColumn<String> triggerValue = GeneratedColumn<String>(
    'trigger_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dashboardId,
    triggerType,
    triggerValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dashboard_rules';
  @override
  VerificationContext validateIntegrity(
    Insertable<DashboardRule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('dashboard_id')) {
      context.handle(
        _dashboardIdMeta,
        dashboardId.isAcceptableOrUnknown(
          data['dashboard_id']!,
          _dashboardIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dashboardIdMeta);
    }
    if (data.containsKey('trigger_value')) {
      context.handle(
        _triggerValueMeta,
        triggerValue.isAcceptableOrUnknown(
          data['trigger_value']!,
          _triggerValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggerValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DashboardRule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DashboardRule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dashboardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dashboard_id'],
      )!,
      triggerType: $DashboardRulesTable.$convertertriggerType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}trigger_type'],
        )!,
      ),
      triggerValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger_value'],
      )!,
    );
  }

  @override
  $DashboardRulesTable createAlias(String alias) {
    return $DashboardRulesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DashboardTriggerType, String, String>
  $convertertriggerType = const EnumNameConverter<DashboardTriggerType>(
    DashboardTriggerType.values,
  );
}

class DashboardRule extends DataClass implements Insertable<DashboardRule> {
  final String id;
  final String dashboardId;
  final DashboardTriggerType triggerType;
  final String triggerValue;
  const DashboardRule({
    required this.id,
    required this.dashboardId,
    required this.triggerType,
    required this.triggerValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['dashboard_id'] = Variable<String>(dashboardId);
    {
      map['trigger_type'] = Variable<String>(
        $DashboardRulesTable.$convertertriggerType.toSql(triggerType),
      );
    }
    map['trigger_value'] = Variable<String>(triggerValue);
    return map;
  }

  DashboardRulesCompanion toCompanion(bool nullToAbsent) {
    return DashboardRulesCompanion(
      id: Value(id),
      dashboardId: Value(dashboardId),
      triggerType: Value(triggerType),
      triggerValue: Value(triggerValue),
    );
  }

  factory DashboardRule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DashboardRule(
      id: serializer.fromJson<String>(json['id']),
      dashboardId: serializer.fromJson<String>(json['dashboardId']),
      triggerType: $DashboardRulesTable.$convertertriggerType.fromJson(
        serializer.fromJson<String>(json['triggerType']),
      ),
      triggerValue: serializer.fromJson<String>(json['triggerValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dashboardId': serializer.toJson<String>(dashboardId),
      'triggerType': serializer.toJson<String>(
        $DashboardRulesTable.$convertertriggerType.toJson(triggerType),
      ),
      'triggerValue': serializer.toJson<String>(triggerValue),
    };
  }

  DashboardRule copyWith({
    String? id,
    String? dashboardId,
    DashboardTriggerType? triggerType,
    String? triggerValue,
  }) => DashboardRule(
    id: id ?? this.id,
    dashboardId: dashboardId ?? this.dashboardId,
    triggerType: triggerType ?? this.triggerType,
    triggerValue: triggerValue ?? this.triggerValue,
  );
  DashboardRule copyWithCompanion(DashboardRulesCompanion data) {
    return DashboardRule(
      id: data.id.present ? data.id.value : this.id,
      dashboardId: data.dashboardId.present
          ? data.dashboardId.value
          : this.dashboardId,
      triggerType: data.triggerType.present
          ? data.triggerType.value
          : this.triggerType,
      triggerValue: data.triggerValue.present
          ? data.triggerValue.value
          : this.triggerValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DashboardRule(')
          ..write('id: $id, ')
          ..write('dashboardId: $dashboardId, ')
          ..write('triggerType: $triggerType, ')
          ..write('triggerValue: $triggerValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dashboardId, triggerType, triggerValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DashboardRule &&
          other.id == this.id &&
          other.dashboardId == this.dashboardId &&
          other.triggerType == this.triggerType &&
          other.triggerValue == this.triggerValue);
}

class DashboardRulesCompanion extends UpdateCompanion<DashboardRule> {
  final Value<String> id;
  final Value<String> dashboardId;
  final Value<DashboardTriggerType> triggerType;
  final Value<String> triggerValue;
  final Value<int> rowid;
  const DashboardRulesCompanion({
    this.id = const Value.absent(),
    this.dashboardId = const Value.absent(),
    this.triggerType = const Value.absent(),
    this.triggerValue = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DashboardRulesCompanion.insert({
    required String id,
    required String dashboardId,
    required DashboardTriggerType triggerType,
    required String triggerValue,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dashboardId = Value(dashboardId),
       triggerType = Value(triggerType),
       triggerValue = Value(triggerValue);
  static Insertable<DashboardRule> custom({
    Expression<String>? id,
    Expression<String>? dashboardId,
    Expression<String>? triggerType,
    Expression<String>? triggerValue,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dashboardId != null) 'dashboard_id': dashboardId,
      if (triggerType != null) 'trigger_type': triggerType,
      if (triggerValue != null) 'trigger_value': triggerValue,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DashboardRulesCompanion copyWith({
    Value<String>? id,
    Value<String>? dashboardId,
    Value<DashboardTriggerType>? triggerType,
    Value<String>? triggerValue,
    Value<int>? rowid,
  }) {
    return DashboardRulesCompanion(
      id: id ?? this.id,
      dashboardId: dashboardId ?? this.dashboardId,
      triggerType: triggerType ?? this.triggerType,
      triggerValue: triggerValue ?? this.triggerValue,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dashboardId.present) {
      map['dashboard_id'] = Variable<String>(dashboardId.value);
    }
    if (triggerType.present) {
      map['trigger_type'] = Variable<String>(
        $DashboardRulesTable.$convertertriggerType.toSql(triggerType.value),
      );
    }
    if (triggerValue.present) {
      map['trigger_value'] = Variable<String>(triggerValue.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DashboardRulesCompanion(')
          ..write('id: $id, ')
          ..write('dashboardId: $dashboardId, ')
          ..write('triggerType: $triggerType, ')
          ..write('triggerValue: $triggerValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryRulesTable extends CategoryRules
    with TableInfo<$CategoryRulesTable, CategoryRule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryRulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spaceIdMeta = const VerificationMeta(
    'spaceId',
  );
  @override
  late final GeneratedColumn<String> spaceId = GeneratedColumn<String>(
    'space_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES spaces (id)',
    ),
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggerStringMeta = const VerificationMeta(
    'triggerString',
  );
  @override
  late final GeneratedColumn<String> triggerString = GeneratedColumn<String>(
    'trigger_string',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetCategoryIdMeta = const VerificationMeta(
    'targetCategoryId',
  );
  @override
  late final GeneratedColumn<String> targetCategoryId = GeneratedColumn<String>(
    'target_category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    spaceId,
    bankName,
    triggerString,
    targetCategoryId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_rules';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryRule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('space_id')) {
      context.handle(
        _spaceIdMeta,
        spaceId.isAcceptableOrUnknown(data['space_id']!, _spaceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_spaceIdMeta);
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    } else if (isInserting) {
      context.missing(_bankNameMeta);
    }
    if (data.containsKey('trigger_string')) {
      context.handle(
        _triggerStringMeta,
        triggerString.isAcceptableOrUnknown(
          data['trigger_string']!,
          _triggerStringMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggerStringMeta);
    }
    if (data.containsKey('target_category_id')) {
      context.handle(
        _targetCategoryIdMeta,
        targetCategoryId.isAcceptableOrUnknown(
          data['target_category_id']!,
          _targetCategoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetCategoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryRule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryRule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      spaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}space_id'],
      )!,
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      )!,
      triggerString: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger_string'],
      )!,
      targetCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_category_id'],
      )!,
    );
  }

  @override
  $CategoryRulesTable createAlias(String alias) {
    return $CategoryRulesTable(attachedDatabase, alias);
  }
}

class CategoryRule extends DataClass implements Insertable<CategoryRule> {
  final String id;
  final String spaceId;
  final String bankName;
  final String triggerString;
  final String targetCategoryId;
  const CategoryRule({
    required this.id,
    required this.spaceId,
    required this.bankName,
    required this.triggerString,
    required this.targetCategoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['space_id'] = Variable<String>(spaceId);
    map['bank_name'] = Variable<String>(bankName);
    map['trigger_string'] = Variable<String>(triggerString);
    map['target_category_id'] = Variable<String>(targetCategoryId);
    return map;
  }

  CategoryRulesCompanion toCompanion(bool nullToAbsent) {
    return CategoryRulesCompanion(
      id: Value(id),
      spaceId: Value(spaceId),
      bankName: Value(bankName),
      triggerString: Value(triggerString),
      targetCategoryId: Value(targetCategoryId),
    );
  }

  factory CategoryRule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryRule(
      id: serializer.fromJson<String>(json['id']),
      spaceId: serializer.fromJson<String>(json['spaceId']),
      bankName: serializer.fromJson<String>(json['bankName']),
      triggerString: serializer.fromJson<String>(json['triggerString']),
      targetCategoryId: serializer.fromJson<String>(json['targetCategoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'spaceId': serializer.toJson<String>(spaceId),
      'bankName': serializer.toJson<String>(bankName),
      'triggerString': serializer.toJson<String>(triggerString),
      'targetCategoryId': serializer.toJson<String>(targetCategoryId),
    };
  }

  CategoryRule copyWith({
    String? id,
    String? spaceId,
    String? bankName,
    String? triggerString,
    String? targetCategoryId,
  }) => CategoryRule(
    id: id ?? this.id,
    spaceId: spaceId ?? this.spaceId,
    bankName: bankName ?? this.bankName,
    triggerString: triggerString ?? this.triggerString,
    targetCategoryId: targetCategoryId ?? this.targetCategoryId,
  );
  CategoryRule copyWithCompanion(CategoryRulesCompanion data) {
    return CategoryRule(
      id: data.id.present ? data.id.value : this.id,
      spaceId: data.spaceId.present ? data.spaceId.value : this.spaceId,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      triggerString: data.triggerString.present
          ? data.triggerString.value
          : this.triggerString,
      targetCategoryId: data.targetCategoryId.present
          ? data.targetCategoryId.value
          : this.targetCategoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRule(')
          ..write('id: $id, ')
          ..write('spaceId: $spaceId, ')
          ..write('bankName: $bankName, ')
          ..write('triggerString: $triggerString, ')
          ..write('targetCategoryId: $targetCategoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, spaceId, bankName, triggerString, targetCategoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryRule &&
          other.id == this.id &&
          other.spaceId == this.spaceId &&
          other.bankName == this.bankName &&
          other.triggerString == this.triggerString &&
          other.targetCategoryId == this.targetCategoryId);
}

class CategoryRulesCompanion extends UpdateCompanion<CategoryRule> {
  final Value<String> id;
  final Value<String> spaceId;
  final Value<String> bankName;
  final Value<String> triggerString;
  final Value<String> targetCategoryId;
  final Value<int> rowid;
  const CategoryRulesCompanion({
    this.id = const Value.absent(),
    this.spaceId = const Value.absent(),
    this.bankName = const Value.absent(),
    this.triggerString = const Value.absent(),
    this.targetCategoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryRulesCompanion.insert({
    required String id,
    required String spaceId,
    required String bankName,
    required String triggerString,
    required String targetCategoryId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       spaceId = Value(spaceId),
       bankName = Value(bankName),
       triggerString = Value(triggerString),
       targetCategoryId = Value(targetCategoryId);
  static Insertable<CategoryRule> custom({
    Expression<String>? id,
    Expression<String>? spaceId,
    Expression<String>? bankName,
    Expression<String>? triggerString,
    Expression<String>? targetCategoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (spaceId != null) 'space_id': spaceId,
      if (bankName != null) 'bank_name': bankName,
      if (triggerString != null) 'trigger_string': triggerString,
      if (targetCategoryId != null) 'target_category_id': targetCategoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryRulesCompanion copyWith({
    Value<String>? id,
    Value<String>? spaceId,
    Value<String>? bankName,
    Value<String>? triggerString,
    Value<String>? targetCategoryId,
    Value<int>? rowid,
  }) {
    return CategoryRulesCompanion(
      id: id ?? this.id,
      spaceId: spaceId ?? this.spaceId,
      bankName: bankName ?? this.bankName,
      triggerString: triggerString ?? this.triggerString,
      targetCategoryId: targetCategoryId ?? this.targetCategoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (spaceId.present) {
      map['space_id'] = Variable<String>(spaceId.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (triggerString.present) {
      map['trigger_string'] = Variable<String>(triggerString.value);
    }
    if (targetCategoryId.present) {
      map['target_category_id'] = Variable<String>(targetCategoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRulesCompanion(')
          ..write('id: $id, ')
          ..write('spaceId: $spaceId, ')
          ..write('bankName: $bankName, ')
          ..write('triggerString: $triggerString, ')
          ..write('targetCategoryId: $targetCategoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrustedCounterpartiesTable extends TrustedCounterparties
    with TableInfo<$TrustedCounterpartiesTable, TrustedCounterparty> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrustedCounterpartiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _counterpartyIdentityMeta =
      const VerificationMeta('counterpartyIdentity');
  @override
  late final GeneratedColumn<String> counterpartyIdentity =
      GeneratedColumn<String>(
        'counterparty_identity',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _excludeExpensesMeta = const VerificationMeta(
    'excludeExpenses',
  );
  @override
  late final GeneratedColumn<bool> excludeExpenses = GeneratedColumn<bool>(
    'exclude_expenses',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("exclude_expenses" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _excludeIncomesMeta = const VerificationMeta(
    'excludeIncomes',
  );
  @override
  late final GeneratedColumn<bool> excludeIncomes = GeneratedColumn<bool>(
    'exclude_incomes',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("exclude_incomes" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    counterpartyIdentity,
    excludeExpenses,
    excludeIncomes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trusted_counterparties';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrustedCounterparty> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('counterparty_identity')) {
      context.handle(
        _counterpartyIdentityMeta,
        counterpartyIdentity.isAcceptableOrUnknown(
          data['counterparty_identity']!,
          _counterpartyIdentityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_counterpartyIdentityMeta);
    }
    if (data.containsKey('exclude_expenses')) {
      context.handle(
        _excludeExpensesMeta,
        excludeExpenses.isAcceptableOrUnknown(
          data['exclude_expenses']!,
          _excludeExpensesMeta,
        ),
      );
    }
    if (data.containsKey('exclude_incomes')) {
      context.handle(
        _excludeIncomesMeta,
        excludeIncomes.isAcceptableOrUnknown(
          data['exclude_incomes']!,
          _excludeIncomesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrustedCounterparty map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrustedCounterparty(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      counterpartyIdentity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}counterparty_identity'],
      )!,
      excludeExpenses: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}exclude_expenses'],
      )!,
      excludeIncomes: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}exclude_incomes'],
      )!,
    );
  }

  @override
  $TrustedCounterpartiesTable createAlias(String alias) {
    return $TrustedCounterpartiesTable(attachedDatabase, alias);
  }
}

class TrustedCounterparty extends DataClass
    implements Insertable<TrustedCounterparty> {
  final String id;
  final String userId;
  final String counterpartyIdentity;
  final bool excludeExpenses;
  final bool excludeIncomes;
  const TrustedCounterparty({
    required this.id,
    required this.userId,
    required this.counterpartyIdentity,
    required this.excludeExpenses,
    required this.excludeIncomes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['counterparty_identity'] = Variable<String>(counterpartyIdentity);
    map['exclude_expenses'] = Variable<bool>(excludeExpenses);
    map['exclude_incomes'] = Variable<bool>(excludeIncomes);
    return map;
  }

  TrustedCounterpartiesCompanion toCompanion(bool nullToAbsent) {
    return TrustedCounterpartiesCompanion(
      id: Value(id),
      userId: Value(userId),
      counterpartyIdentity: Value(counterpartyIdentity),
      excludeExpenses: Value(excludeExpenses),
      excludeIncomes: Value(excludeIncomes),
    );
  }

  factory TrustedCounterparty.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrustedCounterparty(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      counterpartyIdentity: serializer.fromJson<String>(
        json['counterpartyIdentity'],
      ),
      excludeExpenses: serializer.fromJson<bool>(json['excludeExpenses']),
      excludeIncomes: serializer.fromJson<bool>(json['excludeIncomes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'counterpartyIdentity': serializer.toJson<String>(counterpartyIdentity),
      'excludeExpenses': serializer.toJson<bool>(excludeExpenses),
      'excludeIncomes': serializer.toJson<bool>(excludeIncomes),
    };
  }

  TrustedCounterparty copyWith({
    String? id,
    String? userId,
    String? counterpartyIdentity,
    bool? excludeExpenses,
    bool? excludeIncomes,
  }) => TrustedCounterparty(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    counterpartyIdentity: counterpartyIdentity ?? this.counterpartyIdentity,
    excludeExpenses: excludeExpenses ?? this.excludeExpenses,
    excludeIncomes: excludeIncomes ?? this.excludeIncomes,
  );
  TrustedCounterparty copyWithCompanion(TrustedCounterpartiesCompanion data) {
    return TrustedCounterparty(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      counterpartyIdentity: data.counterpartyIdentity.present
          ? data.counterpartyIdentity.value
          : this.counterpartyIdentity,
      excludeExpenses: data.excludeExpenses.present
          ? data.excludeExpenses.value
          : this.excludeExpenses,
      excludeIncomes: data.excludeIncomes.present
          ? data.excludeIncomes.value
          : this.excludeIncomes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrustedCounterparty(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('counterpartyIdentity: $counterpartyIdentity, ')
          ..write('excludeExpenses: $excludeExpenses, ')
          ..write('excludeIncomes: $excludeIncomes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    counterpartyIdentity,
    excludeExpenses,
    excludeIncomes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrustedCounterparty &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.counterpartyIdentity == this.counterpartyIdentity &&
          other.excludeExpenses == this.excludeExpenses &&
          other.excludeIncomes == this.excludeIncomes);
}

class TrustedCounterpartiesCompanion
    extends UpdateCompanion<TrustedCounterparty> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> counterpartyIdentity;
  final Value<bool> excludeExpenses;
  final Value<bool> excludeIncomes;
  final Value<int> rowid;
  const TrustedCounterpartiesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.counterpartyIdentity = const Value.absent(),
    this.excludeExpenses = const Value.absent(),
    this.excludeIncomes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrustedCounterpartiesCompanion.insert({
    required String id,
    required String userId,
    required String counterpartyIdentity,
    this.excludeExpenses = const Value.absent(),
    this.excludeIncomes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       counterpartyIdentity = Value(counterpartyIdentity);
  static Insertable<TrustedCounterparty> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? counterpartyIdentity,
    Expression<bool>? excludeExpenses,
    Expression<bool>? excludeIncomes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (counterpartyIdentity != null)
        'counterparty_identity': counterpartyIdentity,
      if (excludeExpenses != null) 'exclude_expenses': excludeExpenses,
      if (excludeIncomes != null) 'exclude_incomes': excludeIncomes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrustedCounterpartiesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? counterpartyIdentity,
    Value<bool>? excludeExpenses,
    Value<bool>? excludeIncomes,
    Value<int>? rowid,
  }) {
    return TrustedCounterpartiesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      counterpartyIdentity: counterpartyIdentity ?? this.counterpartyIdentity,
      excludeExpenses: excludeExpenses ?? this.excludeExpenses,
      excludeIncomes: excludeIncomes ?? this.excludeIncomes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (counterpartyIdentity.present) {
      map['counterparty_identity'] = Variable<String>(
        counterpartyIdentity.value,
      );
    }
    if (excludeExpenses.present) {
      map['exclude_expenses'] = Variable<bool>(excludeExpenses.value);
    }
    if (excludeIncomes.present) {
      map['exclude_incomes'] = Variable<bool>(excludeIncomes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrustedCounterpartiesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('counterpartyIdentity: $counterpartyIdentity, ')
          ..write('excludeExpenses: $excludeExpenses, ')
          ..write('excludeIncomes: $excludeIncomes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BudgetLimitsTable extends BudgetLimits
    with TableInfo<$BudgetLimitsTable, BudgetLimit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetLimitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spaceIdMeta = const VerificationMeta(
    'spaceId',
  );
  @override
  late final GeneratedColumn<String> spaceId = GeneratedColumn<String>(
    'space_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES spaces (id)',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<int> month = GeneratedColumn<int>(
    'month',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _limitAmountMeta = const VerificationMeta(
    'limitAmount',
  );
  @override
  late final GeneratedColumn<double> limitAmount = GeneratedColumn<double>(
    'limit_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _alertPercentMeta = const VerificationMeta(
    'alertPercent',
  );
  @override
  late final GeneratedColumn<int> alertPercent = GeneratedColumn<int>(
    'alert_percent',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alertAmountMeta = const VerificationMeta(
    'alertAmount',
  );
  @override
  late final GeneratedColumn<double> alertAmount = GeneratedColumn<double>(
    'alert_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    spaceId,
    categoryId,
    year,
    month,
    limitAmount,
    alertPercent,
    alertAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budget_limits';
  @override
  VerificationContext validateIntegrity(
    Insertable<BudgetLimit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('space_id')) {
      context.handle(
        _spaceIdMeta,
        spaceId.isAcceptableOrUnknown(data['space_id']!, _spaceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_spaceIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
        _monthMeta,
        month.isAcceptableOrUnknown(data['month']!, _monthMeta),
      );
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('limit_amount')) {
      context.handle(
        _limitAmountMeta,
        limitAmount.isAcceptableOrUnknown(
          data['limit_amount']!,
          _limitAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_limitAmountMeta);
    }
    if (data.containsKey('alert_percent')) {
      context.handle(
        _alertPercentMeta,
        alertPercent.isAcceptableOrUnknown(
          data['alert_percent']!,
          _alertPercentMeta,
        ),
      );
    }
    if (data.containsKey('alert_amount')) {
      context.handle(
        _alertAmountMeta,
        alertAmount.isAcceptableOrUnknown(
          data['alert_amount']!,
          _alertAmountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetLimit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetLimit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      spaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}space_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      month: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}month'],
      )!,
      limitAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}limit_amount'],
      )!,
      alertPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alert_percent'],
      ),
      alertAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}alert_amount'],
      ),
    );
  }

  @override
  $BudgetLimitsTable createAlias(String alias) {
    return $BudgetLimitsTable(attachedDatabase, alias);
  }
}

class BudgetLimit extends DataClass implements Insertable<BudgetLimit> {
  final String id;
  final String spaceId;
  final String categoryId;
  final int year;
  final int month;
  final double limitAmount;
  final int? alertPercent;
  final double? alertAmount;
  const BudgetLimit({
    required this.id,
    required this.spaceId,
    required this.categoryId,
    required this.year,
    required this.month,
    required this.limitAmount,
    this.alertPercent,
    this.alertAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['space_id'] = Variable<String>(spaceId);
    map['category_id'] = Variable<String>(categoryId);
    map['year'] = Variable<int>(year);
    map['month'] = Variable<int>(month);
    map['limit_amount'] = Variable<double>(limitAmount);
    if (!nullToAbsent || alertPercent != null) {
      map['alert_percent'] = Variable<int>(alertPercent);
    }
    if (!nullToAbsent || alertAmount != null) {
      map['alert_amount'] = Variable<double>(alertAmount);
    }
    return map;
  }

  BudgetLimitsCompanion toCompanion(bool nullToAbsent) {
    return BudgetLimitsCompanion(
      id: Value(id),
      spaceId: Value(spaceId),
      categoryId: Value(categoryId),
      year: Value(year),
      month: Value(month),
      limitAmount: Value(limitAmount),
      alertPercent: alertPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(alertPercent),
      alertAmount: alertAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(alertAmount),
    );
  }

  factory BudgetLimit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetLimit(
      id: serializer.fromJson<String>(json['id']),
      spaceId: serializer.fromJson<String>(json['spaceId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      year: serializer.fromJson<int>(json['year']),
      month: serializer.fromJson<int>(json['month']),
      limitAmount: serializer.fromJson<double>(json['limitAmount']),
      alertPercent: serializer.fromJson<int?>(json['alertPercent']),
      alertAmount: serializer.fromJson<double?>(json['alertAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'spaceId': serializer.toJson<String>(spaceId),
      'categoryId': serializer.toJson<String>(categoryId),
      'year': serializer.toJson<int>(year),
      'month': serializer.toJson<int>(month),
      'limitAmount': serializer.toJson<double>(limitAmount),
      'alertPercent': serializer.toJson<int?>(alertPercent),
      'alertAmount': serializer.toJson<double?>(alertAmount),
    };
  }

  BudgetLimit copyWith({
    String? id,
    String? spaceId,
    String? categoryId,
    int? year,
    int? month,
    double? limitAmount,
    Value<int?> alertPercent = const Value.absent(),
    Value<double?> alertAmount = const Value.absent(),
  }) => BudgetLimit(
    id: id ?? this.id,
    spaceId: spaceId ?? this.spaceId,
    categoryId: categoryId ?? this.categoryId,
    year: year ?? this.year,
    month: month ?? this.month,
    limitAmount: limitAmount ?? this.limitAmount,
    alertPercent: alertPercent.present ? alertPercent.value : this.alertPercent,
    alertAmount: alertAmount.present ? alertAmount.value : this.alertAmount,
  );
  BudgetLimit copyWithCompanion(BudgetLimitsCompanion data) {
    return BudgetLimit(
      id: data.id.present ? data.id.value : this.id,
      spaceId: data.spaceId.present ? data.spaceId.value : this.spaceId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      year: data.year.present ? data.year.value : this.year,
      month: data.month.present ? data.month.value : this.month,
      limitAmount: data.limitAmount.present
          ? data.limitAmount.value
          : this.limitAmount,
      alertPercent: data.alertPercent.present
          ? data.alertPercent.value
          : this.alertPercent,
      alertAmount: data.alertAmount.present
          ? data.alertAmount.value
          : this.alertAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetLimit(')
          ..write('id: $id, ')
          ..write('spaceId: $spaceId, ')
          ..write('categoryId: $categoryId, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('limitAmount: $limitAmount, ')
          ..write('alertPercent: $alertPercent, ')
          ..write('alertAmount: $alertAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    spaceId,
    categoryId,
    year,
    month,
    limitAmount,
    alertPercent,
    alertAmount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetLimit &&
          other.id == this.id &&
          other.spaceId == this.spaceId &&
          other.categoryId == this.categoryId &&
          other.year == this.year &&
          other.month == this.month &&
          other.limitAmount == this.limitAmount &&
          other.alertPercent == this.alertPercent &&
          other.alertAmount == this.alertAmount);
}

class BudgetLimitsCompanion extends UpdateCompanion<BudgetLimit> {
  final Value<String> id;
  final Value<String> spaceId;
  final Value<String> categoryId;
  final Value<int> year;
  final Value<int> month;
  final Value<double> limitAmount;
  final Value<int?> alertPercent;
  final Value<double?> alertAmount;
  final Value<int> rowid;
  const BudgetLimitsCompanion({
    this.id = const Value.absent(),
    this.spaceId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.year = const Value.absent(),
    this.month = const Value.absent(),
    this.limitAmount = const Value.absent(),
    this.alertPercent = const Value.absent(),
    this.alertAmount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BudgetLimitsCompanion.insert({
    required String id,
    required String spaceId,
    required String categoryId,
    required int year,
    required int month,
    required double limitAmount,
    this.alertPercent = const Value.absent(),
    this.alertAmount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       spaceId = Value(spaceId),
       categoryId = Value(categoryId),
       year = Value(year),
       month = Value(month),
       limitAmount = Value(limitAmount);
  static Insertable<BudgetLimit> custom({
    Expression<String>? id,
    Expression<String>? spaceId,
    Expression<String>? categoryId,
    Expression<int>? year,
    Expression<int>? month,
    Expression<double>? limitAmount,
    Expression<int>? alertPercent,
    Expression<double>? alertAmount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (spaceId != null) 'space_id': spaceId,
      if (categoryId != null) 'category_id': categoryId,
      if (year != null) 'year': year,
      if (month != null) 'month': month,
      if (limitAmount != null) 'limit_amount': limitAmount,
      if (alertPercent != null) 'alert_percent': alertPercent,
      if (alertAmount != null) 'alert_amount': alertAmount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BudgetLimitsCompanion copyWith({
    Value<String>? id,
    Value<String>? spaceId,
    Value<String>? categoryId,
    Value<int>? year,
    Value<int>? month,
    Value<double>? limitAmount,
    Value<int?>? alertPercent,
    Value<double?>? alertAmount,
    Value<int>? rowid,
  }) {
    return BudgetLimitsCompanion(
      id: id ?? this.id,
      spaceId: spaceId ?? this.spaceId,
      categoryId: categoryId ?? this.categoryId,
      year: year ?? this.year,
      month: month ?? this.month,
      limitAmount: limitAmount ?? this.limitAmount,
      alertPercent: alertPercent ?? this.alertPercent,
      alertAmount: alertAmount ?? this.alertAmount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (spaceId.present) {
      map['space_id'] = Variable<String>(spaceId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (limitAmount.present) {
      map['limit_amount'] = Variable<double>(limitAmount.value);
    }
    if (alertPercent.present) {
      map['alert_percent'] = Variable<int>(alertPercent.value);
    }
    if (alertAmount.present) {
      map['alert_amount'] = Variable<double>(alertAmount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetLimitsCompanion(')
          ..write('id: $id, ')
          ..write('spaceId: $spaceId, ')
          ..write('categoryId: $categoryId, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('limitAmount: $limitAmount, ')
          ..write('alertPercent: $alertPercent, ')
          ..write('alertAmount: $alertAmount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashbackMatrixTable extends CashbackMatrix
    with TableInfo<$CashbackMatrixTable, CashbackMatrixData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashbackMatrixTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id)',
    ),
  );
  static const VerificationMeta _categoryNameMeta = const VerificationMeta(
    'categoryName',
  );
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _percentMeta = const VerificationMeta(
    'percent',
  );
  @override
  late final GeneratedColumn<double> percent = GeneratedColumn<double>(
    'percent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CashbackStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CashbackStatus>($CashbackMatrixTable.$converterstatus);
  @override
  late final GeneratedColumnWithTypeConverter<CashbackLifetimeType, String>
  lifetimeType =
      GeneratedColumn<String>(
        'lifetime_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CashbackLifetimeType>(
        $CashbackMatrixTable.$converterlifetimeType,
      );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    categoryName,
    percent,
    status,
    lifetimeType,
    expiresAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cashback_matrix';
  @override
  VerificationContext validateIntegrity(
    Insertable<CashbackMatrixData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
        _categoryNameMeta,
        categoryName.isAcceptableOrUnknown(
          data['category_name']!,
          _categoryNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    if (data.containsKey('percent')) {
      context.handle(
        _percentMeta,
        percent.isAcceptableOrUnknown(data['percent']!, _percentMeta),
      );
    } else if (isInserting) {
      context.missing(_percentMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashbackMatrixData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashbackMatrixData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      categoryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_name'],
      )!,
      percent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}percent'],
      )!,
      status: $CashbackMatrixTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      lifetimeType: $CashbackMatrixTable.$converterlifetimeType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}lifetime_type'],
        )!,
      ),
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      ),
    );
  }

  @override
  $CashbackMatrixTable createAlias(String alias) {
    return $CashbackMatrixTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CashbackStatus, String, String> $converterstatus =
      const EnumNameConverter<CashbackStatus>(CashbackStatus.values);
  static JsonTypeConverter2<CashbackLifetimeType, String, String>
  $converterlifetimeType = const EnumNameConverter<CashbackLifetimeType>(
    CashbackLifetimeType.values,
  );
}

class CashbackMatrixData extends DataClass
    implements Insertable<CashbackMatrixData> {
  final String id;
  final String accountId;
  final String categoryName;
  final double percent;
  final CashbackStatus status;
  final CashbackLifetimeType lifetimeType;
  final DateTime? expiresAt;
  const CashbackMatrixData({
    required this.id,
    required this.accountId,
    required this.categoryName,
    required this.percent,
    required this.status,
    required this.lifetimeType,
    this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['account_id'] = Variable<String>(accountId);
    map['category_name'] = Variable<String>(categoryName);
    map['percent'] = Variable<double>(percent);
    {
      map['status'] = Variable<String>(
        $CashbackMatrixTable.$converterstatus.toSql(status),
      );
    }
    {
      map['lifetime_type'] = Variable<String>(
        $CashbackMatrixTable.$converterlifetimeType.toSql(lifetimeType),
      );
    }
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    return map;
  }

  CashbackMatrixCompanion toCompanion(bool nullToAbsent) {
    return CashbackMatrixCompanion(
      id: Value(id),
      accountId: Value(accountId),
      categoryName: Value(categoryName),
      percent: Value(percent),
      status: Value(status),
      lifetimeType: Value(lifetimeType),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
    );
  }

  factory CashbackMatrixData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashbackMatrixData(
      id: serializer.fromJson<String>(json['id']),
      accountId: serializer.fromJson<String>(json['accountId']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
      percent: serializer.fromJson<double>(json['percent']),
      status: $CashbackMatrixTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      lifetimeType: $CashbackMatrixTable.$converterlifetimeType.fromJson(
        serializer.fromJson<String>(json['lifetimeType']),
      ),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'accountId': serializer.toJson<String>(accountId),
      'categoryName': serializer.toJson<String>(categoryName),
      'percent': serializer.toJson<double>(percent),
      'status': serializer.toJson<String>(
        $CashbackMatrixTable.$converterstatus.toJson(status),
      ),
      'lifetimeType': serializer.toJson<String>(
        $CashbackMatrixTable.$converterlifetimeType.toJson(lifetimeType),
      ),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
    };
  }

  CashbackMatrixData copyWith({
    String? id,
    String? accountId,
    String? categoryName,
    double? percent,
    CashbackStatus? status,
    CashbackLifetimeType? lifetimeType,
    Value<DateTime?> expiresAt = const Value.absent(),
  }) => CashbackMatrixData(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    categoryName: categoryName ?? this.categoryName,
    percent: percent ?? this.percent,
    status: status ?? this.status,
    lifetimeType: lifetimeType ?? this.lifetimeType,
    expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
  );
  CashbackMatrixData copyWithCompanion(CashbackMatrixCompanion data) {
    return CashbackMatrixData(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
      percent: data.percent.present ? data.percent.value : this.percent,
      status: data.status.present ? data.status.value : this.status,
      lifetimeType: data.lifetimeType.present
          ? data.lifetimeType.value
          : this.lifetimeType,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashbackMatrixData(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryName: $categoryName, ')
          ..write('percent: $percent, ')
          ..write('status: $status, ')
          ..write('lifetimeType: $lifetimeType, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    categoryName,
    percent,
    status,
    lifetimeType,
    expiresAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashbackMatrixData &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.categoryName == this.categoryName &&
          other.percent == this.percent &&
          other.status == this.status &&
          other.lifetimeType == this.lifetimeType &&
          other.expiresAt == this.expiresAt);
}

class CashbackMatrixCompanion extends UpdateCompanion<CashbackMatrixData> {
  final Value<String> id;
  final Value<String> accountId;
  final Value<String> categoryName;
  final Value<double> percent;
  final Value<CashbackStatus> status;
  final Value<CashbackLifetimeType> lifetimeType;
  final Value<DateTime?> expiresAt;
  final Value<int> rowid;
  const CashbackMatrixCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.percent = const Value.absent(),
    this.status = const Value.absent(),
    this.lifetimeType = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashbackMatrixCompanion.insert({
    required String id,
    required String accountId,
    required String categoryName,
    required double percent,
    required CashbackStatus status,
    required CashbackLifetimeType lifetimeType,
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       accountId = Value(accountId),
       categoryName = Value(categoryName),
       percent = Value(percent),
       status = Value(status),
       lifetimeType = Value(lifetimeType);
  static Insertable<CashbackMatrixData> custom({
    Expression<String>? id,
    Expression<String>? accountId,
    Expression<String>? categoryName,
    Expression<double>? percent,
    Expression<String>? status,
    Expression<String>? lifetimeType,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (categoryName != null) 'category_name': categoryName,
      if (percent != null) 'percent': percent,
      if (status != null) 'status': status,
      if (lifetimeType != null) 'lifetime_type': lifetimeType,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashbackMatrixCompanion copyWith({
    Value<String>? id,
    Value<String>? accountId,
    Value<String>? categoryName,
    Value<double>? percent,
    Value<CashbackStatus>? status,
    Value<CashbackLifetimeType>? lifetimeType,
    Value<DateTime?>? expiresAt,
    Value<int>? rowid,
  }) {
    return CashbackMatrixCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryName: categoryName ?? this.categoryName,
      percent: percent ?? this.percent,
      status: status ?? this.status,
      lifetimeType: lifetimeType ?? this.lifetimeType,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (percent.present) {
      map['percent'] = Variable<double>(percent.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $CashbackMatrixTable.$converterstatus.toSql(status.value),
      );
    }
    if (lifetimeType.present) {
      map['lifetime_type'] = Variable<String>(
        $CashbackMatrixTable.$converterlifetimeType.toSql(lifetimeType.value),
      );
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashbackMatrixCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryName: $categoryName, ')
          ..write('percent: $percent, ')
          ..write('status: $status, ')
          ..write('lifetimeType: $lifetimeType, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExchangeRatesTable extends ExchangeRates
    with TableInfo<$ExchangeRatesTable, ExchangeRate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExchangeRatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromCurrencyMeta = const VerificationMeta(
    'fromCurrency',
  );
  @override
  late final GeneratedColumn<String> fromCurrency = GeneratedColumn<String>(
    'from_currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toCurrencyMeta = const VerificationMeta(
    'toCurrency',
  );
  @override
  late final GeneratedColumn<String> toCurrency = GeneratedColumn<String>(
    'to_currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
    'rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    fromCurrency,
    toCurrency,
    rate,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exchange_rates';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExchangeRate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('from_currency')) {
      context.handle(
        _fromCurrencyMeta,
        fromCurrency.isAcceptableOrUnknown(
          data['from_currency']!,
          _fromCurrencyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fromCurrencyMeta);
    }
    if (data.containsKey('to_currency')) {
      context.handle(
        _toCurrencyMeta,
        toCurrency.isAcceptableOrUnknown(data['to_currency']!, _toCurrencyMeta),
      );
    } else if (isInserting) {
      context.missing(_toCurrencyMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
        _rateMeta,
        rate.isAcceptableOrUnknown(data['rate']!, _rateMeta),
      );
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExchangeRate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExchangeRate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      fromCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_currency'],
      )!,
      toCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_currency'],
      )!,
      rate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rate'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $ExchangeRatesTable createAlias(String alias) {
    return $ExchangeRatesTable(attachedDatabase, alias);
  }
}

class ExchangeRate extends DataClass implements Insertable<ExchangeRate> {
  final String id;
  final DateTime date;
  final String fromCurrency;
  final String toCurrency;
  final double rate;
  final String source;
  const ExchangeRate({
    required this.id,
    required this.date,
    required this.fromCurrency,
    required this.toCurrency,
    required this.rate,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['from_currency'] = Variable<String>(fromCurrency);
    map['to_currency'] = Variable<String>(toCurrency);
    map['rate'] = Variable<double>(rate);
    map['source'] = Variable<String>(source);
    return map;
  }

  ExchangeRatesCompanion toCompanion(bool nullToAbsent) {
    return ExchangeRatesCompanion(
      id: Value(id),
      date: Value(date),
      fromCurrency: Value(fromCurrency),
      toCurrency: Value(toCurrency),
      rate: Value(rate),
      source: Value(source),
    );
  }

  factory ExchangeRate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExchangeRate(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      fromCurrency: serializer.fromJson<String>(json['fromCurrency']),
      toCurrency: serializer.fromJson<String>(json['toCurrency']),
      rate: serializer.fromJson<double>(json['rate']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'fromCurrency': serializer.toJson<String>(fromCurrency),
      'toCurrency': serializer.toJson<String>(toCurrency),
      'rate': serializer.toJson<double>(rate),
      'source': serializer.toJson<String>(source),
    };
  }

  ExchangeRate copyWith({
    String? id,
    DateTime? date,
    String? fromCurrency,
    String? toCurrency,
    double? rate,
    String? source,
  }) => ExchangeRate(
    id: id ?? this.id,
    date: date ?? this.date,
    fromCurrency: fromCurrency ?? this.fromCurrency,
    toCurrency: toCurrency ?? this.toCurrency,
    rate: rate ?? this.rate,
    source: source ?? this.source,
  );
  ExchangeRate copyWithCompanion(ExchangeRatesCompanion data) {
    return ExchangeRate(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      fromCurrency: data.fromCurrency.present
          ? data.fromCurrency.value
          : this.fromCurrency,
      toCurrency: data.toCurrency.present
          ? data.toCurrency.value
          : this.toCurrency,
      rate: data.rate.present ? data.rate.value : this.rate,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExchangeRate(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('fromCurrency: $fromCurrency, ')
          ..write('toCurrency: $toCurrency, ')
          ..write('rate: $rate, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, fromCurrency, toCurrency, rate, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExchangeRate &&
          other.id == this.id &&
          other.date == this.date &&
          other.fromCurrency == this.fromCurrency &&
          other.toCurrency == this.toCurrency &&
          other.rate == this.rate &&
          other.source == this.source);
}

class ExchangeRatesCompanion extends UpdateCompanion<ExchangeRate> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<String> fromCurrency;
  final Value<String> toCurrency;
  final Value<double> rate;
  final Value<String> source;
  final Value<int> rowid;
  const ExchangeRatesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.fromCurrency = const Value.absent(),
    this.toCurrency = const Value.absent(),
    this.rate = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExchangeRatesCompanion.insert({
    required String id,
    required DateTime date,
    required String fromCurrency,
    required String toCurrency,
    required double rate,
    required String source,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       fromCurrency = Value(fromCurrency),
       toCurrency = Value(toCurrency),
       rate = Value(rate),
       source = Value(source);
  static Insertable<ExchangeRate> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<String>? fromCurrency,
    Expression<String>? toCurrency,
    Expression<double>? rate,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (fromCurrency != null) 'from_currency': fromCurrency,
      if (toCurrency != null) 'to_currency': toCurrency,
      if (rate != null) 'rate': rate,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExchangeRatesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<String>? fromCurrency,
    Value<String>? toCurrency,
    Value<double>? rate,
    Value<String>? source,
    Value<int>? rowid,
  }) {
    return ExchangeRatesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      rate: rate ?? this.rate,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (fromCurrency.present) {
      map['from_currency'] = Variable<String>(fromCurrency.value);
    }
    if (toCurrency.present) {
      map['to_currency'] = Variable<String>(toCurrency.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExchangeRatesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('fromCurrency: $fromCurrency, ')
          ..write('toCurrency: $toCurrency, ')
          ..write('rate: $rate, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _baseCurrencyMeta = const VerificationMeta(
    'baseCurrency',
  );
  @override
  late final GeneratedColumn<String> baseCurrency = GeneratedColumn<String>(
    'base_currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('RUB'),
  );
  static const VerificationMeta _useHistoricalExchangeRateMeta =
      const VerificationMeta('useHistoricalExchangeRate');
  @override
  late final GeneratedColumn<bool> useHistoricalExchangeRate =
      GeneratedColumn<bool>(
        'use_historical_exchange_rate',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("use_historical_exchange_rate" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _refundsOffsetExpensesMeta =
      const VerificationMeta('refundsOffsetExpenses');
  @override
  late final GeneratedColumn<bool> refundsOffsetExpenses =
      GeneratedColumn<bool>(
        'refunds_offset_expenses',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("refunds_offset_expenses" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _inheritLimitFromPreviousMonthMeta =
      const VerificationMeta('inheritLimitFromPreviousMonth');
  @override
  late final GeneratedColumn<bool> inheritLimitFromPreviousMonth =
      GeneratedColumn<bool>(
        'inherit_limit_from_previous_month',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("inherit_limit_from_previous_month" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _carryOverUnusedLimitMeta =
      const VerificationMeta('carryOverUnusedLimit');
  @override
  late final GeneratedColumn<bool> carryOverUnusedLimit = GeneratedColumn<bool>(
    'carry_over_unused_limit',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("carry_over_unused_limit" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<LimitAlertMode, String>
  limitAlertMode = GeneratedColumn<String>(
    'limit_alert_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('globalPercent'),
  ).withConverter<LimitAlertMode>($AppSettingsTable.$converterlimitAlertMode);
  static const VerificationMeta _globalAlertPercentMeta =
      const VerificationMeta('globalAlertPercent');
  @override
  late final GeneratedColumn<int> globalAlertPercent = GeneratedColumn<int>(
    'global_alert_percent',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(80),
  );
  static const VerificationMeta _globalAlertAmountMeta = const VerificationMeta(
    'globalAlertAmount',
  );
  @override
  late final GeneratedColumn<double> globalAlertAmount =
      GeneratedColumn<double>(
        'global_alert_amount',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _largeTransactionThresholdMeta =
      const VerificationMeta('largeTransactionThreshold');
  @override
  late final GeneratedColumn<double> largeTransactionThreshold =
      GeneratedColumn<double>(
        'large_transaction_threshold',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(10000.0),
      );
  static const VerificationMeta _secrecyTimeoutSecondsMeta =
      const VerificationMeta('secrecyTimeoutSeconds');
  @override
  late final GeneratedColumn<int> secrecyTimeoutSeconds = GeneratedColumn<int>(
    'secrecy_timeout_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(120),
  );
  static const VerificationMeta _secrecyDaysBeforeMeta = const VerificationMeta(
    'secrecyDaysBefore',
  );
  @override
  late final GeneratedColumn<int> secrecyDaysBefore = GeneratedColumn<int>(
    'secrecy_days_before',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(7),
  );
  static const VerificationMeta _enableReceiveOthersSyncErrorsMeta =
      const VerificationMeta('enableReceiveOthersSyncErrors');
  @override
  late final GeneratedColumn<bool> enableReceiveOthersSyncErrors =
      GeneratedColumn<bool>(
        'enable_receive_others_sync_errors',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("enable_receive_others_sync_errors" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _digestConfigMeta = const VerificationMeta(
    'digestConfig',
  );
  @override
  late final GeneratedColumn<String> digestConfig = GeneratedColumn<String>(
    'digest_config',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    baseCurrency,
    useHistoricalExchangeRate,
    refundsOffsetExpenses,
    inheritLimitFromPreviousMonth,
    carryOverUnusedLimit,
    limitAlertMode,
    globalAlertPercent,
    globalAlertAmount,
    largeTransactionThreshold,
    secrecyTimeoutSeconds,
    secrecyDaysBefore,
    enableReceiveOthersSyncErrors,
    digestConfig,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('base_currency')) {
      context.handle(
        _baseCurrencyMeta,
        baseCurrency.isAcceptableOrUnknown(
          data['base_currency']!,
          _baseCurrencyMeta,
        ),
      );
    }
    if (data.containsKey('use_historical_exchange_rate')) {
      context.handle(
        _useHistoricalExchangeRateMeta,
        useHistoricalExchangeRate.isAcceptableOrUnknown(
          data['use_historical_exchange_rate']!,
          _useHistoricalExchangeRateMeta,
        ),
      );
    }
    if (data.containsKey('refunds_offset_expenses')) {
      context.handle(
        _refundsOffsetExpensesMeta,
        refundsOffsetExpenses.isAcceptableOrUnknown(
          data['refunds_offset_expenses']!,
          _refundsOffsetExpensesMeta,
        ),
      );
    }
    if (data.containsKey('inherit_limit_from_previous_month')) {
      context.handle(
        _inheritLimitFromPreviousMonthMeta,
        inheritLimitFromPreviousMonth.isAcceptableOrUnknown(
          data['inherit_limit_from_previous_month']!,
          _inheritLimitFromPreviousMonthMeta,
        ),
      );
    }
    if (data.containsKey('carry_over_unused_limit')) {
      context.handle(
        _carryOverUnusedLimitMeta,
        carryOverUnusedLimit.isAcceptableOrUnknown(
          data['carry_over_unused_limit']!,
          _carryOverUnusedLimitMeta,
        ),
      );
    }
    if (data.containsKey('global_alert_percent')) {
      context.handle(
        _globalAlertPercentMeta,
        globalAlertPercent.isAcceptableOrUnknown(
          data['global_alert_percent']!,
          _globalAlertPercentMeta,
        ),
      );
    }
    if (data.containsKey('global_alert_amount')) {
      context.handle(
        _globalAlertAmountMeta,
        globalAlertAmount.isAcceptableOrUnknown(
          data['global_alert_amount']!,
          _globalAlertAmountMeta,
        ),
      );
    }
    if (data.containsKey('large_transaction_threshold')) {
      context.handle(
        _largeTransactionThresholdMeta,
        largeTransactionThreshold.isAcceptableOrUnknown(
          data['large_transaction_threshold']!,
          _largeTransactionThresholdMeta,
        ),
      );
    }
    if (data.containsKey('secrecy_timeout_seconds')) {
      context.handle(
        _secrecyTimeoutSecondsMeta,
        secrecyTimeoutSeconds.isAcceptableOrUnknown(
          data['secrecy_timeout_seconds']!,
          _secrecyTimeoutSecondsMeta,
        ),
      );
    }
    if (data.containsKey('secrecy_days_before')) {
      context.handle(
        _secrecyDaysBeforeMeta,
        secrecyDaysBefore.isAcceptableOrUnknown(
          data['secrecy_days_before']!,
          _secrecyDaysBeforeMeta,
        ),
      );
    }
    if (data.containsKey('enable_receive_others_sync_errors')) {
      context.handle(
        _enableReceiveOthersSyncErrorsMeta,
        enableReceiveOthersSyncErrors.isAcceptableOrUnknown(
          data['enable_receive_others_sync_errors']!,
          _enableReceiveOthersSyncErrorsMeta,
        ),
      );
    }
    if (data.containsKey('digest_config')) {
      context.handle(
        _digestConfigMeta,
        digestConfig.isAcceptableOrUnknown(
          data['digest_config']!,
          _digestConfigMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      baseCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_currency'],
      )!,
      useHistoricalExchangeRate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}use_historical_exchange_rate'],
      )!,
      refundsOffsetExpenses: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}refunds_offset_expenses'],
      )!,
      inheritLimitFromPreviousMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}inherit_limit_from_previous_month'],
      )!,
      carryOverUnusedLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}carry_over_unused_limit'],
      )!,
      limitAlertMode: $AppSettingsTable.$converterlimitAlertMode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}limit_alert_mode'],
        )!,
      ),
      globalAlertPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}global_alert_percent'],
      )!,
      globalAlertAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}global_alert_amount'],
      ),
      largeTransactionThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}large_transaction_threshold'],
      )!,
      secrecyTimeoutSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}secrecy_timeout_seconds'],
      )!,
      secrecyDaysBefore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}secrecy_days_before'],
      )!,
      enableReceiveOthersSyncErrors: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enable_receive_others_sync_errors'],
      )!,
      digestConfig: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}digest_config'],
      ),
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LimitAlertMode, String, String>
  $converterlimitAlertMode = const EnumNameConverter<LimitAlertMode>(
    LimitAlertMode.values,
  );
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String userId;
  final String baseCurrency;
  final bool useHistoricalExchangeRate;
  final bool refundsOffsetExpenses;
  final bool inheritLimitFromPreviousMonth;
  final bool carryOverUnusedLimit;
  final LimitAlertMode limitAlertMode;
  final int globalAlertPercent;
  final double? globalAlertAmount;
  final double largeTransactionThreshold;
  final int secrecyTimeoutSeconds;
  final int secrecyDaysBefore;
  final bool enableReceiveOthersSyncErrors;
  final String? digestConfig;
  const AppSetting({
    required this.userId,
    required this.baseCurrency,
    required this.useHistoricalExchangeRate,
    required this.refundsOffsetExpenses,
    required this.inheritLimitFromPreviousMonth,
    required this.carryOverUnusedLimit,
    required this.limitAlertMode,
    required this.globalAlertPercent,
    this.globalAlertAmount,
    required this.largeTransactionThreshold,
    required this.secrecyTimeoutSeconds,
    required this.secrecyDaysBefore,
    required this.enableReceiveOthersSyncErrors,
    this.digestConfig,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['base_currency'] = Variable<String>(baseCurrency);
    map['use_historical_exchange_rate'] = Variable<bool>(
      useHistoricalExchangeRate,
    );
    map['refunds_offset_expenses'] = Variable<bool>(refundsOffsetExpenses);
    map['inherit_limit_from_previous_month'] = Variable<bool>(
      inheritLimitFromPreviousMonth,
    );
    map['carry_over_unused_limit'] = Variable<bool>(carryOverUnusedLimit);
    {
      map['limit_alert_mode'] = Variable<String>(
        $AppSettingsTable.$converterlimitAlertMode.toSql(limitAlertMode),
      );
    }
    map['global_alert_percent'] = Variable<int>(globalAlertPercent);
    if (!nullToAbsent || globalAlertAmount != null) {
      map['global_alert_amount'] = Variable<double>(globalAlertAmount);
    }
    map['large_transaction_threshold'] = Variable<double>(
      largeTransactionThreshold,
    );
    map['secrecy_timeout_seconds'] = Variable<int>(secrecyTimeoutSeconds);
    map['secrecy_days_before'] = Variable<int>(secrecyDaysBefore);
    map['enable_receive_others_sync_errors'] = Variable<bool>(
      enableReceiveOthersSyncErrors,
    );
    if (!nullToAbsent || digestConfig != null) {
      map['digest_config'] = Variable<String>(digestConfig);
    }
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      userId: Value(userId),
      baseCurrency: Value(baseCurrency),
      useHistoricalExchangeRate: Value(useHistoricalExchangeRate),
      refundsOffsetExpenses: Value(refundsOffsetExpenses),
      inheritLimitFromPreviousMonth: Value(inheritLimitFromPreviousMonth),
      carryOverUnusedLimit: Value(carryOverUnusedLimit),
      limitAlertMode: Value(limitAlertMode),
      globalAlertPercent: Value(globalAlertPercent),
      globalAlertAmount: globalAlertAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(globalAlertAmount),
      largeTransactionThreshold: Value(largeTransactionThreshold),
      secrecyTimeoutSeconds: Value(secrecyTimeoutSeconds),
      secrecyDaysBefore: Value(secrecyDaysBefore),
      enableReceiveOthersSyncErrors: Value(enableReceiveOthersSyncErrors),
      digestConfig: digestConfig == null && nullToAbsent
          ? const Value.absent()
          : Value(digestConfig),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      userId: serializer.fromJson<String>(json['userId']),
      baseCurrency: serializer.fromJson<String>(json['baseCurrency']),
      useHistoricalExchangeRate: serializer.fromJson<bool>(
        json['useHistoricalExchangeRate'],
      ),
      refundsOffsetExpenses: serializer.fromJson<bool>(
        json['refundsOffsetExpenses'],
      ),
      inheritLimitFromPreviousMonth: serializer.fromJson<bool>(
        json['inheritLimitFromPreviousMonth'],
      ),
      carryOverUnusedLimit: serializer.fromJson<bool>(
        json['carryOverUnusedLimit'],
      ),
      limitAlertMode: $AppSettingsTable.$converterlimitAlertMode.fromJson(
        serializer.fromJson<String>(json['limitAlertMode']),
      ),
      globalAlertPercent: serializer.fromJson<int>(json['globalAlertPercent']),
      globalAlertAmount: serializer.fromJson<double?>(
        json['globalAlertAmount'],
      ),
      largeTransactionThreshold: serializer.fromJson<double>(
        json['largeTransactionThreshold'],
      ),
      secrecyTimeoutSeconds: serializer.fromJson<int>(
        json['secrecyTimeoutSeconds'],
      ),
      secrecyDaysBefore: serializer.fromJson<int>(json['secrecyDaysBefore']),
      enableReceiveOthersSyncErrors: serializer.fromJson<bool>(
        json['enableReceiveOthersSyncErrors'],
      ),
      digestConfig: serializer.fromJson<String?>(json['digestConfig']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'baseCurrency': serializer.toJson<String>(baseCurrency),
      'useHistoricalExchangeRate': serializer.toJson<bool>(
        useHistoricalExchangeRate,
      ),
      'refundsOffsetExpenses': serializer.toJson<bool>(refundsOffsetExpenses),
      'inheritLimitFromPreviousMonth': serializer.toJson<bool>(
        inheritLimitFromPreviousMonth,
      ),
      'carryOverUnusedLimit': serializer.toJson<bool>(carryOverUnusedLimit),
      'limitAlertMode': serializer.toJson<String>(
        $AppSettingsTable.$converterlimitAlertMode.toJson(limitAlertMode),
      ),
      'globalAlertPercent': serializer.toJson<int>(globalAlertPercent),
      'globalAlertAmount': serializer.toJson<double?>(globalAlertAmount),
      'largeTransactionThreshold': serializer.toJson<double>(
        largeTransactionThreshold,
      ),
      'secrecyTimeoutSeconds': serializer.toJson<int>(secrecyTimeoutSeconds),
      'secrecyDaysBefore': serializer.toJson<int>(secrecyDaysBefore),
      'enableReceiveOthersSyncErrors': serializer.toJson<bool>(
        enableReceiveOthersSyncErrors,
      ),
      'digestConfig': serializer.toJson<String?>(digestConfig),
    };
  }

  AppSetting copyWith({
    String? userId,
    String? baseCurrency,
    bool? useHistoricalExchangeRate,
    bool? refundsOffsetExpenses,
    bool? inheritLimitFromPreviousMonth,
    bool? carryOverUnusedLimit,
    LimitAlertMode? limitAlertMode,
    int? globalAlertPercent,
    Value<double?> globalAlertAmount = const Value.absent(),
    double? largeTransactionThreshold,
    int? secrecyTimeoutSeconds,
    int? secrecyDaysBefore,
    bool? enableReceiveOthersSyncErrors,
    Value<String?> digestConfig = const Value.absent(),
  }) => AppSetting(
    userId: userId ?? this.userId,
    baseCurrency: baseCurrency ?? this.baseCurrency,
    useHistoricalExchangeRate:
        useHistoricalExchangeRate ?? this.useHistoricalExchangeRate,
    refundsOffsetExpenses: refundsOffsetExpenses ?? this.refundsOffsetExpenses,
    inheritLimitFromPreviousMonth:
        inheritLimitFromPreviousMonth ?? this.inheritLimitFromPreviousMonth,
    carryOverUnusedLimit: carryOverUnusedLimit ?? this.carryOverUnusedLimit,
    limitAlertMode: limitAlertMode ?? this.limitAlertMode,
    globalAlertPercent: globalAlertPercent ?? this.globalAlertPercent,
    globalAlertAmount: globalAlertAmount.present
        ? globalAlertAmount.value
        : this.globalAlertAmount,
    largeTransactionThreshold:
        largeTransactionThreshold ?? this.largeTransactionThreshold,
    secrecyTimeoutSeconds: secrecyTimeoutSeconds ?? this.secrecyTimeoutSeconds,
    secrecyDaysBefore: secrecyDaysBefore ?? this.secrecyDaysBefore,
    enableReceiveOthersSyncErrors:
        enableReceiveOthersSyncErrors ?? this.enableReceiveOthersSyncErrors,
    digestConfig: digestConfig.present ? digestConfig.value : this.digestConfig,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      userId: data.userId.present ? data.userId.value : this.userId,
      baseCurrency: data.baseCurrency.present
          ? data.baseCurrency.value
          : this.baseCurrency,
      useHistoricalExchangeRate: data.useHistoricalExchangeRate.present
          ? data.useHistoricalExchangeRate.value
          : this.useHistoricalExchangeRate,
      refundsOffsetExpenses: data.refundsOffsetExpenses.present
          ? data.refundsOffsetExpenses.value
          : this.refundsOffsetExpenses,
      inheritLimitFromPreviousMonth: data.inheritLimitFromPreviousMonth.present
          ? data.inheritLimitFromPreviousMonth.value
          : this.inheritLimitFromPreviousMonth,
      carryOverUnusedLimit: data.carryOverUnusedLimit.present
          ? data.carryOverUnusedLimit.value
          : this.carryOverUnusedLimit,
      limitAlertMode: data.limitAlertMode.present
          ? data.limitAlertMode.value
          : this.limitAlertMode,
      globalAlertPercent: data.globalAlertPercent.present
          ? data.globalAlertPercent.value
          : this.globalAlertPercent,
      globalAlertAmount: data.globalAlertAmount.present
          ? data.globalAlertAmount.value
          : this.globalAlertAmount,
      largeTransactionThreshold: data.largeTransactionThreshold.present
          ? data.largeTransactionThreshold.value
          : this.largeTransactionThreshold,
      secrecyTimeoutSeconds: data.secrecyTimeoutSeconds.present
          ? data.secrecyTimeoutSeconds.value
          : this.secrecyTimeoutSeconds,
      secrecyDaysBefore: data.secrecyDaysBefore.present
          ? data.secrecyDaysBefore.value
          : this.secrecyDaysBefore,
      enableReceiveOthersSyncErrors: data.enableReceiveOthersSyncErrors.present
          ? data.enableReceiveOthersSyncErrors.value
          : this.enableReceiveOthersSyncErrors,
      digestConfig: data.digestConfig.present
          ? data.digestConfig.value
          : this.digestConfig,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('userId: $userId, ')
          ..write('baseCurrency: $baseCurrency, ')
          ..write('useHistoricalExchangeRate: $useHistoricalExchangeRate, ')
          ..write('refundsOffsetExpenses: $refundsOffsetExpenses, ')
          ..write(
            'inheritLimitFromPreviousMonth: $inheritLimitFromPreviousMonth, ',
          )
          ..write('carryOverUnusedLimit: $carryOverUnusedLimit, ')
          ..write('limitAlertMode: $limitAlertMode, ')
          ..write('globalAlertPercent: $globalAlertPercent, ')
          ..write('globalAlertAmount: $globalAlertAmount, ')
          ..write('largeTransactionThreshold: $largeTransactionThreshold, ')
          ..write('secrecyTimeoutSeconds: $secrecyTimeoutSeconds, ')
          ..write('secrecyDaysBefore: $secrecyDaysBefore, ')
          ..write(
            'enableReceiveOthersSyncErrors: $enableReceiveOthersSyncErrors, ',
          )
          ..write('digestConfig: $digestConfig')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userId,
    baseCurrency,
    useHistoricalExchangeRate,
    refundsOffsetExpenses,
    inheritLimitFromPreviousMonth,
    carryOverUnusedLimit,
    limitAlertMode,
    globalAlertPercent,
    globalAlertAmount,
    largeTransactionThreshold,
    secrecyTimeoutSeconds,
    secrecyDaysBefore,
    enableReceiveOthersSyncErrors,
    digestConfig,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.userId == this.userId &&
          other.baseCurrency == this.baseCurrency &&
          other.useHistoricalExchangeRate == this.useHistoricalExchangeRate &&
          other.refundsOffsetExpenses == this.refundsOffsetExpenses &&
          other.inheritLimitFromPreviousMonth ==
              this.inheritLimitFromPreviousMonth &&
          other.carryOverUnusedLimit == this.carryOverUnusedLimit &&
          other.limitAlertMode == this.limitAlertMode &&
          other.globalAlertPercent == this.globalAlertPercent &&
          other.globalAlertAmount == this.globalAlertAmount &&
          other.largeTransactionThreshold == this.largeTransactionThreshold &&
          other.secrecyTimeoutSeconds == this.secrecyTimeoutSeconds &&
          other.secrecyDaysBefore == this.secrecyDaysBefore &&
          other.enableReceiveOthersSyncErrors ==
              this.enableReceiveOthersSyncErrors &&
          other.digestConfig == this.digestConfig);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> userId;
  final Value<String> baseCurrency;
  final Value<bool> useHistoricalExchangeRate;
  final Value<bool> refundsOffsetExpenses;
  final Value<bool> inheritLimitFromPreviousMonth;
  final Value<bool> carryOverUnusedLimit;
  final Value<LimitAlertMode> limitAlertMode;
  final Value<int> globalAlertPercent;
  final Value<double?> globalAlertAmount;
  final Value<double> largeTransactionThreshold;
  final Value<int> secrecyTimeoutSeconds;
  final Value<int> secrecyDaysBefore;
  final Value<bool> enableReceiveOthersSyncErrors;
  final Value<String?> digestConfig;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.userId = const Value.absent(),
    this.baseCurrency = const Value.absent(),
    this.useHistoricalExchangeRate = const Value.absent(),
    this.refundsOffsetExpenses = const Value.absent(),
    this.inheritLimitFromPreviousMonth = const Value.absent(),
    this.carryOverUnusedLimit = const Value.absent(),
    this.limitAlertMode = const Value.absent(),
    this.globalAlertPercent = const Value.absent(),
    this.globalAlertAmount = const Value.absent(),
    this.largeTransactionThreshold = const Value.absent(),
    this.secrecyTimeoutSeconds = const Value.absent(),
    this.secrecyDaysBefore = const Value.absent(),
    this.enableReceiveOthersSyncErrors = const Value.absent(),
    this.digestConfig = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String userId,
    this.baseCurrency = const Value.absent(),
    this.useHistoricalExchangeRate = const Value.absent(),
    this.refundsOffsetExpenses = const Value.absent(),
    this.inheritLimitFromPreviousMonth = const Value.absent(),
    this.carryOverUnusedLimit = const Value.absent(),
    this.limitAlertMode = const Value.absent(),
    this.globalAlertPercent = const Value.absent(),
    this.globalAlertAmount = const Value.absent(),
    this.largeTransactionThreshold = const Value.absent(),
    this.secrecyTimeoutSeconds = const Value.absent(),
    this.secrecyDaysBefore = const Value.absent(),
    this.enableReceiveOthersSyncErrors = const Value.absent(),
    this.digestConfig = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<AppSetting> custom({
    Expression<String>? userId,
    Expression<String>? baseCurrency,
    Expression<bool>? useHistoricalExchangeRate,
    Expression<bool>? refundsOffsetExpenses,
    Expression<bool>? inheritLimitFromPreviousMonth,
    Expression<bool>? carryOverUnusedLimit,
    Expression<String>? limitAlertMode,
    Expression<int>? globalAlertPercent,
    Expression<double>? globalAlertAmount,
    Expression<double>? largeTransactionThreshold,
    Expression<int>? secrecyTimeoutSeconds,
    Expression<int>? secrecyDaysBefore,
    Expression<bool>? enableReceiveOthersSyncErrors,
    Expression<String>? digestConfig,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (baseCurrency != null) 'base_currency': baseCurrency,
      if (useHistoricalExchangeRate != null)
        'use_historical_exchange_rate': useHistoricalExchangeRate,
      if (refundsOffsetExpenses != null)
        'refunds_offset_expenses': refundsOffsetExpenses,
      if (inheritLimitFromPreviousMonth != null)
        'inherit_limit_from_previous_month': inheritLimitFromPreviousMonth,
      if (carryOverUnusedLimit != null)
        'carry_over_unused_limit': carryOverUnusedLimit,
      if (limitAlertMode != null) 'limit_alert_mode': limitAlertMode,
      if (globalAlertPercent != null)
        'global_alert_percent': globalAlertPercent,
      if (globalAlertAmount != null) 'global_alert_amount': globalAlertAmount,
      if (largeTransactionThreshold != null)
        'large_transaction_threshold': largeTransactionThreshold,
      if (secrecyTimeoutSeconds != null)
        'secrecy_timeout_seconds': secrecyTimeoutSeconds,
      if (secrecyDaysBefore != null) 'secrecy_days_before': secrecyDaysBefore,
      if (enableReceiveOthersSyncErrors != null)
        'enable_receive_others_sync_errors': enableReceiveOthersSyncErrors,
      if (digestConfig != null) 'digest_config': digestConfig,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? userId,
    Value<String>? baseCurrency,
    Value<bool>? useHistoricalExchangeRate,
    Value<bool>? refundsOffsetExpenses,
    Value<bool>? inheritLimitFromPreviousMonth,
    Value<bool>? carryOverUnusedLimit,
    Value<LimitAlertMode>? limitAlertMode,
    Value<int>? globalAlertPercent,
    Value<double?>? globalAlertAmount,
    Value<double>? largeTransactionThreshold,
    Value<int>? secrecyTimeoutSeconds,
    Value<int>? secrecyDaysBefore,
    Value<bool>? enableReceiveOthersSyncErrors,
    Value<String?>? digestConfig,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      userId: userId ?? this.userId,
      baseCurrency: baseCurrency ?? this.baseCurrency,
      useHistoricalExchangeRate:
          useHistoricalExchangeRate ?? this.useHistoricalExchangeRate,
      refundsOffsetExpenses:
          refundsOffsetExpenses ?? this.refundsOffsetExpenses,
      inheritLimitFromPreviousMonth:
          inheritLimitFromPreviousMonth ?? this.inheritLimitFromPreviousMonth,
      carryOverUnusedLimit: carryOverUnusedLimit ?? this.carryOverUnusedLimit,
      limitAlertMode: limitAlertMode ?? this.limitAlertMode,
      globalAlertPercent: globalAlertPercent ?? this.globalAlertPercent,
      globalAlertAmount: globalAlertAmount ?? this.globalAlertAmount,
      largeTransactionThreshold:
          largeTransactionThreshold ?? this.largeTransactionThreshold,
      secrecyTimeoutSeconds:
          secrecyTimeoutSeconds ?? this.secrecyTimeoutSeconds,
      secrecyDaysBefore: secrecyDaysBefore ?? this.secrecyDaysBefore,
      enableReceiveOthersSyncErrors:
          enableReceiveOthersSyncErrors ?? this.enableReceiveOthersSyncErrors,
      digestConfig: digestConfig ?? this.digestConfig,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (baseCurrency.present) {
      map['base_currency'] = Variable<String>(baseCurrency.value);
    }
    if (useHistoricalExchangeRate.present) {
      map['use_historical_exchange_rate'] = Variable<bool>(
        useHistoricalExchangeRate.value,
      );
    }
    if (refundsOffsetExpenses.present) {
      map['refunds_offset_expenses'] = Variable<bool>(
        refundsOffsetExpenses.value,
      );
    }
    if (inheritLimitFromPreviousMonth.present) {
      map['inherit_limit_from_previous_month'] = Variable<bool>(
        inheritLimitFromPreviousMonth.value,
      );
    }
    if (carryOverUnusedLimit.present) {
      map['carry_over_unused_limit'] = Variable<bool>(
        carryOverUnusedLimit.value,
      );
    }
    if (limitAlertMode.present) {
      map['limit_alert_mode'] = Variable<String>(
        $AppSettingsTable.$converterlimitAlertMode.toSql(limitAlertMode.value),
      );
    }
    if (globalAlertPercent.present) {
      map['global_alert_percent'] = Variable<int>(globalAlertPercent.value);
    }
    if (globalAlertAmount.present) {
      map['global_alert_amount'] = Variable<double>(globalAlertAmount.value);
    }
    if (largeTransactionThreshold.present) {
      map['large_transaction_threshold'] = Variable<double>(
        largeTransactionThreshold.value,
      );
    }
    if (secrecyTimeoutSeconds.present) {
      map['secrecy_timeout_seconds'] = Variable<int>(
        secrecyTimeoutSeconds.value,
      );
    }
    if (secrecyDaysBefore.present) {
      map['secrecy_days_before'] = Variable<int>(secrecyDaysBefore.value);
    }
    if (enableReceiveOthersSyncErrors.present) {
      map['enable_receive_others_sync_errors'] = Variable<bool>(
        enableReceiveOthersSyncErrors.value,
      );
    }
    if (digestConfig.present) {
      map['digest_config'] = Variable<String>(digestConfig.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('userId: $userId, ')
          ..write('baseCurrency: $baseCurrency, ')
          ..write('useHistoricalExchangeRate: $useHistoricalExchangeRate, ')
          ..write('refundsOffsetExpenses: $refundsOffsetExpenses, ')
          ..write(
            'inheritLimitFromPreviousMonth: $inheritLimitFromPreviousMonth, ',
          )
          ..write('carryOverUnusedLimit: $carryOverUnusedLimit, ')
          ..write('limitAlertMode: $limitAlertMode, ')
          ..write('globalAlertPercent: $globalAlertPercent, ')
          ..write('globalAlertAmount: $globalAlertAmount, ')
          ..write('largeTransactionThreshold: $largeTransactionThreshold, ')
          ..write('secrecyTimeoutSeconds: $secrecyTimeoutSeconds, ')
          ..write('secrecyDaysBefore: $secrecyDaysBefore, ')
          ..write(
            'enableReceiveOthersSyncErrors: $enableReceiveOthersSyncErrors, ',
          )
          ..write('digestConfig: $digestConfig, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, Notification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _relatedTransactionIdMeta =
      const VerificationMeta('relatedTransactionId');
  @override
  late final GeneratedColumn<String> relatedTransactionId =
      GeneratedColumn<String>(
        'related_transaction_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _actionTakenMeta = const VerificationMeta(
    'actionTaken',
  );
  @override
  late final GeneratedColumn<String> actionTaken = GeneratedColumn<String>(
    'action_taken',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    type,
    title,
    body,
    isRead,
    relatedTransactionId,
    actionTaken,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Notification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    if (data.containsKey('related_transaction_id')) {
      context.handle(
        _relatedTransactionIdMeta,
        relatedTransactionId.isAcceptableOrUnknown(
          data['related_transaction_id']!,
          _relatedTransactionIdMeta,
        ),
      );
    }
    if (data.containsKey('action_taken')) {
      context.handle(
        _actionTakenMeta,
        actionTaken.isAcceptableOrUnknown(
          data['action_taken']!,
          _actionTakenMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Notification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Notification(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
      relatedTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_transaction_id'],
      ),
      actionTaken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_taken'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }
}

class Notification extends DataClass implements Insertable<Notification> {
  final String id;
  final String userId;
  final String type;
  final String title;
  final String body;
  final bool isRead;
  final String? relatedTransactionId;
  final String? actionTaken;
  final DateTime createdAt;
  const Notification({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    required this.isRead,
    this.relatedTransactionId,
    this.actionTaken,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['is_read'] = Variable<bool>(isRead);
    if (!nullToAbsent || relatedTransactionId != null) {
      map['related_transaction_id'] = Variable<String>(relatedTransactionId);
    }
    if (!nullToAbsent || actionTaken != null) {
      map['action_taken'] = Variable<String>(actionTaken);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      title: Value(title),
      body: Value(body),
      isRead: Value(isRead),
      relatedTransactionId: relatedTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedTransactionId),
      actionTaken: actionTaken == null && nullToAbsent
          ? const Value.absent()
          : Value(actionTaken),
      createdAt: Value(createdAt),
    );
  }

  factory Notification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Notification(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      relatedTransactionId: serializer.fromJson<String?>(
        json['relatedTransactionId'],
      ),
      actionTaken: serializer.fromJson<String?>(json['actionTaken']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'isRead': serializer.toJson<bool>(isRead),
      'relatedTransactionId': serializer.toJson<String?>(relatedTransactionId),
      'actionTaken': serializer.toJson<String?>(actionTaken),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Notification copyWith({
    String? id,
    String? userId,
    String? type,
    String? title,
    String? body,
    bool? isRead,
    Value<String?> relatedTransactionId = const Value.absent(),
    Value<String?> actionTaken = const Value.absent(),
    DateTime? createdAt,
  }) => Notification(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    type: type ?? this.type,
    title: title ?? this.title,
    body: body ?? this.body,
    isRead: isRead ?? this.isRead,
    relatedTransactionId: relatedTransactionId.present
        ? relatedTransactionId.value
        : this.relatedTransactionId,
    actionTaken: actionTaken.present ? actionTaken.value : this.actionTaken,
    createdAt: createdAt ?? this.createdAt,
  );
  Notification copyWithCompanion(NotificationsCompanion data) {
    return Notification(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      relatedTransactionId: data.relatedTransactionId.present
          ? data.relatedTransactionId.value
          : this.relatedTransactionId,
      actionTaken: data.actionTaken.present
          ? data.actionTaken.value
          : this.actionTaken,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Notification(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('isRead: $isRead, ')
          ..write('relatedTransactionId: $relatedTransactionId, ')
          ..write('actionTaken: $actionTaken, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    type,
    title,
    body,
    isRead,
    relatedTransactionId,
    actionTaken,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notification &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.title == this.title &&
          other.body == this.body &&
          other.isRead == this.isRead &&
          other.relatedTransactionId == this.relatedTransactionId &&
          other.actionTaken == this.actionTaken &&
          other.createdAt == this.createdAt);
}

class NotificationsCompanion extends UpdateCompanion<Notification> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> type;
  final Value<String> title;
  final Value<String> body;
  final Value<bool> isRead;
  final Value<String?> relatedTransactionId;
  final Value<String?> actionTaken;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.isRead = const Value.absent(),
    this.relatedTransactionId = const Value.absent(),
    this.actionTaken = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationsCompanion.insert({
    required String id,
    required String userId,
    required String type,
    required String title,
    required String body,
    this.isRead = const Value.absent(),
    this.relatedTransactionId = const Value.absent(),
    this.actionTaken = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       type = Value(type),
       title = Value(title),
       body = Value(body);
  static Insertable<Notification> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? body,
    Expression<bool>? isRead,
    Expression<String>? relatedTransactionId,
    Expression<String>? actionTaken,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (isRead != null) 'is_read': isRead,
      if (relatedTransactionId != null)
        'related_transaction_id': relatedTransactionId,
      if (actionTaken != null) 'action_taken': actionTaken,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? type,
    Value<String>? title,
    Value<String>? body,
    Value<bool>? isRead,
    Value<String?>? relatedTransactionId,
    Value<String?>? actionTaken,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return NotificationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
      relatedTransactionId: relatedTransactionId ?? this.relatedTransactionId,
      actionTaken: actionTaken ?? this.actionTaken,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (relatedTransactionId.present) {
      map['related_transaction_id'] = Variable<String>(
        relatedTransactionId.value,
      );
    }
    if (actionTaken.present) {
      map['action_taken'] = Variable<String>(actionTaken.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('isRead: $isRead, ')
          ..write('relatedTransactionId: $relatedTransactionId, ')
          ..write('actionTaken: $actionTaken, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashbackRemindersTable extends CashbackReminders
    with TableInfo<$CashbackRemindersTable, CashbackReminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashbackRemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repeatTypeMeta = const VerificationMeta(
    'repeatType',
  );
  @override
  late final GeneratedColumn<String> repeatType = GeneratedColumn<String>(
    'repeat_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    scheduledAt,
    repeatType,
    isEnabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cashback_reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<CashbackReminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('repeat_type')) {
      context.handle(
        _repeatTypeMeta,
        repeatType.isAcceptableOrUnknown(data['repeat_type']!, _repeatTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_repeatTypeMeta);
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashbackReminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashbackReminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      repeatType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}repeat_type'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
    );
  }

  @override
  $CashbackRemindersTable createAlias(String alias) {
    return $CashbackRemindersTable(attachedDatabase, alias);
  }
}

class CashbackReminder extends DataClass
    implements Insertable<CashbackReminder> {
  final String id;
  final String userId;
  final DateTime scheduledAt;
  final String repeatType;
  final bool isEnabled;
  const CashbackReminder({
    required this.id,
    required this.userId,
    required this.scheduledAt,
    required this.repeatType,
    required this.isEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['repeat_type'] = Variable<String>(repeatType);
    map['is_enabled'] = Variable<bool>(isEnabled);
    return map;
  }

  CashbackRemindersCompanion toCompanion(bool nullToAbsent) {
    return CashbackRemindersCompanion(
      id: Value(id),
      userId: Value(userId),
      scheduledAt: Value(scheduledAt),
      repeatType: Value(repeatType),
      isEnabled: Value(isEnabled),
    );
  }

  factory CashbackReminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashbackReminder(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      repeatType: serializer.fromJson<String>(json['repeatType']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'repeatType': serializer.toJson<String>(repeatType),
      'isEnabled': serializer.toJson<bool>(isEnabled),
    };
  }

  CashbackReminder copyWith({
    String? id,
    String? userId,
    DateTime? scheduledAt,
    String? repeatType,
    bool? isEnabled,
  }) => CashbackReminder(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    repeatType: repeatType ?? this.repeatType,
    isEnabled: isEnabled ?? this.isEnabled,
  );
  CashbackReminder copyWithCompanion(CashbackRemindersCompanion data) {
    return CashbackReminder(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      repeatType: data.repeatType.present
          ? data.repeatType.value
          : this.repeatType,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashbackReminder(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('repeatType: $repeatType, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, scheduledAt, repeatType, isEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashbackReminder &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.scheduledAt == this.scheduledAt &&
          other.repeatType == this.repeatType &&
          other.isEnabled == this.isEnabled);
}

class CashbackRemindersCompanion extends UpdateCompanion<CashbackReminder> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> scheduledAt;
  final Value<String> repeatType;
  final Value<bool> isEnabled;
  final Value<int> rowid;
  const CashbackRemindersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashbackRemindersCompanion.insert({
    required String id,
    required String userId,
    required DateTime scheduledAt,
    required String repeatType,
    this.isEnabled = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       scheduledAt = Value(scheduledAt),
       repeatType = Value(repeatType);
  static Insertable<CashbackReminder> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? scheduledAt,
    Expression<String>? repeatType,
    Expression<bool>? isEnabled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (repeatType != null) 'repeat_type': repeatType,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashbackRemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? scheduledAt,
    Value<String>? repeatType,
    Value<bool>? isEnabled,
    Value<int>? rowid,
  }) {
    return CashbackRemindersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      repeatType: repeatType ?? this.repeatType,
      isEnabled: isEnabled ?? this.isEnabled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (repeatType.present) {
      map['repeat_type'] = Variable<String>(repeatType.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashbackRemindersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('repeatType: $repeatType, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncConflictsTable extends SyncConflicts
    with TableInfo<$SyncConflictsTable, SyncConflict> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncConflictsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localValueMeta = const VerificationMeta(
    'localValue',
  );
  @override
  late final GeneratedColumn<String> localValue = GeneratedColumn<String>(
    'local_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteValueMeta = const VerificationMeta(
    'remoteValue',
  );
  @override
  late final GeneratedColumn<String> remoteValue = GeneratedColumn<String>(
    'remote_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    localValue,
    remoteValue,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_conflicts';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncConflict> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('local_value')) {
      context.handle(
        _localValueMeta,
        localValue.isAcceptableOrUnknown(data['local_value']!, _localValueMeta),
      );
    } else if (isInserting) {
      context.missing(_localValueMeta);
    }
    if (data.containsKey('remote_value')) {
      context.handle(
        _remoteValueMeta,
        remoteValue.isAcceptableOrUnknown(
          data['remote_value']!,
          _remoteValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remoteValueMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncConflict map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncConflict(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      localValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_value'],
      )!,
      remoteValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_value'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SyncConflictsTable createAlias(String alias) {
    return $SyncConflictsTable(attachedDatabase, alias);
  }
}

class SyncConflict extends DataClass implements Insertable<SyncConflict> {
  final String id;
  final String entityType;
  final String entityId;
  final String localValue;
  final String remoteValue;
  final DateTime createdAt;
  const SyncConflict({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.localValue,
    required this.remoteValue,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['local_value'] = Variable<String>(localValue);
    map['remote_value'] = Variable<String>(remoteValue);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SyncConflictsCompanion toCompanion(bool nullToAbsent) {
    return SyncConflictsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      localValue: Value(localValue),
      remoteValue: Value(remoteValue),
      createdAt: Value(createdAt),
    );
  }

  factory SyncConflict.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncConflict(
      id: serializer.fromJson<String>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      localValue: serializer.fromJson<String>(json['localValue']),
      remoteValue: serializer.fromJson<String>(json['remoteValue']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'localValue': serializer.toJson<String>(localValue),
      'remoteValue': serializer.toJson<String>(remoteValue),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SyncConflict copyWith({
    String? id,
    String? entityType,
    String? entityId,
    String? localValue,
    String? remoteValue,
    DateTime? createdAt,
  }) => SyncConflict(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    localValue: localValue ?? this.localValue,
    remoteValue: remoteValue ?? this.remoteValue,
    createdAt: createdAt ?? this.createdAt,
  );
  SyncConflict copyWithCompanion(SyncConflictsCompanion data) {
    return SyncConflict(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      localValue: data.localValue.present
          ? data.localValue.value
          : this.localValue,
      remoteValue: data.remoteValue.present
          ? data.remoteValue.value
          : this.remoteValue,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncConflict(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('localValue: $localValue, ')
          ..write('remoteValue: $remoteValue, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, entityType, entityId, localValue, remoteValue, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncConflict &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.localValue == this.localValue &&
          other.remoteValue == this.remoteValue &&
          other.createdAt == this.createdAt);
}

class SyncConflictsCompanion extends UpdateCompanion<SyncConflict> {
  final Value<String> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> localValue;
  final Value<String> remoteValue;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SyncConflictsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.localValue = const Value.absent(),
    this.remoteValue = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncConflictsCompanion.insert({
    required String id,
    required String entityType,
    required String entityId,
    required String localValue,
    required String remoteValue,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entityType = Value(entityType),
       entityId = Value(entityId),
       localValue = Value(localValue),
       remoteValue = Value(remoteValue);
  static Insertable<SyncConflict> custom({
    Expression<String>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? localValue,
    Expression<String>? remoteValue,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (localValue != null) 'local_value': localValue,
      if (remoteValue != null) 'remote_value': remoteValue,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncConflictsCompanion copyWith({
    Value<String>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? localValue,
    Value<String>? remoteValue,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return SyncConflictsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      localValue: localValue ?? this.localValue,
      remoteValue: remoteValue ?? this.remoteValue,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (localValue.present) {
      map['local_value'] = Variable<String>(localValue.value);
    }
    if (remoteValue.present) {
      map['remote_value'] = Variable<String>(remoteValue.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncConflictsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('localValue: $localValue, ')
          ..write('remoteValue: $remoteValue, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SpacesTable spaces = $SpacesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $CustomDashboardsTable customDashboards = $CustomDashboardsTable(
    this,
  );
  late final $DashboardTransactionsTable dashboardTransactions =
      $DashboardTransactionsTable(this);
  late final $DashboardRulesTable dashboardRules = $DashboardRulesTable(this);
  late final $CategoryRulesTable categoryRules = $CategoryRulesTable(this);
  late final $TrustedCounterpartiesTable trustedCounterparties =
      $TrustedCounterpartiesTable(this);
  late final $BudgetLimitsTable budgetLimits = $BudgetLimitsTable(this);
  late final $CashbackMatrixTable cashbackMatrix = $CashbackMatrixTable(this);
  late final $ExchangeRatesTable exchangeRates = $ExchangeRatesTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $CashbackRemindersTable cashbackReminders =
      $CashbackRemindersTable(this);
  late final $SyncConflictsTable syncConflicts = $SyncConflictsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    spaces,
    users,
    accounts,
    categories,
    transactions,
    customDashboards,
    dashboardTransactions,
    dashboardRules,
    categoryRules,
    trustedCounterparties,
    budgetLimits,
    cashbackMatrix,
    exchangeRates,
    appSettings,
    notifications,
    cashbackReminders,
    syncConflicts,
  ];
}

typedef $$SpacesTableCreateCompanionBuilder =
    SpacesCompanion Function({
      required String id,
      required String name,
      required String encryptionSalt,
      Value<bool> enableSecrecyMode,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$SpacesTableUpdateCompanionBuilder =
    SpacesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> encryptionSalt,
      Value<bool> enableSecrecyMode,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$SpacesTableReferences
    extends BaseReferences<_$AppDatabase, $SpacesTable, Space> {
  $$SpacesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsersTable, List<User>> _usersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.users,
    aliasName: 'spaces__id__users__space_id',
  );

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.spaceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CategoriesTable, List<Category>>
  _categoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.categories,
    aliasName: 'spaces__id__categories__space_id',
  );

  $$CategoriesTableProcessedTableManager get categoriesRefs {
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.spaceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_categoriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CategoryRulesTable, List<CategoryRule>>
  _categoryRulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.categoryRules,
    aliasName: 'spaces__id__category_rules__space_id',
  );

  $$CategoryRulesTableProcessedTableManager get categoryRulesRefs {
    final manager = $$CategoryRulesTableTableManager(
      $_db,
      $_db.categoryRules,
    ).filter((f) => f.spaceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_categoryRulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BudgetLimitsTable, List<BudgetLimit>>
  _budgetLimitsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.budgetLimits,
    aliasName: 'spaces__id__budget_limits__space_id',
  );

  $$BudgetLimitsTableProcessedTableManager get budgetLimitsRefs {
    final manager = $$BudgetLimitsTableTableManager(
      $_db,
      $_db.budgetLimits,
    ).filter((f) => f.spaceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_budgetLimitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SpacesTableFilterComposer
    extends Composer<_$AppDatabase, $SpacesTable> {
  $$SpacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get encryptionSalt => $composableBuilder(
    column: $table.encryptionSalt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enableSecrecyMode => $composableBuilder(
    column: $table.enableSecrecyMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> usersRefs(
    Expression<bool> Function($$UsersTableFilterComposer f) f,
  ) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.spaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> categoriesRefs(
    Expression<bool> Function($$CategoriesTableFilterComposer f) f,
  ) {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.spaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> categoryRulesRefs(
    Expression<bool> Function($$CategoryRulesTableFilterComposer f) f,
  ) {
    final $$CategoryRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categoryRules,
      getReferencedColumn: (t) => t.spaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryRulesTableFilterComposer(
            $db: $db,
            $table: $db.categoryRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> budgetLimitsRefs(
    Expression<bool> Function($$BudgetLimitsTableFilterComposer f) f,
  ) {
    final $$BudgetLimitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgetLimits,
      getReferencedColumn: (t) => t.spaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetLimitsTableFilterComposer(
            $db: $db,
            $table: $db.budgetLimits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpacesTableOrderingComposer
    extends Composer<_$AppDatabase, $SpacesTable> {
  $$SpacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get encryptionSalt => $composableBuilder(
    column: $table.encryptionSalt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enableSecrecyMode => $composableBuilder(
    column: $table.enableSecrecyMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SpacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpacesTable> {
  $$SpacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get encryptionSalt => $composableBuilder(
    column: $table.encryptionSalt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enableSecrecyMode => $composableBuilder(
    column: $table.enableSecrecyMode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> usersRefs<T extends Object>(
    Expression<T> Function($$UsersTableAnnotationComposer a) f,
  ) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.spaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> categoriesRefs<T extends Object>(
    Expression<T> Function($$CategoriesTableAnnotationComposer a) f,
  ) {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.spaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> categoryRulesRefs<T extends Object>(
    Expression<T> Function($$CategoryRulesTableAnnotationComposer a) f,
  ) {
    final $$CategoryRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categoryRules,
      getReferencedColumn: (t) => t.spaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.categoryRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> budgetLimitsRefs<T extends Object>(
    Expression<T> Function($$BudgetLimitsTableAnnotationComposer a) f,
  ) {
    final $$BudgetLimitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgetLimits,
      getReferencedColumn: (t) => t.spaceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetLimitsTableAnnotationComposer(
            $db: $db,
            $table: $db.budgetLimits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpacesTable,
          Space,
          $$SpacesTableFilterComposer,
          $$SpacesTableOrderingComposer,
          $$SpacesTableAnnotationComposer,
          $$SpacesTableCreateCompanionBuilder,
          $$SpacesTableUpdateCompanionBuilder,
          (Space, $$SpacesTableReferences),
          Space,
          PrefetchHooks Function({
            bool usersRefs,
            bool categoriesRefs,
            bool categoryRulesRefs,
            bool budgetLimitsRefs,
          })
        > {
  $$SpacesTableTableManager(_$AppDatabase db, $SpacesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> encryptionSalt = const Value.absent(),
                Value<bool> enableSecrecyMode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpacesCompanion(
                id: id,
                name: name,
                encryptionSalt: encryptionSalt,
                enableSecrecyMode: enableSecrecyMode,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String encryptionSalt,
                Value<bool> enableSecrecyMode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpacesCompanion.insert(
                id: id,
                name: name,
                encryptionSalt: encryptionSalt,
                enableSecrecyMode: enableSecrecyMode,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SpacesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                usersRefs = false,
                categoriesRefs = false,
                categoryRulesRefs = false,
                budgetLimitsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (usersRefs) db.users,
                    if (categoriesRefs) db.categories,
                    if (categoryRulesRefs) db.categoryRules,
                    if (budgetLimitsRefs) db.budgetLimits,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (usersRefs)
                        await $_getPrefetchedData<Space, $SpacesTable, User>(
                          currentTable: table,
                          referencedTable: $$SpacesTableReferences
                              ._usersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpacesTableReferences(db, table, p0).usersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.spaceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (categoriesRefs)
                        await $_getPrefetchedData<
                          Space,
                          $SpacesTable,
                          Category
                        >(
                          currentTable: table,
                          referencedTable: $$SpacesTableReferences
                              ._categoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpacesTableReferences(
                                db,
                                table,
                                p0,
                              ).categoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.spaceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (categoryRulesRefs)
                        await $_getPrefetchedData<
                          Space,
                          $SpacesTable,
                          CategoryRule
                        >(
                          currentTable: table,
                          referencedTable: $$SpacesTableReferences
                              ._categoryRulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpacesTableReferences(
                                db,
                                table,
                                p0,
                              ).categoryRulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.spaceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (budgetLimitsRefs)
                        await $_getPrefetchedData<
                          Space,
                          $SpacesTable,
                          BudgetLimit
                        >(
                          currentTable: table,
                          referencedTable: $$SpacesTableReferences
                              ._budgetLimitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpacesTableReferences(
                                db,
                                table,
                                p0,
                              ).budgetLimitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.spaceId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SpacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpacesTable,
      Space,
      $$SpacesTableFilterComposer,
      $$SpacesTableOrderingComposer,
      $$SpacesTableAnnotationComposer,
      $$SpacesTableCreateCompanionBuilder,
      $$SpacesTableUpdateCompanionBuilder,
      (Space, $$SpacesTableReferences),
      Space,
      PrefetchHooks Function({
        bool usersRefs,
        bool categoriesRefs,
        bool categoryRulesRefs,
        bool budgetLimitsRefs,
      })
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      Value<String?> spaceId,
      required UserRole role,
      required String displayName,
      Value<GroupStatus> groupStatus,
      Value<DateTime?> leftAt,
      Value<DateTime?> rejoinedAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String?> spaceId,
      Value<UserRole> role,
      Value<String> displayName,
      Value<GroupStatus> groupStatus,
      Value<DateTime?> leftAt,
      Value<DateTime?> rejoinedAt,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SpacesTable _spaceIdTable(_$AppDatabase db) =>
      db.spaces.createAlias('users__space_id__spaces__id');

  $$SpacesTableProcessedTableManager? get spaceId {
    final $_column = $_itemColumn<String>('space_id');
    if ($_column == null) return null;
    final manager = $$SpacesTableTableManager(
      $_db,
      $_db.spaces,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_spaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AccountsTable, List<Account>> _accountsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.accounts,
    aliasName: 'users__id__accounts__user_id',
  );

  $$AccountsTableProcessedTableManager get accountsRefs {
    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CustomDashboardsTable, List<CustomDashboard>>
  _customDashboardsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.customDashboards,
    aliasName: 'users__id__custom_dashboards__user_id',
  );

  $$CustomDashboardsTableProcessedTableManager get customDashboardsRefs {
    final manager = $$CustomDashboardsTableTableManager(
      $_db,
      $_db.customDashboards,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _customDashboardsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $TrustedCounterpartiesTable,
    List<TrustedCounterparty>
  >
  _trustedCounterpartiesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.trustedCounterparties,
        aliasName: 'users__id__trusted_counterparties__user_id',
      );

  $$TrustedCounterpartiesTableProcessedTableManager
  get trustedCounterpartiesRefs {
    final manager = $$TrustedCounterpartiesTableTableManager(
      $_db,
      $_db.trustedCounterparties,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _trustedCounterpartiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AppSettingsTable, List<AppSetting>>
  _appSettingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.appSettings,
    aliasName: 'users__id__app_settings__user_id',
  );

  $$AppSettingsTableProcessedTableManager get appSettingsRefs {
    final manager = $$AppSettingsTableTableManager(
      $_db,
      $_db.appSettings,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_appSettingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NotificationsTable, List<Notification>>
  _notificationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.notifications,
    aliasName: 'users__id__notifications__user_id',
  );

  $$NotificationsTableProcessedTableManager get notificationsRefs {
    final manager = $$NotificationsTableTableManager(
      $_db,
      $_db.notifications,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_notificationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CashbackRemindersTable, List<CashbackReminder>>
  _cashbackRemindersRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.cashbackReminders,
        aliasName: 'users__id__cashback_reminders__user_id',
      );

  $$CashbackRemindersTableProcessedTableManager get cashbackRemindersRefs {
    final manager = $$CashbackRemindersTableTableManager(
      $_db,
      $_db.cashbackReminders,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cashbackRemindersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UserRole, UserRole, String> get role =>
      $composableBuilder(
        column: $table.role,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<GroupStatus, GroupStatus, String>
  get groupStatus => $composableBuilder(
    column: $table.groupStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get leftAt => $composableBuilder(
    column: $table.leftAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get rejoinedAt => $composableBuilder(
    column: $table.rejoinedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SpacesTableFilterComposer get spaceId {
    final $$SpacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableFilterComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> accountsRefs(
    Expression<bool> Function($$AccountsTableFilterComposer f) f,
  ) {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> customDashboardsRefs(
    Expression<bool> Function($$CustomDashboardsTableFilterComposer f) f,
  ) {
    final $$CustomDashboardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customDashboards,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomDashboardsTableFilterComposer(
            $db: $db,
            $table: $db.customDashboards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> trustedCounterpartiesRefs(
    Expression<bool> Function($$TrustedCounterpartiesTableFilterComposer f) f,
  ) {
    final $$TrustedCounterpartiesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.trustedCounterparties,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TrustedCounterpartiesTableFilterComposer(
                $db: $db,
                $table: $db.trustedCounterparties,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> appSettingsRefs(
    Expression<bool> Function($$AppSettingsTableFilterComposer f) f,
  ) {
    final $$AppSettingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appSettings,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppSettingsTableFilterComposer(
            $db: $db,
            $table: $db.appSettings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notificationsRefs(
    Expression<bool> Function($$NotificationsTableFilterComposer f) f,
  ) {
    final $$NotificationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notifications,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificationsTableFilterComposer(
            $db: $db,
            $table: $db.notifications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cashbackRemindersRefs(
    Expression<bool> Function($$CashbackRemindersTableFilterComposer f) f,
  ) {
    final $$CashbackRemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cashbackReminders,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashbackRemindersTableFilterComposer(
            $db: $db,
            $table: $db.cashbackReminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupStatus => $composableBuilder(
    column: $table.groupStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get leftAt => $composableBuilder(
    column: $table.leftAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get rejoinedAt => $composableBuilder(
    column: $table.rejoinedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpacesTableOrderingComposer get spaceId {
    final $$SpacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableOrderingComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserRole, String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<GroupStatus, String> get groupStatus =>
      $composableBuilder(
        column: $table.groupStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get leftAt =>
      $composableBuilder(column: $table.leftAt, builder: (column) => column);

  GeneratedColumn<DateTime> get rejoinedAt => $composableBuilder(
    column: $table.rejoinedAt,
    builder: (column) => column,
  );

  $$SpacesTableAnnotationComposer get spaceId {
    final $$SpacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableAnnotationComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> accountsRefs<T extends Object>(
    Expression<T> Function($$AccountsTableAnnotationComposer a) f,
  ) {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> customDashboardsRefs<T extends Object>(
    Expression<T> Function($$CustomDashboardsTableAnnotationComposer a) f,
  ) {
    final $$CustomDashboardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customDashboards,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomDashboardsTableAnnotationComposer(
            $db: $db,
            $table: $db.customDashboards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> trustedCounterpartiesRefs<T extends Object>(
    Expression<T> Function($$TrustedCounterpartiesTableAnnotationComposer a) f,
  ) {
    final $$TrustedCounterpartiesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.trustedCounterparties,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TrustedCounterpartiesTableAnnotationComposer(
                $db: $db,
                $table: $db.trustedCounterparties,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> appSettingsRefs<T extends Object>(
    Expression<T> Function($$AppSettingsTableAnnotationComposer a) f,
  ) {
    final $$AppSettingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appSettings,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppSettingsTableAnnotationComposer(
            $db: $db,
            $table: $db.appSettings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> notificationsRefs<T extends Object>(
    Expression<T> Function($$NotificationsTableAnnotationComposer a) f,
  ) {
    final $$NotificationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notifications,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificationsTableAnnotationComposer(
            $db: $db,
            $table: $db.notifications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> cashbackRemindersRefs<T extends Object>(
    Expression<T> Function($$CashbackRemindersTableAnnotationComposer a) f,
  ) {
    final $$CashbackRemindersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cashbackReminders,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CashbackRemindersTableAnnotationComposer(
                $db: $db,
                $table: $db.cashbackReminders,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool spaceId,
            bool accountsRefs,
            bool customDashboardsRefs,
            bool trustedCounterpartiesRefs,
            bool appSettingsRefs,
            bool notificationsRefs,
            bool cashbackRemindersRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> spaceId = const Value.absent(),
                Value<UserRole> role = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<GroupStatus> groupStatus = const Value.absent(),
                Value<DateTime?> leftAt = const Value.absent(),
                Value<DateTime?> rejoinedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                spaceId: spaceId,
                role: role,
                displayName: displayName,
                groupStatus: groupStatus,
                leftAt: leftAt,
                rejoinedAt: rejoinedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> spaceId = const Value.absent(),
                required UserRole role,
                required String displayName,
                Value<GroupStatus> groupStatus = const Value.absent(),
                Value<DateTime?> leftAt = const Value.absent(),
                Value<DateTime?> rejoinedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                spaceId: spaceId,
                role: role,
                displayName: displayName,
                groupStatus: groupStatus,
                leftAt: leftAt,
                rejoinedAt: rejoinedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                spaceId = false,
                accountsRefs = false,
                customDashboardsRefs = false,
                trustedCounterpartiesRefs = false,
                appSettingsRefs = false,
                notificationsRefs = false,
                cashbackRemindersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (accountsRefs) db.accounts,
                    if (customDashboardsRefs) db.customDashboards,
                    if (trustedCounterpartiesRefs) db.trustedCounterparties,
                    if (appSettingsRefs) db.appSettings,
                    if (notificationsRefs) db.notifications,
                    if (cashbackRemindersRefs) db.cashbackReminders,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (spaceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.spaceId,
                                    referencedTable: $$UsersTableReferences
                                        ._spaceIdTable(db),
                                    referencedColumn: $$UsersTableReferences
                                        ._spaceIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (accountsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Account>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._accountsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).accountsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (customDashboardsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          CustomDashboard
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._customDashboardsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).customDashboardsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (trustedCounterpartiesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          TrustedCounterparty
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._trustedCounterpartiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).trustedCounterpartiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (appSettingsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          AppSetting
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._appSettingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).appSettingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notificationsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          Notification
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._notificationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).notificationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cashbackRemindersRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          CashbackReminder
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._cashbackRemindersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).cashbackRemindersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool spaceId,
        bool accountsRefs,
        bool customDashboardsRefs,
        bool trustedCounterpartiesRefs,
        bool appSettingsRefs,
        bool notificationsRefs,
        bool cashbackRemindersRefs,
      })
    >;
typedef $$AccountsTableCreateCompanionBuilder =
    AccountsCompanion Function({
      required String id,
      required String userId,
      required String bankName,
      required String customName,
      Value<String?> cardNumberMask,
      required AccountType accountType,
      Value<String> currency,
      Value<double?> creditLimit,
      Value<DateTime?> gracePeriodEnd,
      Value<double?> minPaymentAmount,
      Value<double> currentBalance,
      Value<bool> includeInPersonalBalance,
      Value<bool> includeInFamilyBalance,
      Value<bool> isSharedBalance,
      Value<bool> isSharedExpenses,
      Value<String> expenseDetailLevel,
      Value<bool> isSharedIncomes,
      Value<String> incomeDetailLevel,
      Value<int> rowid,
    });
typedef $$AccountsTableUpdateCompanionBuilder =
    AccountsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> bankName,
      Value<String> customName,
      Value<String?> cardNumberMask,
      Value<AccountType> accountType,
      Value<String> currency,
      Value<double?> creditLimit,
      Value<DateTime?> gracePeriodEnd,
      Value<double?> minPaymentAmount,
      Value<double> currentBalance,
      Value<bool> includeInPersonalBalance,
      Value<bool> includeInFamilyBalance,
      Value<bool> isSharedBalance,
      Value<bool> isSharedExpenses,
      Value<String> expenseDetailLevel,
      Value<bool> isSharedIncomes,
      Value<String> incomeDetailLevel,
      Value<int> rowid,
    });

final class $$AccountsTableReferences
    extends BaseReferences<_$AppDatabase, $AccountsTable, Account> {
  $$AccountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('accounts__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: 'accounts__id__transactions__account_id',
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CashbackMatrixTable, List<CashbackMatrixData>>
  _cashbackMatrixRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cashbackMatrix,
    aliasName: 'accounts__id__cashback_matrix__account_id',
  );

  $$CashbackMatrixTableProcessedTableManager get cashbackMatrixRefs {
    final manager = $$CashbackMatrixTableTableManager(
      $_db,
      $_db.cashbackMatrix,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_cashbackMatrixRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cardNumberMask => $composableBuilder(
    column: $table.cardNumberMask,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AccountType, AccountType, String>
  get accountType => $composableBuilder(
    column: $table.accountType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get gracePeriodEnd => $composableBuilder(
    column: $table.gracePeriodEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minPaymentAmount => $composableBuilder(
    column: $table.minPaymentAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentBalance => $composableBuilder(
    column: $table.currentBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get includeInPersonalBalance => $composableBuilder(
    column: $table.includeInPersonalBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get includeInFamilyBalance => $composableBuilder(
    column: $table.includeInFamilyBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSharedBalance => $composableBuilder(
    column: $table.isSharedBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSharedExpenses => $composableBuilder(
    column: $table.isSharedExpenses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expenseDetailLevel => $composableBuilder(
    column: $table.expenseDetailLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSharedIncomes => $composableBuilder(
    column: $table.isSharedIncomes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get incomeDetailLevel => $composableBuilder(
    column: $table.incomeDetailLevel,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cashbackMatrixRefs(
    Expression<bool> Function($$CashbackMatrixTableFilterComposer f) f,
  ) {
    final $$CashbackMatrixTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cashbackMatrix,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashbackMatrixTableFilterComposer(
            $db: $db,
            $table: $db.cashbackMatrix,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cardNumberMask => $composableBuilder(
    column: $table.cardNumberMask,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountType => $composableBuilder(
    column: $table.accountType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get gracePeriodEnd => $composableBuilder(
    column: $table.gracePeriodEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minPaymentAmount => $composableBuilder(
    column: $table.minPaymentAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentBalance => $composableBuilder(
    column: $table.currentBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get includeInPersonalBalance => $composableBuilder(
    column: $table.includeInPersonalBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get includeInFamilyBalance => $composableBuilder(
    column: $table.includeInFamilyBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSharedBalance => $composableBuilder(
    column: $table.isSharedBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSharedExpenses => $composableBuilder(
    column: $table.isSharedExpenses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expenseDetailLevel => $composableBuilder(
    column: $table.expenseDetailLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSharedIncomes => $composableBuilder(
    column: $table.isSharedIncomes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get incomeDetailLevel => $composableBuilder(
    column: $table.incomeDetailLevel,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cardNumberMask => $composableBuilder(
    column: $table.cardNumberMask,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<AccountType, String> get accountType =>
      $composableBuilder(
        column: $table.accountType,
        builder: (column) => column,
      );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get gracePeriodEnd => $composableBuilder(
    column: $table.gracePeriodEnd,
    builder: (column) => column,
  );

  GeneratedColumn<double> get minPaymentAmount => $composableBuilder(
    column: $table.minPaymentAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get currentBalance => $composableBuilder(
    column: $table.currentBalance,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get includeInPersonalBalance => $composableBuilder(
    column: $table.includeInPersonalBalance,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get includeInFamilyBalance => $composableBuilder(
    column: $table.includeInFamilyBalance,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSharedBalance => $composableBuilder(
    column: $table.isSharedBalance,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSharedExpenses => $composableBuilder(
    column: $table.isSharedExpenses,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expenseDetailLevel => $composableBuilder(
    column: $table.expenseDetailLevel,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSharedIncomes => $composableBuilder(
    column: $table.isSharedIncomes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get incomeDetailLevel => $composableBuilder(
    column: $table.incomeDetailLevel,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> cashbackMatrixRefs<T extends Object>(
    Expression<T> Function($$CashbackMatrixTableAnnotationComposer a) f,
  ) {
    final $$CashbackMatrixTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cashbackMatrix,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashbackMatrixTableAnnotationComposer(
            $db: $db,
            $table: $db.cashbackMatrix,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountsTable,
          Account,
          $$AccountsTableFilterComposer,
          $$AccountsTableOrderingComposer,
          $$AccountsTableAnnotationComposer,
          $$AccountsTableCreateCompanionBuilder,
          $$AccountsTableUpdateCompanionBuilder,
          (Account, $$AccountsTableReferences),
          Account,
          PrefetchHooks Function({
            bool userId,
            bool transactionsRefs,
            bool cashbackMatrixRefs,
          })
        > {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> bankName = const Value.absent(),
                Value<String> customName = const Value.absent(),
                Value<String?> cardNumberMask = const Value.absent(),
                Value<AccountType> accountType = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<double?> creditLimit = const Value.absent(),
                Value<DateTime?> gracePeriodEnd = const Value.absent(),
                Value<double?> minPaymentAmount = const Value.absent(),
                Value<double> currentBalance = const Value.absent(),
                Value<bool> includeInPersonalBalance = const Value.absent(),
                Value<bool> includeInFamilyBalance = const Value.absent(),
                Value<bool> isSharedBalance = const Value.absent(),
                Value<bool> isSharedExpenses = const Value.absent(),
                Value<String> expenseDetailLevel = const Value.absent(),
                Value<bool> isSharedIncomes = const Value.absent(),
                Value<String> incomeDetailLevel = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion(
                id: id,
                userId: userId,
                bankName: bankName,
                customName: customName,
                cardNumberMask: cardNumberMask,
                accountType: accountType,
                currency: currency,
                creditLimit: creditLimit,
                gracePeriodEnd: gracePeriodEnd,
                minPaymentAmount: minPaymentAmount,
                currentBalance: currentBalance,
                includeInPersonalBalance: includeInPersonalBalance,
                includeInFamilyBalance: includeInFamilyBalance,
                isSharedBalance: isSharedBalance,
                isSharedExpenses: isSharedExpenses,
                expenseDetailLevel: expenseDetailLevel,
                isSharedIncomes: isSharedIncomes,
                incomeDetailLevel: incomeDetailLevel,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String bankName,
                required String customName,
                Value<String?> cardNumberMask = const Value.absent(),
                required AccountType accountType,
                Value<String> currency = const Value.absent(),
                Value<double?> creditLimit = const Value.absent(),
                Value<DateTime?> gracePeriodEnd = const Value.absent(),
                Value<double?> minPaymentAmount = const Value.absent(),
                Value<double> currentBalance = const Value.absent(),
                Value<bool> includeInPersonalBalance = const Value.absent(),
                Value<bool> includeInFamilyBalance = const Value.absent(),
                Value<bool> isSharedBalance = const Value.absent(),
                Value<bool> isSharedExpenses = const Value.absent(),
                Value<String> expenseDetailLevel = const Value.absent(),
                Value<bool> isSharedIncomes = const Value.absent(),
                Value<String> incomeDetailLevel = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion.insert(
                id: id,
                userId: userId,
                bankName: bankName,
                customName: customName,
                cardNumberMask: cardNumberMask,
                accountType: accountType,
                currency: currency,
                creditLimit: creditLimit,
                gracePeriodEnd: gracePeriodEnd,
                minPaymentAmount: minPaymentAmount,
                currentBalance: currentBalance,
                includeInPersonalBalance: includeInPersonalBalance,
                includeInFamilyBalance: includeInFamilyBalance,
                isSharedBalance: isSharedBalance,
                isSharedExpenses: isSharedExpenses,
                expenseDetailLevel: expenseDetailLevel,
                isSharedIncomes: isSharedIncomes,
                incomeDetailLevel: incomeDetailLevel,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                transactionsRefs = false,
                cashbackMatrixRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionsRefs) db.transactions,
                    if (cashbackMatrixRefs) db.cashbackMatrix,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable: $$AccountsTableReferences
                                        ._userIdTable(db),
                                    referencedColumn: $$AccountsTableReferences
                                        ._userIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionsRefs)
                        await $_getPrefetchedData<
                          Account,
                          $AccountsTable,
                          Transaction
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._transactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cashbackMatrixRefs)
                        await $_getPrefetchedData<
                          Account,
                          $AccountsTable,
                          CashbackMatrixData
                        >(
                          currentTable: table,
                          referencedTable: $$AccountsTableReferences
                              ._cashbackMatrixRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).cashbackMatrixRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountsTable,
      Account,
      $$AccountsTableFilterComposer,
      $$AccountsTableOrderingComposer,
      $$AccountsTableAnnotationComposer,
      $$AccountsTableCreateCompanionBuilder,
      $$AccountsTableUpdateCompanionBuilder,
      (Account, $$AccountsTableReferences),
      Account,
      PrefetchHooks Function({
        bool userId,
        bool transactionsRefs,
        bool cashbackMatrixRefs,
      })
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String id,
      Value<String?> spaceId,
      Value<String?> parentId,
      required String name,
      required CategoryType type,
      Value<bool> isPinnedForCashback,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> id,
      Value<String?> spaceId,
      Value<String?> parentId,
      Value<String> name,
      Value<CategoryType> type,
      Value<bool> isPinnedForCashback,
      Value<int> rowid,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SpacesTable _spaceIdTable(_$AppDatabase db) =>
      db.spaces.createAlias('categories__space_id__spaces__id');

  $$SpacesTableProcessedTableManager? get spaceId {
    final $_column = $_itemColumn<String>('space_id');
    if ($_column == null) return null;
    final manager = $$SpacesTableTableManager(
      $_db,
      $_db.spaces,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_spaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: 'categories__id__transactions__custom_category_id',
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter(
          (f) => f.customCategoryId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CategoryRulesTable, List<CategoryRule>>
  _categoryRulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.categoryRules,
    aliasName: 'categories__id__category_rules__target_category_id',
  );

  $$CategoryRulesTableProcessedTableManager get categoryRulesRefs {
    final manager = $$CategoryRulesTableTableManager($_db, $_db.categoryRules)
        .filter(
          (f) => f.targetCategoryId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_categoryRulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BudgetLimitsTable, List<BudgetLimit>>
  _budgetLimitsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.budgetLimits,
    aliasName: 'categories__id__budget_limits__category_id',
  );

  $$BudgetLimitsTableProcessedTableManager get budgetLimitsRefs {
    final manager = $$BudgetLimitsTableTableManager(
      $_db,
      $_db.budgetLimits,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_budgetLimitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CategoryType, CategoryType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get isPinnedForCashback => $composableBuilder(
    column: $table.isPinnedForCashback,
    builder: (column) => ColumnFilters(column),
  );

  $$SpacesTableFilterComposer get spaceId {
    final $$SpacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableFilterComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.customCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> categoryRulesRefs(
    Expression<bool> Function($$CategoryRulesTableFilterComposer f) f,
  ) {
    final $$CategoryRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categoryRules,
      getReferencedColumn: (t) => t.targetCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryRulesTableFilterComposer(
            $db: $db,
            $table: $db.categoryRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> budgetLimitsRefs(
    Expression<bool> Function($$BudgetLimitsTableFilterComposer f) f,
  ) {
    final $$BudgetLimitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgetLimits,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetLimitsTableFilterComposer(
            $db: $db,
            $table: $db.budgetLimits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPinnedForCashback => $composableBuilder(
    column: $table.isPinnedForCashback,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpacesTableOrderingComposer get spaceId {
    final $$SpacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableOrderingComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CategoryType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isPinnedForCashback => $composableBuilder(
    column: $table.isPinnedForCashback,
    builder: (column) => column,
  );

  $$SpacesTableAnnotationComposer get spaceId {
    final $$SpacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableAnnotationComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.customCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> categoryRulesRefs<T extends Object>(
    Expression<T> Function($$CategoryRulesTableAnnotationComposer a) f,
  ) {
    final $$CategoryRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categoryRules,
      getReferencedColumn: (t) => t.targetCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.categoryRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> budgetLimitsRefs<T extends Object>(
    Expression<T> Function($$BudgetLimitsTableAnnotationComposer a) f,
  ) {
    final $$BudgetLimitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgetLimits,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetLimitsTableAnnotationComposer(
            $db: $db,
            $table: $db.budgetLimits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({
            bool spaceId,
            bool transactionsRefs,
            bool categoryRulesRefs,
            bool budgetLimitsRefs,
          })
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> spaceId = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<CategoryType> type = const Value.absent(),
                Value<bool> isPinnedForCashback = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                spaceId: spaceId,
                parentId: parentId,
                name: name,
                type: type,
                isPinnedForCashback: isPinnedForCashback,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> spaceId = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                required String name,
                required CategoryType type,
                Value<bool> isPinnedForCashback = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                spaceId: spaceId,
                parentId: parentId,
                name: name,
                type: type,
                isPinnedForCashback: isPinnedForCashback,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                spaceId = false,
                transactionsRefs = false,
                categoryRulesRefs = false,
                budgetLimitsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionsRefs) db.transactions,
                    if (categoryRulesRefs) db.categoryRules,
                    if (budgetLimitsRefs) db.budgetLimits,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (spaceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.spaceId,
                                    referencedTable: $$CategoriesTableReferences
                                        ._spaceIdTable(db),
                                    referencedColumn:
                                        $$CategoriesTableReferences
                                            ._spaceIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionsRefs)
                        await $_getPrefetchedData<
                          Category,
                          $CategoriesTable,
                          Transaction
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._transactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.customCategoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (categoryRulesRefs)
                        await $_getPrefetchedData<
                          Category,
                          $CategoriesTable,
                          CategoryRule
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._categoryRulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).categoryRulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.targetCategoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (budgetLimitsRefs)
                        await $_getPrefetchedData<
                          Category,
                          $CategoriesTable,
                          BudgetLimit
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._budgetLimitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).budgetLimitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({
        bool spaceId,
        bool transactionsRefs,
        bool categoryRulesRefs,
        bool budgetLimitsRefs,
      })
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      required String id,
      required String accountId,
      Value<String?> bankTransactionId,
      required DateTime date,
      required double amount,
      Value<String?> originalCurrency,
      Value<double?> originalAmount,
      required TransactionType type,
      Value<bool> isRefund,
      Value<String?> bankCategory,
      Value<String?> customCategoryId,
      Value<String?> comment,
      Value<bool> isUserEdited,
      Value<SyncStatus> syncStatus,
      Value<bool> isHiddenByCalendar,
      Value<DateTime?> hiddenUntilDate,
      Value<AuditStatus> auditStatus,
      Value<bool> isArchivedForSpace,
      Value<bool> businessMirror,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      Value<String> accountId,
      Value<String?> bankTransactionId,
      Value<DateTime> date,
      Value<double> amount,
      Value<String?> originalCurrency,
      Value<double?> originalAmount,
      Value<TransactionType> type,
      Value<bool> isRefund,
      Value<String?> bankCategory,
      Value<String?> customCategoryId,
      Value<String?> comment,
      Value<bool> isUserEdited,
      Value<SyncStatus> syncStatus,
      Value<bool> isHiddenByCalendar,
      Value<DateTime?> hiddenUntilDate,
      Value<AuditStatus> auditStatus,
      Value<bool> isArchivedForSpace,
      Value<bool> businessMirror,
      Value<int> rowid,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTable _accountIdTable(_$AppDatabase db) =>
      db.accounts.createAlias('transactions__account_id__accounts__id');

  $$AccountsTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<String>('account_id')!;

    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _customCategoryIdTable(_$AppDatabase db) => db
      .categories
      .createAlias('transactions__custom_category_id__categories__id');

  $$CategoriesTableProcessedTableManager? get customCategoryId {
    final $_column = $_itemColumn<String>('custom_category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $DashboardTransactionsTable,
    List<DashboardTransaction>
  >
  _dashboardTransactionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dashboardTransactions,
        aliasName: 'transactions__id__dashboard_transactions__transaction_id',
      );

  $$DashboardTransactionsTableProcessedTableManager
  get dashboardTransactionsRefs {
    final manager = $$DashboardTransactionsTableTableManager(
      $_db,
      $_db.dashboardTransactions,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dashboardTransactionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankTransactionId => $composableBuilder(
    column: $table.bankTransactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalCurrency => $composableBuilder(
    column: $table.originalCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get originalAmount => $composableBuilder(
    column: $table.originalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TransactionType, TransactionType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isRefund => $composableBuilder(
    column: $table.isRefund,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankCategory => $composableBuilder(
    column: $table.bankCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUserEdited => $composableBuilder(
    column: $table.isUserEdited,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isHiddenByCalendar => $composableBuilder(
    column: $table.isHiddenByCalendar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hiddenUntilDate => $composableBuilder(
    column: $table.hiddenUntilDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AuditStatus, AuditStatus, String>
  get auditStatus => $composableBuilder(
    column: $table.auditStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isArchivedForSpace => $composableBuilder(
    column: $table.isArchivedForSpace,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get businessMirror => $composableBuilder(
    column: $table.businessMirror,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountsTableFilterComposer get accountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get customCategoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customCategoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dashboardTransactionsRefs(
    Expression<bool> Function($$DashboardTransactionsTableFilterComposer f) f,
  ) {
    final $$DashboardTransactionsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dashboardTransactions,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DashboardTransactionsTableFilterComposer(
                $db: $db,
                $table: $db.dashboardTransactions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankTransactionId => $composableBuilder(
    column: $table.bankTransactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalCurrency => $composableBuilder(
    column: $table.originalCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get originalAmount => $composableBuilder(
    column: $table.originalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRefund => $composableBuilder(
    column: $table.isRefund,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankCategory => $composableBuilder(
    column: $table.bankCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUserEdited => $composableBuilder(
    column: $table.isUserEdited,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isHiddenByCalendar => $composableBuilder(
    column: $table.isHiddenByCalendar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hiddenUntilDate => $composableBuilder(
    column: $table.hiddenUntilDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get auditStatus => $composableBuilder(
    column: $table.auditStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchivedForSpace => $composableBuilder(
    column: $table.isArchivedForSpace,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get businessMirror => $composableBuilder(
    column: $table.businessMirror,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountsTableOrderingComposer get accountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get customCategoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customCategoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get bankTransactionId => $composableBuilder(
    column: $table.bankTransactionId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get originalCurrency => $composableBuilder(
    column: $table.originalCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<double> get originalAmount => $composableBuilder(
    column: $table.originalAmount,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<TransactionType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isRefund =>
      $composableBuilder(column: $table.isRefund, builder: (column) => column);

  GeneratedColumn<String> get bankCategory => $composableBuilder(
    column: $table.bankCategory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<bool> get isUserEdited => $composableBuilder(
    column: $table.isUserEdited,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get isHiddenByCalendar => $composableBuilder(
    column: $table.isHiddenByCalendar,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get hiddenUntilDate => $composableBuilder(
    column: $table.hiddenUntilDate,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<AuditStatus, String> get auditStatus =>
      $composableBuilder(
        column: $table.auditStatus,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get isArchivedForSpace => $composableBuilder(
    column: $table.isArchivedForSpace,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get businessMirror => $composableBuilder(
    column: $table.businessMirror,
    builder: (column) => column,
  );

  $$AccountsTableAnnotationComposer get accountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get customCategoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customCategoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dashboardTransactionsRefs<T extends Object>(
    Expression<T> Function($$DashboardTransactionsTableAnnotationComposer a) f,
  ) {
    final $$DashboardTransactionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dashboardTransactions,
          getReferencedColumn: (t) => t.transactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DashboardTransactionsTableAnnotationComposer(
                $db: $db,
                $table: $db.dashboardTransactions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          Transaction,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (Transaction, $$TransactionsTableReferences),
          Transaction,
          PrefetchHooks Function({
            bool accountId,
            bool customCategoryId,
            bool dashboardTransactionsRefs,
          })
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<String?> bankTransactionId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String?> originalCurrency = const Value.absent(),
                Value<double?> originalAmount = const Value.absent(),
                Value<TransactionType> type = const Value.absent(),
                Value<bool> isRefund = const Value.absent(),
                Value<String?> bankCategory = const Value.absent(),
                Value<String?> customCategoryId = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<bool> isUserEdited = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<bool> isHiddenByCalendar = const Value.absent(),
                Value<DateTime?> hiddenUntilDate = const Value.absent(),
                Value<AuditStatus> auditStatus = const Value.absent(),
                Value<bool> isArchivedForSpace = const Value.absent(),
                Value<bool> businessMirror = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                accountId: accountId,
                bankTransactionId: bankTransactionId,
                date: date,
                amount: amount,
                originalCurrency: originalCurrency,
                originalAmount: originalAmount,
                type: type,
                isRefund: isRefund,
                bankCategory: bankCategory,
                customCategoryId: customCategoryId,
                comment: comment,
                isUserEdited: isUserEdited,
                syncStatus: syncStatus,
                isHiddenByCalendar: isHiddenByCalendar,
                hiddenUntilDate: hiddenUntilDate,
                auditStatus: auditStatus,
                isArchivedForSpace: isArchivedForSpace,
                businessMirror: businessMirror,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String accountId,
                Value<String?> bankTransactionId = const Value.absent(),
                required DateTime date,
                required double amount,
                Value<String?> originalCurrency = const Value.absent(),
                Value<double?> originalAmount = const Value.absent(),
                required TransactionType type,
                Value<bool> isRefund = const Value.absent(),
                Value<String?> bankCategory = const Value.absent(),
                Value<String?> customCategoryId = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<bool> isUserEdited = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<bool> isHiddenByCalendar = const Value.absent(),
                Value<DateTime?> hiddenUntilDate = const Value.absent(),
                Value<AuditStatus> auditStatus = const Value.absent(),
                Value<bool> isArchivedForSpace = const Value.absent(),
                Value<bool> businessMirror = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                accountId: accountId,
                bankTransactionId: bankTransactionId,
                date: date,
                amount: amount,
                originalCurrency: originalCurrency,
                originalAmount: originalAmount,
                type: type,
                isRefund: isRefund,
                bankCategory: bankCategory,
                customCategoryId: customCategoryId,
                comment: comment,
                isUserEdited: isUserEdited,
                syncStatus: syncStatus,
                isHiddenByCalendar: isHiddenByCalendar,
                hiddenUntilDate: hiddenUntilDate,
                auditStatus: auditStatus,
                isArchivedForSpace: isArchivedForSpace,
                businessMirror: businessMirror,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                accountId = false,
                customCategoryId = false,
                dashboardTransactionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dashboardTransactionsRefs) db.dashboardTransactions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (accountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.accountId,
                                    referencedTable:
                                        $$TransactionsTableReferences
                                            ._accountIdTable(db),
                                    referencedColumn:
                                        $$TransactionsTableReferences
                                            ._accountIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (customCategoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.customCategoryId,
                                    referencedTable:
                                        $$TransactionsTableReferences
                                            ._customCategoryIdTable(db),
                                    referencedColumn:
                                        $$TransactionsTableReferences
                                            ._customCategoryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dashboardTransactionsRefs)
                        await $_getPrefetchedData<
                          Transaction,
                          $TransactionsTable,
                          DashboardTransaction
                        >(
                          currentTable: table,
                          referencedTable: $$TransactionsTableReferences
                              ._dashboardTransactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).dashboardTransactionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      Transaction,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (Transaction, $$TransactionsTableReferences),
      Transaction,
      PrefetchHooks Function({
        bool accountId,
        bool customCategoryId,
        bool dashboardTransactionsRefs,
      })
    >;
typedef $$CustomDashboardsTableCreateCompanionBuilder =
    CustomDashboardsCompanion Function({
      required String id,
      required String userId,
      required String dashboardName,
      Value<bool> isEnabledPAndL,
      Value<int> rowid,
    });
typedef $$CustomDashboardsTableUpdateCompanionBuilder =
    CustomDashboardsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> dashboardName,
      Value<bool> isEnabledPAndL,
      Value<int> rowid,
    });

final class $$CustomDashboardsTableReferences
    extends
        BaseReferences<_$AppDatabase, $CustomDashboardsTable, CustomDashboard> {
  $$CustomDashboardsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('custom_dashboards__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $DashboardTransactionsTable,
    List<DashboardTransaction>
  >
  _dashboardTransactionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dashboardTransactions,
        aliasName:
            'custom_dashboards__id__dashboard_transactions__dashboard_id',
      );

  $$DashboardTransactionsTableProcessedTableManager
  get dashboardTransactionsRefs {
    final manager = $$DashboardTransactionsTableTableManager(
      $_db,
      $_db.dashboardTransactions,
    ).filter((f) => f.dashboardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dashboardTransactionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DashboardRulesTable, List<DashboardRule>>
  _dashboardRulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dashboardRules,
    aliasName: 'custom_dashboards__id__dashboard_rules__dashboard_id',
  );

  $$DashboardRulesTableProcessedTableManager get dashboardRulesRefs {
    final manager = $$DashboardRulesTableTableManager(
      $_db,
      $_db.dashboardRules,
    ).filter((f) => f.dashboardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dashboardRulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CustomDashboardsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomDashboardsTable> {
  $$CustomDashboardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dashboardName => $composableBuilder(
    column: $table.dashboardName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabledPAndL => $composableBuilder(
    column: $table.isEnabledPAndL,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dashboardTransactionsRefs(
    Expression<bool> Function($$DashboardTransactionsTableFilterComposer f) f,
  ) {
    final $$DashboardTransactionsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dashboardTransactions,
          getReferencedColumn: (t) => t.dashboardId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DashboardTransactionsTableFilterComposer(
                $db: $db,
                $table: $db.dashboardTransactions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> dashboardRulesRefs(
    Expression<bool> Function($$DashboardRulesTableFilterComposer f) f,
  ) {
    final $$DashboardRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dashboardRules,
      getReferencedColumn: (t) => t.dashboardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DashboardRulesTableFilterComposer(
            $db: $db,
            $table: $db.dashboardRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomDashboardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomDashboardsTable> {
  $$CustomDashboardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dashboardName => $composableBuilder(
    column: $table.dashboardName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabledPAndL => $composableBuilder(
    column: $table.isEnabledPAndL,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomDashboardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomDashboardsTable> {
  $$CustomDashboardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get dashboardName => $composableBuilder(
    column: $table.dashboardName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEnabledPAndL => $composableBuilder(
    column: $table.isEnabledPAndL,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dashboardTransactionsRefs<T extends Object>(
    Expression<T> Function($$DashboardTransactionsTableAnnotationComposer a) f,
  ) {
    final $$DashboardTransactionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dashboardTransactions,
          getReferencedColumn: (t) => t.dashboardId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DashboardTransactionsTableAnnotationComposer(
                $db: $db,
                $table: $db.dashboardTransactions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> dashboardRulesRefs<T extends Object>(
    Expression<T> Function($$DashboardRulesTableAnnotationComposer a) f,
  ) {
    final $$DashboardRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dashboardRules,
      getReferencedColumn: (t) => t.dashboardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DashboardRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.dashboardRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomDashboardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomDashboardsTable,
          CustomDashboard,
          $$CustomDashboardsTableFilterComposer,
          $$CustomDashboardsTableOrderingComposer,
          $$CustomDashboardsTableAnnotationComposer,
          $$CustomDashboardsTableCreateCompanionBuilder,
          $$CustomDashboardsTableUpdateCompanionBuilder,
          (CustomDashboard, $$CustomDashboardsTableReferences),
          CustomDashboard,
          PrefetchHooks Function({
            bool userId,
            bool dashboardTransactionsRefs,
            bool dashboardRulesRefs,
          })
        > {
  $$CustomDashboardsTableTableManager(
    _$AppDatabase db,
    $CustomDashboardsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomDashboardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomDashboardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomDashboardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> dashboardName = const Value.absent(),
                Value<bool> isEnabledPAndL = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomDashboardsCompanion(
                id: id,
                userId: userId,
                dashboardName: dashboardName,
                isEnabledPAndL: isEnabledPAndL,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String dashboardName,
                Value<bool> isEnabledPAndL = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomDashboardsCompanion.insert(
                id: id,
                userId: userId,
                dashboardName: dashboardName,
                isEnabledPAndL: isEnabledPAndL,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CustomDashboardsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                dashboardTransactionsRefs = false,
                dashboardRulesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dashboardTransactionsRefs) db.dashboardTransactions,
                    if (dashboardRulesRefs) db.dashboardRules,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$CustomDashboardsTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$CustomDashboardsTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dashboardTransactionsRefs)
                        await $_getPrefetchedData<
                          CustomDashboard,
                          $CustomDashboardsTable,
                          DashboardTransaction
                        >(
                          currentTable: table,
                          referencedTable: $$CustomDashboardsTableReferences
                              ._dashboardTransactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CustomDashboardsTableReferences(
                                db,
                                table,
                                p0,
                              ).dashboardTransactionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dashboardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dashboardRulesRefs)
                        await $_getPrefetchedData<
                          CustomDashboard,
                          $CustomDashboardsTable,
                          DashboardRule
                        >(
                          currentTable: table,
                          referencedTable: $$CustomDashboardsTableReferences
                              ._dashboardRulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CustomDashboardsTableReferences(
                                db,
                                table,
                                p0,
                              ).dashboardRulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dashboardId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CustomDashboardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomDashboardsTable,
      CustomDashboard,
      $$CustomDashboardsTableFilterComposer,
      $$CustomDashboardsTableOrderingComposer,
      $$CustomDashboardsTableAnnotationComposer,
      $$CustomDashboardsTableCreateCompanionBuilder,
      $$CustomDashboardsTableUpdateCompanionBuilder,
      (CustomDashboard, $$CustomDashboardsTableReferences),
      CustomDashboard,
      PrefetchHooks Function({
        bool userId,
        bool dashboardTransactionsRefs,
        bool dashboardRulesRefs,
      })
    >;
typedef $$DashboardTransactionsTableCreateCompanionBuilder =
    DashboardTransactionsCompanion Function({
      required String dashboardId,
      required String transactionId,
      Value<int> rowid,
    });
typedef $$DashboardTransactionsTableUpdateCompanionBuilder =
    DashboardTransactionsCompanion Function({
      Value<String> dashboardId,
      Value<String> transactionId,
      Value<int> rowid,
    });

final class $$DashboardTransactionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DashboardTransactionsTable,
          DashboardTransaction
        > {
  $$DashboardTransactionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CustomDashboardsTable _dashboardIdTable(_$AppDatabase db) =>
      db.customDashboards.createAlias(
        'dashboard_transactions__dashboard_id__custom_dashboards__id',
      );

  $$CustomDashboardsTableProcessedTableManager get dashboardId {
    final $_column = $_itemColumn<String>('dashboard_id')!;

    final manager = $$CustomDashboardsTableTableManager(
      $_db,
      $_db.customDashboards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dashboardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) => db
      .transactions
      .createAlias('dashboard_transactions__transaction_id__transactions__id');

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<String>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DashboardTransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $DashboardTransactionsTable> {
  $$DashboardTransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CustomDashboardsTableFilterComposer get dashboardId {
    final $$CustomDashboardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dashboardId,
      referencedTable: $db.customDashboards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomDashboardsTableFilterComposer(
            $db: $db,
            $table: $db.customDashboards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DashboardTransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DashboardTransactionsTable> {
  $$DashboardTransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CustomDashboardsTableOrderingComposer get dashboardId {
    final $$CustomDashboardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dashboardId,
      referencedTable: $db.customDashboards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomDashboardsTableOrderingComposer(
            $db: $db,
            $table: $db.customDashboards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DashboardTransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DashboardTransactionsTable> {
  $$DashboardTransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CustomDashboardsTableAnnotationComposer get dashboardId {
    final $$CustomDashboardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dashboardId,
      referencedTable: $db.customDashboards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomDashboardsTableAnnotationComposer(
            $db: $db,
            $table: $db.customDashboards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DashboardTransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DashboardTransactionsTable,
          DashboardTransaction,
          $$DashboardTransactionsTableFilterComposer,
          $$DashboardTransactionsTableOrderingComposer,
          $$DashboardTransactionsTableAnnotationComposer,
          $$DashboardTransactionsTableCreateCompanionBuilder,
          $$DashboardTransactionsTableUpdateCompanionBuilder,
          (DashboardTransaction, $$DashboardTransactionsTableReferences),
          DashboardTransaction,
          PrefetchHooks Function({bool dashboardId, bool transactionId})
        > {
  $$DashboardTransactionsTableTableManager(
    _$AppDatabase db,
    $DashboardTransactionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DashboardTransactionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DashboardTransactionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DashboardTransactionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> dashboardId = const Value.absent(),
                Value<String> transactionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DashboardTransactionsCompanion(
                dashboardId: dashboardId,
                transactionId: transactionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String dashboardId,
                required String transactionId,
                Value<int> rowid = const Value.absent(),
              }) => DashboardTransactionsCompanion.insert(
                dashboardId: dashboardId,
                transactionId: transactionId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DashboardTransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({dashboardId = false, transactionId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (dashboardId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dashboardId,
                                    referencedTable:
                                        $$DashboardTransactionsTableReferences
                                            ._dashboardIdTable(db),
                                    referencedColumn:
                                        $$DashboardTransactionsTableReferences
                                            ._dashboardIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (transactionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.transactionId,
                                    referencedTable:
                                        $$DashboardTransactionsTableReferences
                                            ._transactionIdTable(db),
                                    referencedColumn:
                                        $$DashboardTransactionsTableReferences
                                            ._transactionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$DashboardTransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DashboardTransactionsTable,
      DashboardTransaction,
      $$DashboardTransactionsTableFilterComposer,
      $$DashboardTransactionsTableOrderingComposer,
      $$DashboardTransactionsTableAnnotationComposer,
      $$DashboardTransactionsTableCreateCompanionBuilder,
      $$DashboardTransactionsTableUpdateCompanionBuilder,
      (DashboardTransaction, $$DashboardTransactionsTableReferences),
      DashboardTransaction,
      PrefetchHooks Function({bool dashboardId, bool transactionId})
    >;
typedef $$DashboardRulesTableCreateCompanionBuilder =
    DashboardRulesCompanion Function({
      required String id,
      required String dashboardId,
      required DashboardTriggerType triggerType,
      required String triggerValue,
      Value<int> rowid,
    });
typedef $$DashboardRulesTableUpdateCompanionBuilder =
    DashboardRulesCompanion Function({
      Value<String> id,
      Value<String> dashboardId,
      Value<DashboardTriggerType> triggerType,
      Value<String> triggerValue,
      Value<int> rowid,
    });

final class $$DashboardRulesTableReferences
    extends BaseReferences<_$AppDatabase, $DashboardRulesTable, DashboardRule> {
  $$DashboardRulesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CustomDashboardsTable _dashboardIdTable(_$AppDatabase db) => db
      .customDashboards
      .createAlias('dashboard_rules__dashboard_id__custom_dashboards__id');

  $$CustomDashboardsTableProcessedTableManager get dashboardId {
    final $_column = $_itemColumn<String>('dashboard_id')!;

    final manager = $$CustomDashboardsTableTableManager(
      $_db,
      $_db.customDashboards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dashboardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DashboardRulesTableFilterComposer
    extends Composer<_$AppDatabase, $DashboardRulesTable> {
  $$DashboardRulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    DashboardTriggerType,
    DashboardTriggerType,
    String
  >
  get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get triggerValue => $composableBuilder(
    column: $table.triggerValue,
    builder: (column) => ColumnFilters(column),
  );

  $$CustomDashboardsTableFilterComposer get dashboardId {
    final $$CustomDashboardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dashboardId,
      referencedTable: $db.customDashboards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomDashboardsTableFilterComposer(
            $db: $db,
            $table: $db.customDashboards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DashboardRulesTableOrderingComposer
    extends Composer<_$AppDatabase, $DashboardRulesTable> {
  $$DashboardRulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggerValue => $composableBuilder(
    column: $table.triggerValue,
    builder: (column) => ColumnOrderings(column),
  );

  $$CustomDashboardsTableOrderingComposer get dashboardId {
    final $$CustomDashboardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dashboardId,
      referencedTable: $db.customDashboards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomDashboardsTableOrderingComposer(
            $db: $db,
            $table: $db.customDashboards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DashboardRulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DashboardRulesTable> {
  $$DashboardRulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DashboardTriggerType, String>
  get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get triggerValue => $composableBuilder(
    column: $table.triggerValue,
    builder: (column) => column,
  );

  $$CustomDashboardsTableAnnotationComposer get dashboardId {
    final $$CustomDashboardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dashboardId,
      referencedTable: $db.customDashboards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomDashboardsTableAnnotationComposer(
            $db: $db,
            $table: $db.customDashboards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DashboardRulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DashboardRulesTable,
          DashboardRule,
          $$DashboardRulesTableFilterComposer,
          $$DashboardRulesTableOrderingComposer,
          $$DashboardRulesTableAnnotationComposer,
          $$DashboardRulesTableCreateCompanionBuilder,
          $$DashboardRulesTableUpdateCompanionBuilder,
          (DashboardRule, $$DashboardRulesTableReferences),
          DashboardRule,
          PrefetchHooks Function({bool dashboardId})
        > {
  $$DashboardRulesTableTableManager(
    _$AppDatabase db,
    $DashboardRulesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DashboardRulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DashboardRulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DashboardRulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> dashboardId = const Value.absent(),
                Value<DashboardTriggerType> triggerType = const Value.absent(),
                Value<String> triggerValue = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DashboardRulesCompanion(
                id: id,
                dashboardId: dashboardId,
                triggerType: triggerType,
                triggerValue: triggerValue,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dashboardId,
                required DashboardTriggerType triggerType,
                required String triggerValue,
                Value<int> rowid = const Value.absent(),
              }) => DashboardRulesCompanion.insert(
                id: id,
                dashboardId: dashboardId,
                triggerType: triggerType,
                triggerValue: triggerValue,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DashboardRulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dashboardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (dashboardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dashboardId,
                                referencedTable: $$DashboardRulesTableReferences
                                    ._dashboardIdTable(db),
                                referencedColumn:
                                    $$DashboardRulesTableReferences
                                        ._dashboardIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DashboardRulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DashboardRulesTable,
      DashboardRule,
      $$DashboardRulesTableFilterComposer,
      $$DashboardRulesTableOrderingComposer,
      $$DashboardRulesTableAnnotationComposer,
      $$DashboardRulesTableCreateCompanionBuilder,
      $$DashboardRulesTableUpdateCompanionBuilder,
      (DashboardRule, $$DashboardRulesTableReferences),
      DashboardRule,
      PrefetchHooks Function({bool dashboardId})
    >;
typedef $$CategoryRulesTableCreateCompanionBuilder =
    CategoryRulesCompanion Function({
      required String id,
      required String spaceId,
      required String bankName,
      required String triggerString,
      required String targetCategoryId,
      Value<int> rowid,
    });
typedef $$CategoryRulesTableUpdateCompanionBuilder =
    CategoryRulesCompanion Function({
      Value<String> id,
      Value<String> spaceId,
      Value<String> bankName,
      Value<String> triggerString,
      Value<String> targetCategoryId,
      Value<int> rowid,
    });

final class $$CategoryRulesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoryRulesTable, CategoryRule> {
  $$CategoryRulesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SpacesTable _spaceIdTable(_$AppDatabase db) =>
      db.spaces.createAlias('category_rules__space_id__spaces__id');

  $$SpacesTableProcessedTableManager get spaceId {
    final $_column = $_itemColumn<String>('space_id')!;

    final manager = $$SpacesTableTableManager(
      $_db,
      $_db.spaces,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_spaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _targetCategoryIdTable(_$AppDatabase db) => db
      .categories
      .createAlias('category_rules__target_category_id__categories__id');

  $$CategoriesTableProcessedTableManager get targetCategoryId {
    final $_column = $_itemColumn<String>('target_category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_targetCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CategoryRulesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryRulesTable> {
  $$CategoryRulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get triggerString => $composableBuilder(
    column: $table.triggerString,
    builder: (column) => ColumnFilters(column),
  );

  $$SpacesTableFilterComposer get spaceId {
    final $$SpacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableFilterComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get targetCategoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetCategoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoryRulesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryRulesTable> {
  $$CategoryRulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggerString => $composableBuilder(
    column: $table.triggerString,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpacesTableOrderingComposer get spaceId {
    final $$SpacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableOrderingComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get targetCategoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetCategoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoryRulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryRulesTable> {
  $$CategoryRulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get triggerString => $composableBuilder(
    column: $table.triggerString,
    builder: (column) => column,
  );

  $$SpacesTableAnnotationComposer get spaceId {
    final $$SpacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableAnnotationComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get targetCategoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.targetCategoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoryRulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryRulesTable,
          CategoryRule,
          $$CategoryRulesTableFilterComposer,
          $$CategoryRulesTableOrderingComposer,
          $$CategoryRulesTableAnnotationComposer,
          $$CategoryRulesTableCreateCompanionBuilder,
          $$CategoryRulesTableUpdateCompanionBuilder,
          (CategoryRule, $$CategoryRulesTableReferences),
          CategoryRule,
          PrefetchHooks Function({bool spaceId, bool targetCategoryId})
        > {
  $$CategoryRulesTableTableManager(_$AppDatabase db, $CategoryRulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryRulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryRulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryRulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> spaceId = const Value.absent(),
                Value<String> bankName = const Value.absent(),
                Value<String> triggerString = const Value.absent(),
                Value<String> targetCategoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoryRulesCompanion(
                id: id,
                spaceId: spaceId,
                bankName: bankName,
                triggerString: triggerString,
                targetCategoryId: targetCategoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String spaceId,
                required String bankName,
                required String triggerString,
                required String targetCategoryId,
                Value<int> rowid = const Value.absent(),
              }) => CategoryRulesCompanion.insert(
                id: id,
                spaceId: spaceId,
                bankName: bankName,
                triggerString: triggerString,
                targetCategoryId: targetCategoryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoryRulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({spaceId = false, targetCategoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (spaceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.spaceId,
                                referencedTable: $$CategoryRulesTableReferences
                                    ._spaceIdTable(db),
                                referencedColumn: $$CategoryRulesTableReferences
                                    ._spaceIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (targetCategoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.targetCategoryId,
                                referencedTable: $$CategoryRulesTableReferences
                                    ._targetCategoryIdTable(db),
                                referencedColumn: $$CategoryRulesTableReferences
                                    ._targetCategoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CategoryRulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryRulesTable,
      CategoryRule,
      $$CategoryRulesTableFilterComposer,
      $$CategoryRulesTableOrderingComposer,
      $$CategoryRulesTableAnnotationComposer,
      $$CategoryRulesTableCreateCompanionBuilder,
      $$CategoryRulesTableUpdateCompanionBuilder,
      (CategoryRule, $$CategoryRulesTableReferences),
      CategoryRule,
      PrefetchHooks Function({bool spaceId, bool targetCategoryId})
    >;
typedef $$TrustedCounterpartiesTableCreateCompanionBuilder =
    TrustedCounterpartiesCompanion Function({
      required String id,
      required String userId,
      required String counterpartyIdentity,
      Value<bool> excludeExpenses,
      Value<bool> excludeIncomes,
      Value<int> rowid,
    });
typedef $$TrustedCounterpartiesTableUpdateCompanionBuilder =
    TrustedCounterpartiesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> counterpartyIdentity,
      Value<bool> excludeExpenses,
      Value<bool> excludeIncomes,
      Value<int> rowid,
    });

final class $$TrustedCounterpartiesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TrustedCounterpartiesTable,
          TrustedCounterparty
        > {
  $$TrustedCounterpartiesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('trusted_counterparties__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TrustedCounterpartiesTableFilterComposer
    extends Composer<_$AppDatabase, $TrustedCounterpartiesTable> {
  $$TrustedCounterpartiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get counterpartyIdentity => $composableBuilder(
    column: $table.counterpartyIdentity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excludeExpenses => $composableBuilder(
    column: $table.excludeExpenses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excludeIncomes => $composableBuilder(
    column: $table.excludeIncomes,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrustedCounterpartiesTableOrderingComposer
    extends Composer<_$AppDatabase, $TrustedCounterpartiesTable> {
  $$TrustedCounterpartiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get counterpartyIdentity => $composableBuilder(
    column: $table.counterpartyIdentity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excludeExpenses => $composableBuilder(
    column: $table.excludeExpenses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excludeIncomes => $composableBuilder(
    column: $table.excludeIncomes,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrustedCounterpartiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrustedCounterpartiesTable> {
  $$TrustedCounterpartiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get counterpartyIdentity => $composableBuilder(
    column: $table.counterpartyIdentity,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get excludeExpenses => $composableBuilder(
    column: $table.excludeExpenses,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get excludeIncomes => $composableBuilder(
    column: $table.excludeIncomes,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrustedCounterpartiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrustedCounterpartiesTable,
          TrustedCounterparty,
          $$TrustedCounterpartiesTableFilterComposer,
          $$TrustedCounterpartiesTableOrderingComposer,
          $$TrustedCounterpartiesTableAnnotationComposer,
          $$TrustedCounterpartiesTableCreateCompanionBuilder,
          $$TrustedCounterpartiesTableUpdateCompanionBuilder,
          (TrustedCounterparty, $$TrustedCounterpartiesTableReferences),
          TrustedCounterparty,
          PrefetchHooks Function({bool userId})
        > {
  $$TrustedCounterpartiesTableTableManager(
    _$AppDatabase db,
    $TrustedCounterpartiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrustedCounterpartiesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TrustedCounterpartiesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TrustedCounterpartiesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> counterpartyIdentity = const Value.absent(),
                Value<bool> excludeExpenses = const Value.absent(),
                Value<bool> excludeIncomes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrustedCounterpartiesCompanion(
                id: id,
                userId: userId,
                counterpartyIdentity: counterpartyIdentity,
                excludeExpenses: excludeExpenses,
                excludeIncomes: excludeIncomes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String counterpartyIdentity,
                Value<bool> excludeExpenses = const Value.absent(),
                Value<bool> excludeIncomes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrustedCounterpartiesCompanion.insert(
                id: id,
                userId: userId,
                counterpartyIdentity: counterpartyIdentity,
                excludeExpenses: excludeExpenses,
                excludeIncomes: excludeIncomes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TrustedCounterpartiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$TrustedCounterpartiesTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$TrustedCounterpartiesTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TrustedCounterpartiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrustedCounterpartiesTable,
      TrustedCounterparty,
      $$TrustedCounterpartiesTableFilterComposer,
      $$TrustedCounterpartiesTableOrderingComposer,
      $$TrustedCounterpartiesTableAnnotationComposer,
      $$TrustedCounterpartiesTableCreateCompanionBuilder,
      $$TrustedCounterpartiesTableUpdateCompanionBuilder,
      (TrustedCounterparty, $$TrustedCounterpartiesTableReferences),
      TrustedCounterparty,
      PrefetchHooks Function({bool userId})
    >;
typedef $$BudgetLimitsTableCreateCompanionBuilder =
    BudgetLimitsCompanion Function({
      required String id,
      required String spaceId,
      required String categoryId,
      required int year,
      required int month,
      required double limitAmount,
      Value<int?> alertPercent,
      Value<double?> alertAmount,
      Value<int> rowid,
    });
typedef $$BudgetLimitsTableUpdateCompanionBuilder =
    BudgetLimitsCompanion Function({
      Value<String> id,
      Value<String> spaceId,
      Value<String> categoryId,
      Value<int> year,
      Value<int> month,
      Value<double> limitAmount,
      Value<int?> alertPercent,
      Value<double?> alertAmount,
      Value<int> rowid,
    });

final class $$BudgetLimitsTableReferences
    extends BaseReferences<_$AppDatabase, $BudgetLimitsTable, BudgetLimit> {
  $$BudgetLimitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SpacesTable _spaceIdTable(_$AppDatabase db) =>
      db.spaces.createAlias('budget_limits__space_id__spaces__id');

  $$SpacesTableProcessedTableManager get spaceId {
    final $_column = $_itemColumn<String>('space_id')!;

    final manager = $$SpacesTableTableManager(
      $_db,
      $_db.spaces,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_spaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('budget_limits__category_id__categories__id');

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<String>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BudgetLimitsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetLimitsTable> {
  $$BudgetLimitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get limitAmount => $composableBuilder(
    column: $table.limitAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get alertPercent => $composableBuilder(
    column: $table.alertPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get alertAmount => $composableBuilder(
    column: $table.alertAmount,
    builder: (column) => ColumnFilters(column),
  );

  $$SpacesTableFilterComposer get spaceId {
    final $$SpacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableFilterComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetLimitsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetLimitsTable> {
  $$BudgetLimitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get limitAmount => $composableBuilder(
    column: $table.limitAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get alertPercent => $composableBuilder(
    column: $table.alertPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get alertAmount => $composableBuilder(
    column: $table.alertAmount,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpacesTableOrderingComposer get spaceId {
    final $$SpacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableOrderingComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetLimitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetLimitsTable> {
  $$BudgetLimitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<double> get limitAmount => $composableBuilder(
    column: $table.limitAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get alertPercent => $composableBuilder(
    column: $table.alertPercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get alertAmount => $composableBuilder(
    column: $table.alertAmount,
    builder: (column) => column,
  );

  $$SpacesTableAnnotationComposer get spaceId {
    final $$SpacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spaceId,
      referencedTable: $db.spaces,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacesTableAnnotationComposer(
            $db: $db,
            $table: $db.spaces,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetLimitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BudgetLimitsTable,
          BudgetLimit,
          $$BudgetLimitsTableFilterComposer,
          $$BudgetLimitsTableOrderingComposer,
          $$BudgetLimitsTableAnnotationComposer,
          $$BudgetLimitsTableCreateCompanionBuilder,
          $$BudgetLimitsTableUpdateCompanionBuilder,
          (BudgetLimit, $$BudgetLimitsTableReferences),
          BudgetLimit,
          PrefetchHooks Function({bool spaceId, bool categoryId})
        > {
  $$BudgetLimitsTableTableManager(_$AppDatabase db, $BudgetLimitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetLimitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetLimitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetLimitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> spaceId = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<int> month = const Value.absent(),
                Value<double> limitAmount = const Value.absent(),
                Value<int?> alertPercent = const Value.absent(),
                Value<double?> alertAmount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BudgetLimitsCompanion(
                id: id,
                spaceId: spaceId,
                categoryId: categoryId,
                year: year,
                month: month,
                limitAmount: limitAmount,
                alertPercent: alertPercent,
                alertAmount: alertAmount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String spaceId,
                required String categoryId,
                required int year,
                required int month,
                required double limitAmount,
                Value<int?> alertPercent = const Value.absent(),
                Value<double?> alertAmount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BudgetLimitsCompanion.insert(
                id: id,
                spaceId: spaceId,
                categoryId: categoryId,
                year: year,
                month: month,
                limitAmount: limitAmount,
                alertPercent: alertPercent,
                alertAmount: alertAmount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BudgetLimitsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({spaceId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (spaceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.spaceId,
                                referencedTable: $$BudgetLimitsTableReferences
                                    ._spaceIdTable(db),
                                referencedColumn: $$BudgetLimitsTableReferences
                                    ._spaceIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable: $$BudgetLimitsTableReferences
                                    ._categoryIdTable(db),
                                referencedColumn: $$BudgetLimitsTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BudgetLimitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BudgetLimitsTable,
      BudgetLimit,
      $$BudgetLimitsTableFilterComposer,
      $$BudgetLimitsTableOrderingComposer,
      $$BudgetLimitsTableAnnotationComposer,
      $$BudgetLimitsTableCreateCompanionBuilder,
      $$BudgetLimitsTableUpdateCompanionBuilder,
      (BudgetLimit, $$BudgetLimitsTableReferences),
      BudgetLimit,
      PrefetchHooks Function({bool spaceId, bool categoryId})
    >;
typedef $$CashbackMatrixTableCreateCompanionBuilder =
    CashbackMatrixCompanion Function({
      required String id,
      required String accountId,
      required String categoryName,
      required double percent,
      required CashbackStatus status,
      required CashbackLifetimeType lifetimeType,
      Value<DateTime?> expiresAt,
      Value<int> rowid,
    });
typedef $$CashbackMatrixTableUpdateCompanionBuilder =
    CashbackMatrixCompanion Function({
      Value<String> id,
      Value<String> accountId,
      Value<String> categoryName,
      Value<double> percent,
      Value<CashbackStatus> status,
      Value<CashbackLifetimeType> lifetimeType,
      Value<DateTime?> expiresAt,
      Value<int> rowid,
    });

final class $$CashbackMatrixTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CashbackMatrixTable,
          CashbackMatrixData
        > {
  $$CashbackMatrixTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AccountsTable _accountIdTable(_$AppDatabase db) =>
      db.accounts.createAlias('cashback_matrix__account_id__accounts__id');

  $$AccountsTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<String>('account_id')!;

    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CashbackMatrixTableFilterComposer
    extends Composer<_$AppDatabase, $CashbackMatrixTable> {
  $$CashbackMatrixTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get percent => $composableBuilder(
    column: $table.percent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CashbackStatus, CashbackStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    CashbackLifetimeType,
    CashbackLifetimeType,
    String
  >
  get lifetimeType => $composableBuilder(
    column: $table.lifetimeType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountsTableFilterComposer get accountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CashbackMatrixTableOrderingComposer
    extends Composer<_$AppDatabase, $CashbackMatrixTable> {
  $$CashbackMatrixTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get percent => $composableBuilder(
    column: $table.percent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifetimeType => $composableBuilder(
    column: $table.lifetimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountsTableOrderingComposer get accountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CashbackMatrixTableAnnotationComposer
    extends Composer<_$AppDatabase, $CashbackMatrixTable> {
  $$CashbackMatrixTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get percent =>
      $composableBuilder(column: $table.percent, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CashbackStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CashbackLifetimeType, String>
  get lifetimeType => $composableBuilder(
    column: $table.lifetimeType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  $$AccountsTableAnnotationComposer get accountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CashbackMatrixTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CashbackMatrixTable,
          CashbackMatrixData,
          $$CashbackMatrixTableFilterComposer,
          $$CashbackMatrixTableOrderingComposer,
          $$CashbackMatrixTableAnnotationComposer,
          $$CashbackMatrixTableCreateCompanionBuilder,
          $$CashbackMatrixTableUpdateCompanionBuilder,
          (CashbackMatrixData, $$CashbackMatrixTableReferences),
          CashbackMatrixData,
          PrefetchHooks Function({bool accountId})
        > {
  $$CashbackMatrixTableTableManager(
    _$AppDatabase db,
    $CashbackMatrixTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashbackMatrixTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashbackMatrixTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashbackMatrixTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<String> categoryName = const Value.absent(),
                Value<double> percent = const Value.absent(),
                Value<CashbackStatus> status = const Value.absent(),
                Value<CashbackLifetimeType> lifetimeType = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CashbackMatrixCompanion(
                id: id,
                accountId: accountId,
                categoryName: categoryName,
                percent: percent,
                status: status,
                lifetimeType: lifetimeType,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String accountId,
                required String categoryName,
                required double percent,
                required CashbackStatus status,
                required CashbackLifetimeType lifetimeType,
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CashbackMatrixCompanion.insert(
                id: id,
                accountId: accountId,
                categoryName: categoryName,
                percent: percent,
                status: status,
                lifetimeType: lifetimeType,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CashbackMatrixTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable: $$CashbackMatrixTableReferences
                                    ._accountIdTable(db),
                                referencedColumn:
                                    $$CashbackMatrixTableReferences
                                        ._accountIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CashbackMatrixTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CashbackMatrixTable,
      CashbackMatrixData,
      $$CashbackMatrixTableFilterComposer,
      $$CashbackMatrixTableOrderingComposer,
      $$CashbackMatrixTableAnnotationComposer,
      $$CashbackMatrixTableCreateCompanionBuilder,
      $$CashbackMatrixTableUpdateCompanionBuilder,
      (CashbackMatrixData, $$CashbackMatrixTableReferences),
      CashbackMatrixData,
      PrefetchHooks Function({bool accountId})
    >;
typedef $$ExchangeRatesTableCreateCompanionBuilder =
    ExchangeRatesCompanion Function({
      required String id,
      required DateTime date,
      required String fromCurrency,
      required String toCurrency,
      required double rate,
      required String source,
      Value<int> rowid,
    });
typedef $$ExchangeRatesTableUpdateCompanionBuilder =
    ExchangeRatesCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<String> fromCurrency,
      Value<String> toCurrency,
      Value<double> rate,
      Value<String> source,
      Value<int> rowid,
    });

class $$ExchangeRatesTableFilterComposer
    extends Composer<_$AppDatabase, $ExchangeRatesTable> {
  $$ExchangeRatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromCurrency => $composableBuilder(
    column: $table.fromCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toCurrency => $composableBuilder(
    column: $table.toCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExchangeRatesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExchangeRatesTable> {
  $$ExchangeRatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromCurrency => $composableBuilder(
    column: $table.fromCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toCurrency => $composableBuilder(
    column: $table.toCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExchangeRatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExchangeRatesTable> {
  $$ExchangeRatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get fromCurrency => $composableBuilder(
    column: $table.fromCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<String> get toCurrency => $composableBuilder(
    column: $table.toCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$ExchangeRatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExchangeRatesTable,
          ExchangeRate,
          $$ExchangeRatesTableFilterComposer,
          $$ExchangeRatesTableOrderingComposer,
          $$ExchangeRatesTableAnnotationComposer,
          $$ExchangeRatesTableCreateCompanionBuilder,
          $$ExchangeRatesTableUpdateCompanionBuilder,
          (
            ExchangeRate,
            BaseReferences<_$AppDatabase, $ExchangeRatesTable, ExchangeRate>,
          ),
          ExchangeRate,
          PrefetchHooks Function()
        > {
  $$ExchangeRatesTableTableManager(_$AppDatabase db, $ExchangeRatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExchangeRatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExchangeRatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExchangeRatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> fromCurrency = const Value.absent(),
                Value<String> toCurrency = const Value.absent(),
                Value<double> rate = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExchangeRatesCompanion(
                id: id,
                date: date,
                fromCurrency: fromCurrency,
                toCurrency: toCurrency,
                rate: rate,
                source: source,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                required String fromCurrency,
                required String toCurrency,
                required double rate,
                required String source,
                Value<int> rowid = const Value.absent(),
              }) => ExchangeRatesCompanion.insert(
                id: id,
                date: date,
                fromCurrency: fromCurrency,
                toCurrency: toCurrency,
                rate: rate,
                source: source,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExchangeRatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExchangeRatesTable,
      ExchangeRate,
      $$ExchangeRatesTableFilterComposer,
      $$ExchangeRatesTableOrderingComposer,
      $$ExchangeRatesTableAnnotationComposer,
      $$ExchangeRatesTableCreateCompanionBuilder,
      $$ExchangeRatesTableUpdateCompanionBuilder,
      (
        ExchangeRate,
        BaseReferences<_$AppDatabase, $ExchangeRatesTable, ExchangeRate>,
      ),
      ExchangeRate,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String userId,
      Value<String> baseCurrency,
      Value<bool> useHistoricalExchangeRate,
      Value<bool> refundsOffsetExpenses,
      Value<bool> inheritLimitFromPreviousMonth,
      Value<bool> carryOverUnusedLimit,
      Value<LimitAlertMode> limitAlertMode,
      Value<int> globalAlertPercent,
      Value<double?> globalAlertAmount,
      Value<double> largeTransactionThreshold,
      Value<int> secrecyTimeoutSeconds,
      Value<int> secrecyDaysBefore,
      Value<bool> enableReceiveOthersSyncErrors,
      Value<String?> digestConfig,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> userId,
      Value<String> baseCurrency,
      Value<bool> useHistoricalExchangeRate,
      Value<bool> refundsOffsetExpenses,
      Value<bool> inheritLimitFromPreviousMonth,
      Value<bool> carryOverUnusedLimit,
      Value<LimitAlertMode> limitAlertMode,
      Value<int> globalAlertPercent,
      Value<double?> globalAlertAmount,
      Value<double> largeTransactionThreshold,
      Value<int> secrecyTimeoutSeconds,
      Value<int> secrecyDaysBefore,
      Value<bool> enableReceiveOthersSyncErrors,
      Value<String?> digestConfig,
      Value<int> rowid,
    });

final class $$AppSettingsTableReferences
    extends BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting> {
  $$AppSettingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('app_settings__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get baseCurrency => $composableBuilder(
    column: $table.baseCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get useHistoricalExchangeRate => $composableBuilder(
    column: $table.useHistoricalExchangeRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get refundsOffsetExpenses => $composableBuilder(
    column: $table.refundsOffsetExpenses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get inheritLimitFromPreviousMonth => $composableBuilder(
    column: $table.inheritLimitFromPreviousMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get carryOverUnusedLimit => $composableBuilder(
    column: $table.carryOverUnusedLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LimitAlertMode, LimitAlertMode, String>
  get limitAlertMode => $composableBuilder(
    column: $table.limitAlertMode,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get globalAlertPercent => $composableBuilder(
    column: $table.globalAlertPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get globalAlertAmount => $composableBuilder(
    column: $table.globalAlertAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get largeTransactionThreshold => $composableBuilder(
    column: $table.largeTransactionThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get secrecyTimeoutSeconds => $composableBuilder(
    column: $table.secrecyTimeoutSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get secrecyDaysBefore => $composableBuilder(
    column: $table.secrecyDaysBefore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enableReceiveOthersSyncErrors => $composableBuilder(
    column: $table.enableReceiveOthersSyncErrors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get digestConfig => $composableBuilder(
    column: $table.digestConfig,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get baseCurrency => $composableBuilder(
    column: $table.baseCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get useHistoricalExchangeRate => $composableBuilder(
    column: $table.useHistoricalExchangeRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get refundsOffsetExpenses => $composableBuilder(
    column: $table.refundsOffsetExpenses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get inheritLimitFromPreviousMonth => $composableBuilder(
    column: $table.inheritLimitFromPreviousMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get carryOverUnusedLimit => $composableBuilder(
    column: $table.carryOverUnusedLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get limitAlertMode => $composableBuilder(
    column: $table.limitAlertMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get globalAlertPercent => $composableBuilder(
    column: $table.globalAlertPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get globalAlertAmount => $composableBuilder(
    column: $table.globalAlertAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get largeTransactionThreshold => $composableBuilder(
    column: $table.largeTransactionThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get secrecyTimeoutSeconds => $composableBuilder(
    column: $table.secrecyTimeoutSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get secrecyDaysBefore => $composableBuilder(
    column: $table.secrecyDaysBefore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enableReceiveOthersSyncErrors => $composableBuilder(
    column: $table.enableReceiveOthersSyncErrors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get digestConfig => $composableBuilder(
    column: $table.digestConfig,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get baseCurrency => $composableBuilder(
    column: $table.baseCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get useHistoricalExchangeRate => $composableBuilder(
    column: $table.useHistoricalExchangeRate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get refundsOffsetExpenses => $composableBuilder(
    column: $table.refundsOffsetExpenses,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get inheritLimitFromPreviousMonth => $composableBuilder(
    column: $table.inheritLimitFromPreviousMonth,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get carryOverUnusedLimit => $composableBuilder(
    column: $table.carryOverUnusedLimit,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<LimitAlertMode, String> get limitAlertMode =>
      $composableBuilder(
        column: $table.limitAlertMode,
        builder: (column) => column,
      );

  GeneratedColumn<int> get globalAlertPercent => $composableBuilder(
    column: $table.globalAlertPercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get globalAlertAmount => $composableBuilder(
    column: $table.globalAlertAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get largeTransactionThreshold => $composableBuilder(
    column: $table.largeTransactionThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<int> get secrecyTimeoutSeconds => $composableBuilder(
    column: $table.secrecyTimeoutSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get secrecyDaysBefore => $composableBuilder(
    column: $table.secrecyDaysBefore,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enableReceiveOthersSyncErrors => $composableBuilder(
    column: $table.enableReceiveOthersSyncErrors,
    builder: (column) => column,
  );

  GeneratedColumn<String> get digestConfig => $composableBuilder(
    column: $table.digestConfig,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (AppSetting, $$AppSettingsTableReferences),
          AppSetting,
          PrefetchHooks Function({bool userId})
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<String> baseCurrency = const Value.absent(),
                Value<bool> useHistoricalExchangeRate = const Value.absent(),
                Value<bool> refundsOffsetExpenses = const Value.absent(),
                Value<bool> inheritLimitFromPreviousMonth =
                    const Value.absent(),
                Value<bool> carryOverUnusedLimit = const Value.absent(),
                Value<LimitAlertMode> limitAlertMode = const Value.absent(),
                Value<int> globalAlertPercent = const Value.absent(),
                Value<double?> globalAlertAmount = const Value.absent(),
                Value<double> largeTransactionThreshold = const Value.absent(),
                Value<int> secrecyTimeoutSeconds = const Value.absent(),
                Value<int> secrecyDaysBefore = const Value.absent(),
                Value<bool> enableReceiveOthersSyncErrors =
                    const Value.absent(),
                Value<String?> digestConfig = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                userId: userId,
                baseCurrency: baseCurrency,
                useHistoricalExchangeRate: useHistoricalExchangeRate,
                refundsOffsetExpenses: refundsOffsetExpenses,
                inheritLimitFromPreviousMonth: inheritLimitFromPreviousMonth,
                carryOverUnusedLimit: carryOverUnusedLimit,
                limitAlertMode: limitAlertMode,
                globalAlertPercent: globalAlertPercent,
                globalAlertAmount: globalAlertAmount,
                largeTransactionThreshold: largeTransactionThreshold,
                secrecyTimeoutSeconds: secrecyTimeoutSeconds,
                secrecyDaysBefore: secrecyDaysBefore,
                enableReceiveOthersSyncErrors: enableReceiveOthersSyncErrors,
                digestConfig: digestConfig,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                Value<String> baseCurrency = const Value.absent(),
                Value<bool> useHistoricalExchangeRate = const Value.absent(),
                Value<bool> refundsOffsetExpenses = const Value.absent(),
                Value<bool> inheritLimitFromPreviousMonth =
                    const Value.absent(),
                Value<bool> carryOverUnusedLimit = const Value.absent(),
                Value<LimitAlertMode> limitAlertMode = const Value.absent(),
                Value<int> globalAlertPercent = const Value.absent(),
                Value<double?> globalAlertAmount = const Value.absent(),
                Value<double> largeTransactionThreshold = const Value.absent(),
                Value<int> secrecyTimeoutSeconds = const Value.absent(),
                Value<int> secrecyDaysBefore = const Value.absent(),
                Value<bool> enableReceiveOthersSyncErrors =
                    const Value.absent(),
                Value<String?> digestConfig = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                userId: userId,
                baseCurrency: baseCurrency,
                useHistoricalExchangeRate: useHistoricalExchangeRate,
                refundsOffsetExpenses: refundsOffsetExpenses,
                inheritLimitFromPreviousMonth: inheritLimitFromPreviousMonth,
                carryOverUnusedLimit: carryOverUnusedLimit,
                limitAlertMode: limitAlertMode,
                globalAlertPercent: globalAlertPercent,
                globalAlertAmount: globalAlertAmount,
                largeTransactionThreshold: largeTransactionThreshold,
                secrecyTimeoutSeconds: secrecyTimeoutSeconds,
                secrecyDaysBefore: secrecyDaysBefore,
                enableReceiveOthersSyncErrors: enableReceiveOthersSyncErrors,
                digestConfig: digestConfig,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AppSettingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$AppSettingsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$AppSettingsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (AppSetting, $$AppSettingsTableReferences),
      AppSetting,
      PrefetchHooks Function({bool userId})
    >;
typedef $$NotificationsTableCreateCompanionBuilder =
    NotificationsCompanion Function({
      required String id,
      required String userId,
      required String type,
      required String title,
      required String body,
      Value<bool> isRead,
      Value<String?> relatedTransactionId,
      Value<String?> actionTaken,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$NotificationsTableUpdateCompanionBuilder =
    NotificationsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> type,
      Value<String> title,
      Value<String> body,
      Value<bool> isRead,
      Value<String?> relatedTransactionId,
      Value<String?> actionTaken,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$NotificationsTableReferences
    extends BaseReferences<_$AppDatabase, $NotificationsTable, Notification> {
  $$NotificationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('notifications__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedTransactionId => $composableBuilder(
    column: $table.relatedTransactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionTaken => $composableBuilder(
    column: $table.actionTaken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedTransactionId => $composableBuilder(
    column: $table.relatedTransactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionTaken => $composableBuilder(
    column: $table.actionTaken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<String> get relatedTransactionId => $composableBuilder(
    column: $table.relatedTransactionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actionTaken => $composableBuilder(
    column: $table.actionTaken,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationsTable,
          Notification,
          $$NotificationsTableFilterComposer,
          $$NotificationsTableOrderingComposer,
          $$NotificationsTableAnnotationComposer,
          $$NotificationsTableCreateCompanionBuilder,
          $$NotificationsTableUpdateCompanionBuilder,
          (Notification, $$NotificationsTableReferences),
          Notification,
          PrefetchHooks Function({bool userId})
        > {
  $$NotificationsTableTableManager(_$AppDatabase db, $NotificationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                Value<String?> relatedTransactionId = const Value.absent(),
                Value<String?> actionTaken = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationsCompanion(
                id: id,
                userId: userId,
                type: type,
                title: title,
                body: body,
                isRead: isRead,
                relatedTransactionId: relatedTransactionId,
                actionTaken: actionTaken,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String type,
                required String title,
                required String body,
                Value<bool> isRead = const Value.absent(),
                Value<String?> relatedTransactionId = const Value.absent(),
                Value<String?> actionTaken = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationsCompanion.insert(
                id: id,
                userId: userId,
                type: type,
                title: title,
                body: body,
                isRead: isRead,
                relatedTransactionId: relatedTransactionId,
                actionTaken: actionTaken,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NotificationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$NotificationsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$NotificationsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationsTable,
      Notification,
      $$NotificationsTableFilterComposer,
      $$NotificationsTableOrderingComposer,
      $$NotificationsTableAnnotationComposer,
      $$NotificationsTableCreateCompanionBuilder,
      $$NotificationsTableUpdateCompanionBuilder,
      (Notification, $$NotificationsTableReferences),
      Notification,
      PrefetchHooks Function({bool userId})
    >;
typedef $$CashbackRemindersTableCreateCompanionBuilder =
    CashbackRemindersCompanion Function({
      required String id,
      required String userId,
      required DateTime scheduledAt,
      required String repeatType,
      Value<bool> isEnabled,
      Value<int> rowid,
    });
typedef $$CashbackRemindersTableUpdateCompanionBuilder =
    CashbackRemindersCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> scheduledAt,
      Value<String> repeatType,
      Value<bool> isEnabled,
      Value<int> rowid,
    });

final class $$CashbackRemindersTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CashbackRemindersTable,
          CashbackReminder
        > {
  $$CashbackRemindersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('cashback_reminders__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CashbackRemindersTableFilterComposer
    extends Composer<_$AppDatabase, $CashbackRemindersTable> {
  $$CashbackRemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get repeatType => $composableBuilder(
    column: $table.repeatType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CashbackRemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $CashbackRemindersTable> {
  $$CashbackRemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get repeatType => $composableBuilder(
    column: $table.repeatType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CashbackRemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CashbackRemindersTable> {
  $$CashbackRemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get repeatType => $composableBuilder(
    column: $table.repeatType,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CashbackRemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CashbackRemindersTable,
          CashbackReminder,
          $$CashbackRemindersTableFilterComposer,
          $$CashbackRemindersTableOrderingComposer,
          $$CashbackRemindersTableAnnotationComposer,
          $$CashbackRemindersTableCreateCompanionBuilder,
          $$CashbackRemindersTableUpdateCompanionBuilder,
          (CashbackReminder, $$CashbackRemindersTableReferences),
          CashbackReminder,
          PrefetchHooks Function({bool userId})
        > {
  $$CashbackRemindersTableTableManager(
    _$AppDatabase db,
    $CashbackRemindersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashbackRemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashbackRemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashbackRemindersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<String> repeatType = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CashbackRemindersCompanion(
                id: id,
                userId: userId,
                scheduledAt: scheduledAt,
                repeatType: repeatType,
                isEnabled: isEnabled,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime scheduledAt,
                required String repeatType,
                Value<bool> isEnabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CashbackRemindersCompanion.insert(
                id: id,
                userId: userId,
                scheduledAt: scheduledAt,
                repeatType: repeatType,
                isEnabled: isEnabled,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CashbackRemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$CashbackRemindersTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$CashbackRemindersTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CashbackRemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CashbackRemindersTable,
      CashbackReminder,
      $$CashbackRemindersTableFilterComposer,
      $$CashbackRemindersTableOrderingComposer,
      $$CashbackRemindersTableAnnotationComposer,
      $$CashbackRemindersTableCreateCompanionBuilder,
      $$CashbackRemindersTableUpdateCompanionBuilder,
      (CashbackReminder, $$CashbackRemindersTableReferences),
      CashbackReminder,
      PrefetchHooks Function({bool userId})
    >;
typedef $$SyncConflictsTableCreateCompanionBuilder =
    SyncConflictsCompanion Function({
      required String id,
      required String entityType,
      required String entityId,
      required String localValue,
      required String remoteValue,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$SyncConflictsTableUpdateCompanionBuilder =
    SyncConflictsCompanion Function({
      Value<String> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> localValue,
      Value<String> remoteValue,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$SyncConflictsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncConflictsTable> {
  $$SyncConflictsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localValue => $composableBuilder(
    column: $table.localValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteValue => $composableBuilder(
    column: $table.remoteValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncConflictsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncConflictsTable> {
  $$SyncConflictsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localValue => $composableBuilder(
    column: $table.localValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteValue => $composableBuilder(
    column: $table.remoteValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncConflictsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncConflictsTable> {
  $$SyncConflictsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get localValue => $composableBuilder(
    column: $table.localValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remoteValue => $composableBuilder(
    column: $table.remoteValue,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SyncConflictsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncConflictsTable,
          SyncConflict,
          $$SyncConflictsTableFilterComposer,
          $$SyncConflictsTableOrderingComposer,
          $$SyncConflictsTableAnnotationComposer,
          $$SyncConflictsTableCreateCompanionBuilder,
          $$SyncConflictsTableUpdateCompanionBuilder,
          (
            SyncConflict,
            BaseReferences<_$AppDatabase, $SyncConflictsTable, SyncConflict>,
          ),
          SyncConflict,
          PrefetchHooks Function()
        > {
  $$SyncConflictsTableTableManager(_$AppDatabase db, $SyncConflictsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncConflictsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncConflictsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncConflictsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> localValue = const Value.absent(),
                Value<String> remoteValue = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncConflictsCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                localValue: localValue,
                remoteValue: remoteValue,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entityType,
                required String entityId,
                required String localValue,
                required String remoteValue,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncConflictsCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                localValue: localValue,
                remoteValue: remoteValue,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncConflictsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncConflictsTable,
      SyncConflict,
      $$SyncConflictsTableFilterComposer,
      $$SyncConflictsTableOrderingComposer,
      $$SyncConflictsTableAnnotationComposer,
      $$SyncConflictsTableCreateCompanionBuilder,
      $$SyncConflictsTableUpdateCompanionBuilder,
      (
        SyncConflict,
        BaseReferences<_$AppDatabase, $SyncConflictsTable, SyncConflict>,
      ),
      SyncConflict,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SpacesTableTableManager get spaces =>
      $$SpacesTableTableManager(_db, _db.spaces);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$CustomDashboardsTableTableManager get customDashboards =>
      $$CustomDashboardsTableTableManager(_db, _db.customDashboards);
  $$DashboardTransactionsTableTableManager get dashboardTransactions =>
      $$DashboardTransactionsTableTableManager(_db, _db.dashboardTransactions);
  $$DashboardRulesTableTableManager get dashboardRules =>
      $$DashboardRulesTableTableManager(_db, _db.dashboardRules);
  $$CategoryRulesTableTableManager get categoryRules =>
      $$CategoryRulesTableTableManager(_db, _db.categoryRules);
  $$TrustedCounterpartiesTableTableManager get trustedCounterparties =>
      $$TrustedCounterpartiesTableTableManager(_db, _db.trustedCounterparties);
  $$BudgetLimitsTableTableManager get budgetLimits =>
      $$BudgetLimitsTableTableManager(_db, _db.budgetLimits);
  $$CashbackMatrixTableTableManager get cashbackMatrix =>
      $$CashbackMatrixTableTableManager(_db, _db.cashbackMatrix);
  $$ExchangeRatesTableTableManager get exchangeRates =>
      $$ExchangeRatesTableTableManager(_db, _db.exchangeRates);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$NotificationsTableTableManager get notifications =>
      $$NotificationsTableTableManager(_db, _db.notifications);
  $$CashbackRemindersTableTableManager get cashbackReminders =>
      $$CashbackRemindersTableTableManager(_db, _db.cashbackReminders);
  $$SyncConflictsTableTableManager get syncConflicts =>
      $$SyncConflictsTableTableManager(_db, _db.syncConflicts);
}
