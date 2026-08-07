import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/view/on_boarding/widgets/text_onb.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/height_manager.dart';
import '../widgets/dots_indicators.dart';

class OnBoardingNavBar extends StatelessWidget {
  const OnBoardingNavBar({
    super.key,
    required this.currentIndex,
    required this.dotCount,
  });

  final int currentIndex;
  final int dotCount;

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
              onPressed: () {},
              child: textOnb(text: "تخطي"),
            ),
            DotsIndicatorsWidget(dotCount: dotCount, currentIndex: currentIndex),
            TextButton(
              onPressed: () {},
              child: textOnb(text: "التالي"),
            ),
          ],
        ),
      ),
    );
  }
}
