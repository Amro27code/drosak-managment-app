import 'dart:async';
import 'package:drosak_managment_app/core/database/student_db.dart';
import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/students/student_model.dart';
import 'package:flutter/widgets.dart';

class StudentController {
  late BuildContext _context;

  late StreamController<List<StudentModel>> _studentsListStreamController;
  late Stream<List<StudentModel>> outputStudentsList;

  late Sink<List<StudentModel>> _inputStudentsList;

  List<StudentModel> students = [];

  StudentController(BuildContext context) {
    _context = context;
    init();
    students = [];
  }

  Future<void> init() async {
    _studentsListStreamController = StreamController();
    _inputStudentsList = _studentsListStreamController.sink;
    outputStudentsList = _studentsListStreamController.stream;
    _inputStudentsList.add(students);
    // students += await getAllStudent();
    getAllStudent();
  }

  Future<void> getAllStudent() async {
    StudentOperation studentOperation = StudentOperation();
    students += await studentOperation.selectAllStudent();
    _inputStudentsList.add(students);
    print("في صفحة الطلاب");
    print(students);
  }

  void onTapAdd() {
    Navigator.pushNamed(
      _context,
      RouteNames.addNewStudent,
      arguments: StringManager.addNewStudent,
    ).then((value) async {
      await init();
      _inputStudentsList.add(students);
    });
  }

  Future<void> onRefresh() async {
    await init();
  }

  Future<void> deleteFun(int id) async {
    StudentOperation studentOperation = StudentOperation();
    bool x = await studentOperation.deleteStudent(id);
    if (x) {
      await getAllStudent();
    }
  }
}
