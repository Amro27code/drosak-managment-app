import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:flutter/cupertino.dart';

class GroupController {
  BuildContext context;

  GroupController(this.context) {
    init();
  }

  void init() {}

  void onTapAdd({required String appBarTitle}) {
    Navigator.pushNamed(
      context,
      RouteNames.addNewGroup,
      arguments: appBarTitle//{"appBarTitle": appBarTitle},
    );
  }
}
