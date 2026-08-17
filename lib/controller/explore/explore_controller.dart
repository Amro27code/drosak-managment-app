import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../core/strings/string_manager.dart';

class ExploreController {
  void goToMainScreen({required BuildContext context, required int index}) {
    // MainScreenController.currentIndexBnbInput.add(arg["index"]);
    // print(arg["index"]);
    Navigator.of(
      context,
    ).pushNamed(RouteNames.main, arguments: {StringManager.indexScreen: index});
  }
}
