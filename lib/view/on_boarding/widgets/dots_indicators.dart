import 'package:dots_indicator/dots_indicator.dart';
import 'package:drosak_managment_app/core/constant%20values/constant_values.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class DotsIndicatorsWidget extends StatelessWidget {
  const DotsIndicatorsWidget({
    super.key,
    required this.currentIndex,
    required this.dotCount,
  });

  final int currentIndex;
  final int dotCount;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: .rtl,
      child: DotsIndicator(
        dotsCount: ConstListValues.onBoardingModel.length,
        position: currentIndex.toDouble(),
        decorator: DotsDecorator(
          activeColor: ColorManager.whiteColor,
          color: ColorManager.nonActiveIndicator,
        ),
      ),
    );
  }
}
