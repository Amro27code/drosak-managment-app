import 'package:dots_indicator/dots_indicator.dart';
import 'package:drosak_managment_app/core/constant%20values/constant_values.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class DotsIndicatorsWidget extends StatelessWidget {
  const DotsIndicatorsWidget({
    super.key,
    required this.dotCount, required this.positionStream,
  });

  final int dotCount;
  final Stream<int> positionStream;


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: .rtl,
      child: StreamBuilder(
        stream: positionStream,
        builder: (context, snapshot) {
          return DotsIndicator(
            dotsCount: ConstListValues.onBoardingModel.length,
            position: (snapshot.data??0).toDouble(),
            onTap: (position) {

            },
            decorator: DotsDecorator(
              activeColor: ColorManager.whiteColor,
              color: ColorManager.nonActiveIndicator,
            ),
          );
        }
      ),
    );
  }
}
