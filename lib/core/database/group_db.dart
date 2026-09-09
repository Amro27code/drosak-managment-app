import 'package:drosak_managment_app/model/group/group_model.dart';

import 'my_sqflite_database.dart';

class GroupOperations extends MySqfliteDatabase {
  Future<List<GroupModel>> selectGroups() async {
    List<Map<String, Object?>> list = await selectWithStatus(
      query:
          "SELECT ${MySqfliteDatabase.groupTable}.*"
          " FROM ${MySqfliteDatabase.eduTable},${MySqfliteDatabase.groupTable} "
          "WHERE "
          "${MySqfliteDatabase.eduTable}.${MySqfliteDatabase.statusColumn}=1 "
          " AND "
          "${MySqfliteDatabase.eduTable}.${MySqfliteDatabase.eduIdColumn}=${MySqfliteDatabase.groupTable}.${MySqfliteDatabase.groupEduFKColumn}"
          ";", //!! الشرط بعد ال and هذا عشان ما يرجع النتائج مكررة على حسب عدد ال edu
    );
    List<GroupModel> groups = list
        .map(
          (e) => GroupModel.fromJson(e),
        ) //? e[MySqfliteDatabase.eduTitleColumn] as String
        .toList();
    return groups;
  }

  Future<List<GroupModel>> selectNameGroups(String query) async {
    List<Map<String, Object?>> list = await selectWhere(
      tableName: MySqfliteDatabase.groupTable,
      where: "${MySqfliteDatabase.groupNameColumn} LIKE ?",
      whereArgs: ['%$query%'],
    );
    List<GroupModel> groups = list
        .map(
          (e) => GroupModel.fromJson(e),
        ) //? e[MySqfliteDatabase.eduTitleColumn] as String
        .toList();
    return groups;
  }
  Future<int> insertToGroupTable(GroupModel groupModel) {
    return insert(
      values: groupModel.toJson(),
      tableName: MySqfliteDatabase.groupTable,
    );
  }

  Future<bool> updateGroupTable(GroupModel groupModel) {
    return update(
      tableName: MySqfliteDatabase.groupTable,
      where: "${MySqfliteDatabase.groupIdColumn}=${groupModel.id}",
      values: groupModel.toJson(),
    );
  }

  Future<bool> deleteFromGroupTable(GroupModel groupModel) {
    return delete(
      where: "${MySqfliteDatabase.groupIdColumn}=${groupModel.id}",
      tableName: MySqfliteDatabase.groupTable,
    );
  }
}
