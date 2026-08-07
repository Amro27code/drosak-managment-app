import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/view/on_boarding/widgets/text_onb.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/height_manager.dart';
import '../widgets/dots_indicators.dart';

class OnBoardingNavBar extends StatelessWidget {
  const OnBoardingNavBar({
    super.key,
    required this.dotCount,
    required this.onTapNext,
    required this.positionStream,
    required this.onTapSkip,
  });

  final int dotCount;
  final Stream<int> positionStream;

  final VoidCallback onTapNext;
  final VoidCallback onTapSkip;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorManager.primary,
        height: HeightManager.h39,
        // padding: const EdgeInsets.symmetric(
        //   horizontal: PaddingManager.p12,
        //   vertical: PaddingManager.p10,
        // ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            TextButton(
              onPressed: onTapSkip,
              child: textOnb(text: "تخطي"),
            ),
            DotsIndicatorsWidget(
              dotCount: dotCount,
              positionStream: positionStream,
            ),
            TextButton(
              onPressed: onTapNext,
              child: textOnb(text: "التالي"),
            ),
          ],
        ),
      ),
    );
  }
}
