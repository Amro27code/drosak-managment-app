import 'my_sqflite_database.dart';

class GroupOperations extends MySqfliteDatabase {
  Future<List<String>> selectEducationName() async {
    List<Map<String, Object?>> list = await selectWhere(
      tableName: MySqfliteDatabase.eduTable,
      columns: [MySqfliteDatabase.eduTitleColumn],
    );
    print(list);
    print("list;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
    List<String> namesEdu = list
        .map((e) => e[MySqfliteDatabase.eduTitleColumn] as String)
        .toList();
    print(namesEdu);
    return namesEdu;
  }
}
