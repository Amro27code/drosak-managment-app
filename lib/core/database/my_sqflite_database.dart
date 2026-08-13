import 'package:drosak_managment_app/core/database/crud.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart' show join;

class MySqfliteDatabase extends CRUD {
  final String _eduTable = "Education";
  final String _eduIdColumn = "educationId";
  final String _eduTitleColumn = "educationTitle";
  final String _eduSubTitleColumn = "educationSubtitle";
  final String _eduImageColumn = "educationImagePath";

  sqflite.Database? _database;

  Future<sqflite.Database> initDatabase() async {
    String path = await sqflite.getDatabasesPath();

    String drosakDatabaseName = "drosak.db";
    String myPath = join(path, drosakDatabaseName);

    int version = 1;
    _database ??= await sqflite.openDatabase(
      myPath,
      version: version,
      onOpen: (db) async => await db.execute("PRAGMA foreign_keys = ON"),
      onUpgrade: (db, oldVersion, newVersion) {
        print(db);
        print(oldVersion);
        print(newVersion);
      },
      onCreate: _onCreate,
    );
    return _database!;
  }

  Future<void> _onCreate(sqflite.Database db, int version) async {
    await db.execute(
      "CREATE TABLE IF NOT EXISTS $_eduTable"
      " ($_eduIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$_eduTitleColumn TEXT,"
      "$_eduSubTitleColumn TEXT,"
      "$_eduImageColumn TEXT"
      ");",
    );
    // await db.execute(
    //   "CREATE TABLE IF NOT EXISTS $_productTable ($_productIdColumn INTEGER PRIMARY KEY AUTOINCREMENT ,$_productNameColumn TEXT,$_productPriceColumn REAL,$_productCountColumn INTEGER);",
    // );
    // await db.execute(
    //   "CREATE TABLE IF NOT EXISTS $_salesTable"
    //   " ($_salesIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,"
    //   "$_salesUserIDColumn INTEGER,"
    //   "$_salesProductIDColumn INTEGER,"
    //   "CONSTRAINT user_relations FOREIGN KEY ($_salesUserIDColumn) REFERENCES $_userTable ($_userIdColumn) ON DELETE CASCADE ON UPDATE CASCADE,"
    //   "CONSTRAINT product_relations FOREIGN KEY ($_salesProductIDColumn) REFERENCES $_productTable ($_productIdColumn) ON DELETE CASCADE ON UPDATE CASCADE"
    //   ");",
    // );
  }

  @override
  Future<bool> delete({required String tableName, required where}) async {
    await initDatabase();

    int deleted = await _database!.delete(tableName, where: where);
    await _database!.close();

    return deleted == 0 ? false : true;
  }

  @override
  Future<bool> insert({
    required Map<String, Object?> values,
    required String tableName,
  }) async {
    await initDatabase();

    int inserted = await _database!.insert(tableName, values);
    await _database!.close();
    return inserted == 0 ? false : true;
  }

  @override
  Future<List<Map<String, Object?>>> select({required String tableName}) async {
    await initDatabase();

    List<Map<String, Object?>> data = await _database!.query(tableName);
    await _database!.close();
    return data;
  }

  @override
  Future<bool> update({
    required Map<String, Object?> values,
    required String tableName,
    required String where,
  }) async {
    await initDatabase();

    int updated = await _database!.update(
      tableName,
      //     {
      //   _userNameColumn: userName,
      // },
      values,
      where: where,
    );
    await _database!.close();
    return updated == 0 ? false : true;
  }
}
