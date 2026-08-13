import 'package:drosak_managment_app/controller/mainScreens/education_controller.dart';
import 'package:drosak_managment_app/core/numbers/height_manager.dart';
import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/resources/widgets/space/vertical_space.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../body/education_body.dart';
import '../widgets/item_biulder_education.dart';

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
    _educationController = EducationController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      body: EducationBody(educationList: _educationController.educationList),
    );
  }
}
