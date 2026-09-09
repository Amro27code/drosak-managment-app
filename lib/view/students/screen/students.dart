import 'package:drosak_managment_app/controller/mainScreens/student_controller.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/view/students/body/body_student.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/widgets/appBarWidget/custom_app_bar.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  late StudentController _studentController;

  @override
  void initState() {
    super.initState();
    _studentController = StudentController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringManager.students,
        onTapSearch: () {},
        onTapAdd: () {},
      ),
      body: BodyStudent(
        onRefresh: () async {},
        studentListStream: _studentController.fkListOutput,
      ),
    );
  }
}
