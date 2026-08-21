import 'package:drosak_managment_app/controller/mainScreens/group_controller.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/core/resources/widgets/appBarWidget/custom_app_bar.dart';
import 'package:drosak_managment_app/view/group/body/body_group_screen.dart';

import 'package:flutter/material.dart';
import '../../../model/education/education_model.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  late GroupController _groupController;

  @override
  void initState() {
    super.initState();
    _groupController = GroupController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      appBar: CustomAppBar(
        title: StringManager.bnb2,
        onTapSearch: () {},
        onTapAdd: () {},
      ),
      body: BodyGroupScreen(
        // stream: null,
        onDismissedDeleteFun: (EducationModel educationModel) {},
        onDismissedUpdateFun: (EducationModel educationModel) {},
        onRefresh: () async {},
      ),
    );
  }
}
