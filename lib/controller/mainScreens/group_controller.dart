import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:flutter/cupertino.dart';

class GroupController {
  BuildContext context;
  late TextEditingController nameGroupEditingController;
  late TextEditingController descGroupEditingController;

  GroupController(this.context) {
    init();
  }

  void init() {
    nameGroupEditingController = TextEditingController();
    descGroupEditingController = TextEditingController();
  }

  void onTapAdd({required String appBarTitle}) {
    Navigator.pushNamed(
      context,
      RouteNames.addNewGroup,
      arguments: appBarTitle, //{"appBarTitle": appBarTitle},
    );
  }
}
