import 'dart:async';

import 'package:drosak_managment_app/core/database/education_db.dart';
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

  late StreamController<String?> _imageStreamController;
  late Sink<String?> _imageInputController;
  late Stream<String?> imageOutputController;

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

    _imageStreamController = StreamController();
    _imageInputController = _imageStreamController.sink;
    imageOutputController = _imageStreamController.stream;

    _imageInputController.add(pathImagePicker);
    _listEducationInputController.add(educationList);
  }

  void initDispose() {
    _listEducationStreamController.close();
    _listEducationInputController.close();

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
      ImageStream: imageOutputController,
      onDeleteImage: onDeleteImage,
      descController: _descTextEditingController,
      hintTextDesc: StringManager.addBnb1Desc,
      onSubmittedDesc: (value) {},
      pickImageMethod: pickImageFromGallery,
    );
  }

  void onDeleteImage() {
    pathImagePicker = null;
    _imageInputController.add(pathImagePicker);
  }

  Future<void> pickImageMethod() async {
    // final picker = ImagePicker();
    // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) pathImagePicker = image.path;
    _imageInputController.add(pathImagePicker);
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
