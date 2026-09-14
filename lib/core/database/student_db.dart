import 'package:drosak_managment_app/core/database/my_sqflite_database.dart';
import 'package:drosak_managment_app/model/students/student_model.dart';

class StudentOperation extends MySqfliteDatabase {
  Future<int> insertNewStudent(StudentModel studentModel) async {
    print(studentModel);
    return insert(
      values: studentModel.toJson(),
      tableName: MySqfliteDatabase.studentTable,
    );
  }
}
