import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';

class AddNewGroupController {
  BuildContext context;

  AddNewGroupController(this.context);

  // Map<String, Object?> args = {};

 late String status = StringManager.addNewGroup;

  void getArgsFromBackScreen() {
    var arg = ModalRoute.of(context);
    if (arg != null) {
      String argument = arg.settings.arguments.toString();
      status=argument;
    }
  }
}
