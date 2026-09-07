import 'package:drosak_managment_app/core/database/my_sqflite_database.dart';
import 'package:drosak_managment_app/model/group/group_model.dart';
import 'package:drosak_managment_app/model/group/time_of_day_model.dart';

class AppointmentOperations extends MySqfliteDatabase {
  Future<List<AppointmentModel>> selectFromAppointment() async {
    List<AppointmentModel> list = [];

    List<Map<String, Object?>> data = await selectWhere(
      tableName: MySqfliteDatabase.appointmentTable,
    );
    list += data.map((item) => AppointmentModel.fromJson(item)).toList();

    return list;
  }


  Future<List<AppointmentModel>> selectAppointmentForGroup({
    required int groupId,
  }) async {
    List<AppointmentModel> list = [];

    List<Map<String, Object?>> data = await selectWhere(
      tableName: MySqfliteDatabase.appointmentTable,
      // where: "${MySqfliteDatabase.appointmentGroupFKColumn} = ?",
      // whereArgs: [groupId],
    );
    list += data.map((item) => AppointmentModel.fromJson(item)).toList();
print(list);
    return list;
  }

  Future<int> insertToAppointmentTable(AppointmentModel model,int groupId) async {
    return await insert(
      values: model.toJson(groupId),
      tableName: MySqfliteDatabase.appointmentTable,
    );
  }

  Future<bool> deleteFromAppointmentTable(AppointmentModel model) {
    return delete(
      where: "${MySqfliteDatabase.appointmentIdColumn}==${model.appointmentId}",
      tableName: MySqfliteDatabase.appointmentTable,
    );
  }
  Future<bool> deleteAllAppointmentForGroup(GroupModel g) {
    return delete(
      where: "${MySqfliteDatabase.appointmentGroupFKColumn}==${g.id}",
      tableName: MySqfliteDatabase.appointmentTable,
    );
  }
}
