import 'dart:async';

import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/bnb/bnb_model.dart';
import 'package:drosak_managment_app/view/Attendance/screen/attendance.dart';
import 'package:drosak_managment_app/view/Audience/screen/audience.dart';
import 'package:drosak_managment_app/view/education/screen/education.dart';
import 'package:drosak_managment_app/view/group/screen/group.dart';
import 'package:drosak_managment_app/view/students/screen/students.dart';
import 'package:flutter/material.dart';

import '../../core/resources/assets_manager.dart';

class MainScreenController {
  static const List<BnbModel> bnbItems = [
    BnbModel(
      imagePath: AssetsValueManager.bnb1,
      title: StringManager.bnb1,
      screen: Education(),
    ),
    BnbModel(
      imagePath: AssetsValueManager.bnb2,
      title: StringManager.bnb2,
      screen: Group(),
    ),
    BnbModel(
      imagePath: AssetsValueManager.bnb3,
      title: StringManager.bnb3,
      screen: Students(),
    ),
    BnbModel(
      imagePath: AssetsValueManager.bnb4,
      title: StringManager.bnb4,
      screen: Audience(),
    ),
    BnbModel(
      imagePath: AssetsValueManager.bnb5,
      title: StringManager.bnb5,
      screen: Attendance(),
    ),
  ];
  int currentIndex = 0;

  late StreamController<int> _currentIndexBnbStreamController;
  static late Sink<int> _currentIndexBnbInput;

  Sink<int> get currentIndexBnbInput => _currentIndexBnbInput;
  late Stream<int> _currentIndexBnbOutput;

  MainScreenController() {
    initController();
    // setCurrentIndex(index);
  }

  void getArguments(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(args[StringManager.indexScreen]);
    currentIndex = args[StringManager.indexScreen];
    currentIndexBnbInput.add(currentIndex);
  }

  void initController() {
    _currentIndexBnbStreamController = StreamController();
    _currentIndexBnbInput = _currentIndexBnbStreamController.sink;
    _currentIndexBnbOutput = _currentIndexBnbStreamController.stream
        .asBroadcastStream();
    _currentIndexBnbInput.add(currentIndex);
  }

  Stream<int> get currentIndexBnbOutput => _currentIndexBnbOutput;

  void onTapBnb(int value) {
    currentIndex = value;
    print("-------------------$currentIndex");
    _currentIndexBnbInput.add(currentIndex);
  }

  void disposeController() {
    _currentIndexBnbStreamController.close();
    _currentIndexBnbInput.close();
  }
}
