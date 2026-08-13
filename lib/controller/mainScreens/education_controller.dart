import 'package:drosak_managment_app/core/resources/assets_manager.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:flutter/material.dart';

import '../../view/education/widgets/add_education_sheet_widget.dart';

class EducationController {
  final BuildContext context;
  List<EducationModel> educationList = [
    EducationModel(
      id: 1,
      imagePath: AssetsValueManager.onb3,
      title: "الصف الأول الإعدادي",
      subtitle:
          "تلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلا",
    ),
    EducationModel(
      id: 2,
      imagePath: AssetsValueManager.onb3,
      title: "الصف الثاني الإعدادي",
      subtitle:
          "تلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلا",
    ),
  ];
  late TextEditingController _textEditingController;

  EducationController({required this.context}) {
    _textEditingController = TextEditingController();
  }

  void onTapAdd() {
    addEducationSheetWidget(
      context: context,
      onSubmitted: onSubmittedAddEducation,
      hintText: StringManager.addBnb1Name,
      controller: _textEditingController,
      textInButton: StringManager.add,
      onTapAddInSheet: onTapAddInSheet,
    );
  }

  void onSubmittedAddEducation(String value) {}

  void onTapAddInSheet() {
    Navigator.of(context).pop();
  }

  void onTapSearch() {}
}
