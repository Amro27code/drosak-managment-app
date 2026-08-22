import 'package:drosak_managment_app/core/database/crud.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart' show join;

class MySqfliteDatabase extends CRUD {
  static const String eduTable = "Education";
  static const String eduIdColumn = "educationId";
  static const String eduTitleColumn = "educationTitle";
  static const String eduSubTitleColumn = "educationSubtitle";
  static const String eduImageColumn = "educationImagePath";
  static const String dateCreatedColumn = "dateCreated";
  static const String statusColumn = "status";

  //!===================Groups=======================
  static const String groupTable = "group";
  static const String groupIdColumn = "groupId";
  static const String groupNameColumn = "groupName";
  static const String groupNoteColumn = "groupNote";
  static const String groupImageColumn = "groupImagePath";
  static const String groupEduFKColumn = "educationID";

  //?===================Appointment=======================
  static const String appointmentTable = "appointment";
  static const String appointmentIdColumn = "appointmentId";
  static const String appointmentDayColumn = "appointmentDay";
  static const String appointmentTimeColumn = "appointmentTime";
  static const String appointmentPMorAMColumn = "appointmentPMorAM";
  static const String appointmentGroupFKColumn = "groupID";

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

      onUpgrade: (db, oldVersion, newVersion) async {

        await db.execute("DROP TABLE IF EXISTS $eduTable");
        //* ==================== create education table==============
        await db.execute(
          "CREATE TABLE IF NOT EXISTS $eduTable"
              " ($eduIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,"
              "$eduTitleColumn TEXT,"
              "$eduSubTitleColumn TEXT,"
              "$statusColumn INTEGER DEFAULT 1 CHECK ($statusColumn IN (0,1)),"
              "$dateCreatedColumn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
              "$eduImageColumn TEXT"
              ");",
        );
        //! ==================== create group table==============
        await db.execute(
          "CREATE TABLE IF NOT EXISTS $groupTable"
              " ($groupIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,"
              "$groupNameColumn TEXT,"
              "$groupImageColumn TEXT,"
              "$groupNoteColumn TEXT,"
              "CONSTRAINT group_education FOREIGN KEY ($groupEduFKColumn) REFERENCES $eduTable ($eduIdColumn) ON DELETE CASCADE ON UPDATE CASCADE,"
              ");",
        );
        //? ==================== create Appointment table==============

        await db.execute(
          "CREATE TABLE IF NOT EXISTS $appointmentTable"
              " ($appointmentIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,"
              "$appointmentDayColumn TEXT,"
              "$appointmentTimeColumn TEXT,"
              "$appointmentPMorAMColumn TEXT,"
              "CONSTRAINT appointment_group FOREIGN KEY ($appointmentGroupFKColumn) REFERENCES $groupTable ($groupIdColumn) ON DELETE CASCADE ON UPDATE CASCADE,"
              ");",
        );
        print(db);
        print(oldVersion);
        print(newVersion);
      },
      onCreate: _onCreate,
    );
    return _database!;
  }

  Future<void> _onCreate(sqflite.Database db, int version) async {
    //* ==================== create education table==============
    await db.execute(
      "CREATE TABLE IF NOT EXISTS $eduTable"
      " ($eduIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$eduTitleColumn TEXT,"
      "$eduSubTitleColumn TEXT,"
      "$statusColumn INTEGER DEFAULT 1 CHECK ($statusColumn IN (0,1)),"
      "$dateCreatedColumn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
      "$eduImageColumn TEXT"
      ");",
    );
    //! ==================== create group table==============
    await db.execute(
      "CREATE TABLE IF NOT EXISTS $groupTable"
      " ($groupIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$groupNameColumn TEXT,"
      "$groupImageColumn TEXT,"
      "$groupNoteColumn TEXT,"
      "CONSTRAINT group_education FOREIGN KEY ($groupEduFKColumn) REFERENCES $eduTable ($eduIdColumn) ON DELETE CASCADE ON UPDATE CASCADE,"
      ");",
    );
    //? ==================== create Appointment table==============

    await db.execute(
      "CREATE TABLE IF NOT EXISTS $appointmentTable"
      " ($appointmentIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$appointmentDayColumn TEXT,"
      "$appointmentTimeColumn TEXT,"
      "$appointmentPMorAMColumn TEXT,"
      "CONSTRAINT appointment_group FOREIGN KEY ($appointmentGroupFKColumn) REFERENCES $groupTable ($groupIdColumn) ON DELETE CASCADE ON UPDATE CASCADE,"
      ");"
    );
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
    print("After initDataBase-------");
    int inserted = await _database!.insert(tableName, values);
    print("After insertDataBase-------");

    await _database!.close();
    return inserted == 0 ? false : true;
  }

  @override
  Future<List<Map<String, Object?>>> select({
    required String tableName,
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await initDatabase();

    List<Map<String, Object?>> data = await _database!.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    await _database!.close();
    return data;
  }

  @override
  Future<List<Map<String, Object?>>> selectWhere({
    required String tableName,
    String query = "",
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await initDatabase();

    List<Map<String, Object?>> data = await _database!.query(
      tableName,
      where: where, //"$eduTitleColumn LIKE ? AND $statusColumn==?",
      whereArgs: whereArgs, //['%$query%', '1'],
    );
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

    int updated = await _database!.update(tableName, values, where: where);
    await _database!.close();
    return updated == 0 ? false : true;
  }
}
