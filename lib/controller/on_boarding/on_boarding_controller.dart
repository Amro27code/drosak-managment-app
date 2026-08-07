import 'dart:async';
import 'package:drosak_managment_app/core/constant%20values/constant_values.dart';
import 'package:flutter/material.dart';

class OnBoardingController {
  late PageController pageController;
  late StreamController<int> _indicatorStreamController;
  late Sink<int> _inputIndicator;
  late Stream<int> outputIndicator;

  late StreamController<int> _onPageChangedStreamController;
  late Sink<int> _inputsOnPageChanged;
  late Stream<int> outputOnPageChanged;

  int currentIndex = 0;
  int count = ConstListValues.onBoardingModel.length;

  OnBoardingController() {
    initController();
  }

  void initController() {
    pageController = PageController(initialPage: 0);

    _indicatorStreamController = StreamController();
    _inputIndicator = _indicatorStreamController.sink;
    outputIndicator = _indicatorStreamController.stream;

    _onPageChangedStreamController = StreamController();
    _inputsOnPageChanged = _indicatorStreamController.sink;
    outputOnPageChanged = _indicatorStreamController.stream;
  }

  void onPageChange(int value) {
    // pageController.jumpToPage(value);
    currentIndex = value;
    _inputsOnPageChanged.add(currentIndex);
    print(value);
  }

  void goNext() {
    if (currentIndex >= count - 1) {
      currentIndex = 0;
      pageController.jumpToPage(currentIndex); //Replace this to Navi
    } else {
      currentIndex++;
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }

    _inputsOnPageChanged.add(currentIndex);
  }

  void skip() {}
}
