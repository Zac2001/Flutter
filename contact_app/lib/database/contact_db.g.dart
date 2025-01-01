// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $ContactDbBuilderContract {
  /// Adds migrations to the builder.
  $ContactDbBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $ContactDbBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<ContactDb> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorContactDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $ContactDbBuilderContract databaseBuilder(String name) =>
      _$ContactDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $ContactDbBuilderContract inMemoryDatabaseBuilder() =>
      _$ContactDbBuilder(null);
}

class _$ContactDbBuilder implements $ContactDbBuilderContract {
  _$ContactDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $ContactDbBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $ContactDbBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<ContactDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ContactDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ContactDb extends ContactDb {
  _$ContactDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ContactDao? _contactDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `contact_tbl` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `phoneNumber` TEXT NOT NULL, `email` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ContactDao get contactDao {
    return _contactDaoInstance ??= _$ContactDao(database, changeListener);
  }
}

class _$ContactDao extends ContactDao {
  _$ContactDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _contactInsertionAdapter = InsertionAdapter(
            database,
            'contact_tbl',
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email
                },
            changeListener),
        _contactUpdateAdapter = UpdateAdapter(
            database,
            'contact_tbl',
            ['id'],
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email
                },
            changeListener),
        _contactDeletionAdapter = DeletionAdapter(
            database,
            'contact_tbl',
            ['id'],
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Contact> _contactInsertionAdapter;

  final UpdateAdapter<Contact> _contactUpdateAdapter;

  final DeletionAdapter<Contact> _contactDeletionAdapter;

  @override
  Stream<List<Contact>> getAllContact() {
    return _queryAdapter.queryListStream('select * from contact_tbl',
        mapper: (Map<String, Object?> row) => Contact(
            name: row['name'] as String,
            phoneNumber: row['phoneNumber'] as String,
            email: row['email'] as String,
            id: row['id'] as int?),
        queryableName: 'contact_tbl',
        isView: false);
  }

  @override
  Future<void> addContact(Contact contact) async {
    await _contactInsertionAdapter.insert(contact, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateContact(Contact contact) async {
    await _contactUpdateAdapter.update(contact, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteContact(Contact contact) async {
    await _contactDeletionAdapter.delete(contact);
  }
}
