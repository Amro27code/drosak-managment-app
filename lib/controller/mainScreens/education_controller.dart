import 'dart:async';

import 'package:drosak_managment_app/core/database/education_db.dart';
import 'package:drosak_managment_app/core/resources/assets_manager.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../view/education/widgets/add_education_sheet_widget.dart';

class EducationController {
  final BuildContext context;
  late List<EducationModel> educationList = [];

  String? pathImagePicker;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _descTextEditingController;
  late EducationOperations educationOperations;

  late StreamController<List<EducationModel>> _listEducationStreamController;
  late Sink<List<EducationModel>> _listEducationInputController;
  late Stream<List<EducationModel>> listEducationOutputController;

  EducationController({
    required this.context,
    required this.educationOperations,
  }) {
    init();
  }

  void initControllers() {
    _listEducationStreamController = StreamController();
    _listEducationInputController = _listEducationStreamController.sink;
    listEducationOutputController = _listEducationStreamController.stream;
    _listEducationInputController.add(educationList);
  }

  void initDispose() {
    _listEducationStreamController.close();
    _listEducationInputController.close();
  }

  Future<void> init() async {
    initControllers();
    _nameTextEditingController = TextEditingController();
    _descTextEditingController = TextEditingController();
    educationOperations = EducationOperations();

    educationList = await educationOperations.selectAllEducations();
    // await getAllEducations();
    print(educationList);
  }

  void onTapAdd() {
    addEducationSheetWidget(
      context: context,
      onSubmitted: onSubmittedAddEducation,
      hintText: StringManager.addBnb1Name,
      controller: _nameTextEditingController,
      textInButton: StringManager.add,
      onTapAddInSheet: addNewEducation,
      pathImage: pathImagePicker,
      descController: _descTextEditingController,
      hintTextDesc: StringManager.addBnb1Desc,
      onSubmittedDesc: (value) {},
      pickImageMethod: pickImageFromGallery,
    );
  }

  Future<void> pickImageMethod() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    print("ffffffffffffffffffffffffffff");
    print(image?.path);
    print(image);
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) pathImagePicker = image.path;
  }

  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  }

  void onSubmittedAddEducation(String value) {}

  Future<void> addNewEducation() async {
    EducationOperations educationOperations = EducationOperations();
    bool inserted = await educationOperations.insertEducation(
      EducationModel(
        title: _nameTextEditingController.text,
        subtitle: _descTextEditingController.text,
        imagePath: pathImagePicker == null ? "" : pathImagePicker!,
        id: 0,
      ),
    );
    // print(inserted);

    // listEducationInputController.add(educationList);
    getAllEducations();

    // Navigator.of(context).pop();
  }

  Future<void> getAllEducations() async {
    EducationOperations educationOperations = EducationOperations();

    educationList = await educationOperations.selectAllEducations();
    // educationListItems = items;
    _listEducationInputController.add(educationList);
  }

  void onTapSearch() {}
}
