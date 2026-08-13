import 'package:drosak_managment_app/core/database/education_db.dart';
import 'package:drosak_managment_app/core/resources/assets_manager.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:flutter/material.dart';

import '../../view/education/widgets/add_education_sheet_widget.dart';

class EducationController {
  final BuildContext context;
  late List<EducationModel> educationList = [
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
  late List<Map<String, Object?>> educationListItems = [];
  late TextEditingController _nameTextEditingController;
  late TextEditingController _descTextEditingController;
  late EducationOperations educationOperations;

  EducationController({
    required this.context,
    required this.educationOperations,
  }) {
    initController();
  }

  Future<void> initController() async {
    _nameTextEditingController = TextEditingController();
    _descTextEditingController = TextEditingController();
    educationOperations=EducationOperations();
    await getAllEducations();
    print(educationListItems);
  }

  void onTapAdd() {
    addEducationSheetWidget(
      context: context,
      onSubmitted: onSubmittedAddEducation,
      hintText: StringManager.addBnb1Name,
      controller: _nameTextEditingController,
      textInButton: StringManager.add,
      onTapAddInSheet: addNewEducation,
      descController: _descTextEditingController,
      hintTextDesc: StringManager.addBnb1Desc,
      onSubmittedDesc: (value) {},
    );
  }

  void onSubmittedAddEducation(String value) {}

  Future<void> addNewEducation() async {
    EducationOperations educationOperations=EducationOperations();
    bool inserted = await educationOperations.insertEducation(
      EducationModel(
        title: _nameTextEditingController.text,
        subtitle: _descTextEditingController.text,
        imagePath: AssetsValueManager.onb3,
        id: 0,
      ),
    );
    print(inserted);
    // Navigator.of(context).pop();
  }

  Future<void> getAllEducations() async {
    EducationOperations educationOperations=EducationOperations();

    List<Map<String, Object?>> items = await educationOperations
        .selectAllEducations();
    educationListItems = items;
    // Navigator.of(context).pop();
  }

  void onTapSearch() {}
}
