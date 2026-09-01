import 'package:drosak_managment_app/model/group/group_model.dart';
import 'package:drosak_managment_app/model/group/time_of_day_model.dart';

import '../../model/group/fk_group_appointment.dart';
import 'appointment_db.dart';
import 'my_sqflite_database.dart';

class GroupOperations extends MySqfliteDatabase {
  Future<List<GroupModel>> selectGroups() async {
    List<Map<String, Object?>> list = await selectWhere(
      tableName: MySqfliteDatabase.groupTable,
    );
    List<GroupModel> groups = list
        .map(
          (e) => GroupModel.fromJson(e),
        ) //? e[MySqfliteDatabase.eduTitleColumn] as String
        .toList();
    return groups;
  }

  //! Future<List<FkGroupAppointment>> getAllData({
  //   required List<GroupModel> groupList,
  //   required List<AppointmentModel> appointmentList,
  // }) async {
  //   List<FkGroupAppointment> fkList = [];
  //   GroupOperations groupOperations = GroupOperations();
  //   groupList = await groupOperations.selectGroups();
  //
  //   appointmentList = await groupOperations.selectFromAppointment();
  //   for (GroupModel item in groupList) {
  //     List<AppointmentModel> listWhereAppointment = appointmentList
  //         .where((element) => element.groupIdFK == item.id)
  //         .toList();
  //     fkList.add(
  //       FkGroupAppointment(
  //         groupModel: item,
  //         appointments: listWhereAppointment,
  //       ),
  //     );
  //   }
  //   print(fkList);
  //   return fkList;
  //   // _inputGroupList.add(groupList);
  // }

  Future<int> insertToGroupTable(GroupModel groupModel) {
    return insert(
      values: groupModel.toJson(),
      tableName: MySqfliteDatabase.groupTable,
    );
  }

  Future<bool> deleteFromGroupTable(GroupModel groupModel) {
    return delete(
      where: "${MySqfliteDatabase.groupIdColumn}=${groupModel.id}",
      tableName: MySqfliteDatabase.groupTable,
    );
  }
}
