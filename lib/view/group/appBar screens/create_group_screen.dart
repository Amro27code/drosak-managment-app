import 'package:drosak_managment_app/core/numbers/font_size_manager.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/core/strings/font_manager.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';

import '../../../controller/mainScreens/add_new_group_controller.dart';
import '../widget/custom_app_bar_new_group.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  late AddNewGroupController _addNewGroupController;

  @override
  void initState() {
    super.initState();
    _addNewGroupController = AddNewGroupController(context);
  }

  @override
  Widget build(BuildContext context) {
    _addNewGroupController.getArgsFromBackScreen();
    return Scaffold(
      appBar: CustomAppBarAddNewGroup(
        // addNewGroupController: _addNewGroupController,
        textTitle: _addNewGroupController.status,
      ),
    );
  }
}
