import 'dart:async';
import 'dart:io';

import 'package:drosak_managment_app/core/database/education_db.dart';
import 'package:drosak_managment_app/core/database/my_sqflite_database.dart';
import 'package:drosak_managment_app/core/numbers/font_size_manager.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/core/strings/font_manager.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../view/education/search/search_delegate.dart';
import '../../view/education/widgets/add_education_sheet_widget.dart';

class EducationController {
  late final BuildContext context;
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    imageOutputController = _imageStreamController.stream.asBroadcastStream();

    _imageInputController.add(pathImagePicker);
    _listEducationInputController.add(educationList);
  }

  void initDispose() {
    _nameTextEditingController.dispose();
    _descTextEditingController.dispose();

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
    _imageInputController.add(pathImagePicker);
    _nameTextEditingController.clear();
    addEducationSheetWidget(
      context: context,

      onSubmitted: onSubmittedAddEducation,
      hintText: StringManager.addBnb1Name,
      nameController: _nameTextEditingController,
      textInButton: StringManager.add,
      onTapAddInSheet: () async {
        if (formKey.currentState == null) {
        } else if (formKey.currentState!.validate()) {
          bool inserted = await addNewEducation();
          if (inserted) {
            Navigator.pop(context);
            educationList.add(
              EducationModel(
                imagePath: pathImagePicker, //== null ? "" : pathImagePicker!,
                title: _nameTextEditingController.text,
                subtitle: _descTextEditingController.text,
                id: educationList.length + 1,
              ),
            );
            _listEducationInputController.add(educationList);

            _nameTextEditingController.clear();
            _descTextEditingController.clear();
            pathImagePicker = null;
            _imageInputController.add(pathImagePicker);
          }
        }
      },
      imageStream: imageOutputController,
      onDeleteImage: onDeleteImage,
      descController: _descTextEditingController,
      hintTextDesc: StringManager.addBnb1Desc,
      onSubmittedDesc: (value) {},
      pickImageMethod: () {
        pickImageMethod();
      },
      formKey: formKey,
    );
  }

  void onDeleteImage() {
    pathImagePicker = null;
    _imageInputController.add(pathImagePicker);
  }

  void pickImageMethod() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context1) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              IconButton.filled(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  foregroundColor: Colors.white,
                  iconSize: 40,
                ),
                onPressed: () {
                  pickImage(imageSource: .camera);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.camera_alt_outlined),
              ),
              IconButton.filled(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  foregroundColor: Colors.white,
                  iconSize: 40,
                ),
                onPressed: () {
                  pickImage(imageSource: .gallery);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.image),
              ),
            ],
          ),
          icon: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              IconButton.filled(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  iconSize: 10,
                ),
                onPressed: () {
                  Navigator.pop(context1);
                },
                icon: Icon(Icons.close),
              ),
              Text(
                "اختر من...",
                style: TextStyle(
                  fontWeight: .w900,
                  fontSize: FontSizeManager.s15,
                  fontFamily: FontManager.geDinerOne,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> saveImageOfMyApp(XFile image) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathDirectory = directory.path;
    final imagePathDirectory = "$pathDirectory/${image.name}";
    File fileImage = await File(image.path).copy(imagePathDirectory);
    pathImagePicker = fileImage.path;
  }

  Future<void> pickImage({required ImageSource imageSource}) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      pathImagePicker = image.path;
      saveImageOfMyApp(image);
    }
    _imageInputController.add(pathImagePicker);
  }

  void onSubmittedAddEducation(String value) {}

  Future<bool> addNewEducation() async {
    EducationOperations educationOperations = EducationOperations();
    bool inserted = await educationOperations.insertEducation(
      EducationModel(
        title: _nameTextEditingController.text,
        subtitle: _descTextEditingController.text,
        imagePath: pathImagePicker == null ? "" : pathImagePicker!,
        id: 0,
      ),
    );
    // listEducationInputController.add(educationList);
    getAllEducations();
    return inserted;
    // Navigator.of(context).pop();
  }

  Future<void> getAllEducations() async {
    EducationOperations educationOperations = EducationOperations();

    educationList = await educationOperations.selectAllEducations();
    // educationListItems = items;
    _listEducationInputController.add(educationList);
  }

  void onTapSearch() {
    showSearch(context: context, delegate: EducationSearchDelegate());
  }

  Future<void> deleteEducationFun(EducationModel educationModel) async {
    //startToEnd --delete || endToStart --update
    EducationOperations educationOperations = EducationOperations();

    await educationOperations.softDelete(educationModel);

    getAllEducations();
    // _listEducationInputController.add(educationList);
  }

  Future<void> updateEducationFun(EducationModel educationModel) async {
    await educationOperations.deleteEducation(educationModel);
    getAllEducations();
  }
}
