import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/core/strings/font_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/height_manager.dart';

class OnBoardingNavBar extends StatelessWidget {
  const OnBoardingNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primary,
      height: HeightManager.h39,
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingManager.p12,
        vertical: PaddingManager.p10,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "تخطي",
              style: TextStyle(
                fontFamily: FontManager.geDinerOne,
                color: Colors.white,
                fontSize: 15,
                fontWeight: .w500,
              ),
            ),
          ),
          Text("data"),
          TextButton(
            onPressed: () {},
            child: const Text(
              "التالي",
              style: TextStyle(
                fontFamily: FontManager.geDinerOne,
                color: Colors.white,
                fontSize: 15,
                fontWeight: .w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
