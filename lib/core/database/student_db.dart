import 'dart:developer';
import 'package:drosak_managment_app/core/database/my_sqflite_database.dart';
import 'package:drosak_managment_app/model/group/time_of_day_model.dart';
import 'package:drosak_managment_app/model/students/student_model.dart';

class StudentOperation extends MySqfliteDatabase {
  Future<int> insertNewStudent(StudentModel studentModel) async {
    print(studentModel);
    return insert(
      values: studentModel.toJson(),
      tableName: MySqfliteDatabase.studentTable,
    );
  }

  Future<List<StudentModel>> selectAllStudent() async {
    List<StudentModel> students = [];
    List<Map<String, Object?>> a = await selectWithStatus(
      //?
      query:
          "SELECT ${MySqfliteDatabase.studentTable}.* ,${MySqfliteDatabase.groupTable}.${MySqfliteDatabase.groupNameColumn} ,${MySqfliteDatabase.eduTable}.${MySqfliteDatabase.eduTitleColumn},${MySqfliteDatabase.eduTable}.${MySqfliteDatabase.eduIdColumn}  "
          " FROM ${MySqfliteDatabase.studentTable}"
          " INNER JOIN ${MySqfliteDatabase.groupTable}"
          " ON ${MySqfliteDatabase.groupTable}.${MySqfliteDatabase.groupIdColumn}=${MySqfliteDatabase.studentTable}.${MySqfliteDatabase.studentGroupFKColumn}"
          " INNER JOIN ${MySqfliteDatabase.eduTable}"
          " ON ${MySqfliteDatabase.groupTable}.${MySqfliteDatabase.groupEduFKColumn}=${MySqfliteDatabase.eduTable}.${MySqfliteDatabase.eduIdColumn}",
    );

    Map<String, List<AppointmentModel>> myMap = {}; //?

    for (int i = 0; i < a.length; i++) {
      String groupId = a[i]['groupIDFK'].toString(); //?
      if (!myMap.containsKey(groupId)) {
        StudentOperation studentOperation = StudentOperation();
        List<AppointmentModel> x = await studentOperation.getAllAppointments(
          groupId.toString(),
        );
        myMap[groupId] = x; //?
        log(x.toString());
        log("------------------------------");
      }
    }
    log(myMap.toString());

    students += a
        .map(
          (Map<String, Object?> element) => StudentModel.fromJson(
            element,
            myMap[element[MySqfliteDatabase.studentGroupFKColumn]
                    .toString()] //element[MySqfliteDatabase.studentGroupFKColumn]
                as List<AppointmentModel>,
          ),
        )
        .toList();
    log("Students List:=> $students");
    return students;
  }

  Future<List<AppointmentModel>> getAllAppointments(String id) async {
    List<AppointmentModel> listAppointment = [];
    List<Map<String, Object?>> a = await selectWithStatus(
      query:
          "SELECT ${MySqfliteDatabase.appointmentTable}.* "
          "FROM ${MySqfliteDatabase.appointmentTable} "
          "WHERE ${MySqfliteDatabase.appointmentTable}.${MySqfliteDatabase.appointmentGroupFKColumn}=$id",
    );
    listAppointment += a.map((e) => AppointmentModel.fromJson(e)).toList();
    return listAppointment;
  }

  Future<bool> deleteStudent(int id) async {
    return await delete(
      tableName: MySqfliteDatabase.studentTable,
      where: "${MySqfliteDatabase.studentIdColumn}=$id",
    );
  }
}
