import 'package:drosak_managment_app/controller/mainScreens/education_controller.dart';
import 'package:drosak_managment_app/core/database/education_db.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';
import '../../main/widget/custom_app_bar.dart';
import '../body/education_body.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  late EducationController _educationController;

  @override
  void initState() {
    super.initState();
    _educationController = EducationController(
      context: context,
      educationOperations: EducationOperations(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: StringManager.bnb1,
        onTapSearch: _educationController.onTapSearch,
        onTapAdd: _educationController.onTapAdd,

      ),

      body: EducationBody(
        futureFunction: _educationController.getAllEducations(),
        educationList: _educationController.educationList,
      ),
    );
  }
}
