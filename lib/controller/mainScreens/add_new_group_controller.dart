import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';

import '../../model/education/education_model.dart';

class AddNewGroupController {
  BuildContext context;

  late TextEditingController nameEditingController;
  late TextEditingController descEditingController;
  late GlobalKey<FormState> nameKey;
  List<EducationModel> listEducationModel = [];

  AddNewGroupController(this.context) {
    nameEditingController = TextEditingController();
    descEditingController = TextEditingController();
    nameKey = GlobalKey<FormState>();
  }

  // Map<String, Object?> args = {};
  void onChanged(EducationModel? educationModel) {}

  late String status = StringManager.addNewGroup;

  void getArgsFromBackScreen() {
    var arg = ModalRoute.of(context);
    if (arg != null) {
      String argument = arg.settings.arguments.toString();
      status = argument;
    }
  }
}
