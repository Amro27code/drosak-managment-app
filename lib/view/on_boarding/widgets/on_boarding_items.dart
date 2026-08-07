import 'package:drosak_managment_app/core/resources/height_manager.dart';
import 'package:drosak_managment_app/core/strings/font_manager.dart';
import 'package:drosak_managment_app/model/on_boarding/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/resources/color_manager.dart';

class OnBoardingItems extends StatelessWidget {
  const OnBoardingItems({super.key, required this.onBoardingModel});

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: HeightManager.h60,
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          SvgPicture.asset(onBoardingModel.imagePath, height: 200),
          Text(
            onBoardingModel.title,
            textAlign: .center,
            style: TextStyle(
              fontFamily: FontManager.aaGalaxy,
              fontSize: 20,
              color: ColorManager.black,
            ),
          ),
        ],
      ),
    );
  }
}
