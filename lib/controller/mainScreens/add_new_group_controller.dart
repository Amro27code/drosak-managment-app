import 'dart:async';

import 'package:drosak_managment_app/core/database/group_db.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/group/group_model.dart';
import 'package:flutter/material.dart';

import '../../model/education/education_model.dart';

class AddNewGroupController {
  BuildContext context;

  List<GroupModel> listGroupModel = [
    GroupModel(
      id: 1,
      educationFKId: 1,
      name: "name",
      imagePath: "imagePath",
      time: "2",
      day: StringManager.days[0],
      tPMorAM: "ص",
    ),
    GroupModel(
      id: 1,
      educationFKId: 1,
      name: "name",
      imagePath: "imagePath",
      time: "2",
      day: StringManager.days[0],
      tPMorAM: "ص",
    ),
    GroupModel(
      id: 1,
      educationFKId: 1,
      name: "name",
      imagePath: "imagePath",
      time: "2",
      day: StringManager.days[0],
      tPMorAM: "ص",
    ),
  ];
  late TextEditingController nameEditingController;
  late TextEditingController descEditingController;
  late GlobalKey<FormState> nameKey;
  List<String> listNameEducations = [];
  String? timeGroup;
  String? groupValueRadio = StringManager.am;
  late StreamController<String?> _radioButtonStreamController;
  late Sink<String?> _inputRadioButton;
  late Stream<String?> outputRadioButton;

  AddNewGroupController(this.context) {
    nameEditingController = TextEditingController();
    descEditingController = TextEditingController();

    _radioButtonStreamController = StreamController();
    _inputRadioButton = _radioButtonStreamController.sink;
    outputRadioButton = _radioButtonStreamController.stream;

    _inputRadioButton.add(groupValueRadio);

    nameKey = GlobalKey<FormState>();
    // init();
    getAllEduNames(); //!   StreamController
  }

  void init() async {
    //??????????????????????????????????

    getAllEduNames(); //!   StreamController
  }

  Future<void> getAllEduNames() async {
    GroupOperations groupOperations = GroupOperations();

    listNameEducations = await groupOperations.selectEducationName();
  }

  void onChangedEducationStage(String? value) {}

  late String status = StringManager.addNewGroup;

  void getArgsFromBackScreen() {
    var arg = ModalRoute.of(context);
    if (arg != null) {
      String argument = arg.settings.arguments.toString();
      status = argument;
    }
  }

  void onChangedRadio(String? value) {
    groupValueRadio=value;
    _inputRadioButton.add(groupValueRadio);
  }

}
