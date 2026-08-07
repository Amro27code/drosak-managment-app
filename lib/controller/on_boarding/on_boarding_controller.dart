import 'dart:async';
import 'package:drosak_managment_app/core/constant%20values/constant_values.dart';
import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingController {
  late PageController pageController;
  // late StreamController<int> _indicatorStreamController;
  // late Sink<int> _inputIndicator;
  // late Stream<int> outputIndicator;

  late StreamController<int> _onPageChangedStreamController;
  late Sink<int> _inputsOnPageChanged;
  late Stream<int> outputOnPageChanged;

  final BuildContext _context;

  int currentIndex = 0;
  int count = ConstListValues.onBoardingModel.length;

  OnBoardingController({required this._context}) {
    initController();
  }

  void initController() {
    pageController = PageController(initialPage: 0);

    // _indicatorStreamController = StreamController();
    // _inputIndicator = _indicatorStreamController.sink;
    // outputIndicator = _indicatorStreamController.stream;

    _onPageChangedStreamController = StreamController();
    _inputsOnPageChanged = _onPageChangedStreamController.sink;
    outputOnPageChanged = _onPageChangedStreamController.stream;
  }

  void onPageChange(int value) {
    currentIndex = value;
    _inputsOnPageChanged.add(currentIndex);
  }

  void goNext() {
    if (currentIndex >= count - 1) {
      navigatorToExploreScreen();
    } else {
      currentIndex++;

    }
    pageController.animateToPage(currentIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    _inputsOnPageChanged.add(currentIndex);
  }

  void navigatorToExploreScreen() {
    Navigator.of(
      _context,
    ).pushNamedAndRemoveUntil(RouteNames.explore, (route) => false);
  }

  void skip() {
    navigatorToExploreScreen();
  }

  void disposeController(){
    _inputsOnPageChanged.close();
    _onPageChangedStreamController.close();
  }
}
