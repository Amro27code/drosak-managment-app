import 'package:drosak_managment_app/core/constant%20values/constant_values.dart';
import 'package:drosak_managment_app/core/resources/assets_manager.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: .infinity,
          child: Column(
            spacing: 60,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              SvgPicture.asset(AssetsValueManager.onb1, height: 200),
              Text(
                ConstListValues.onBoardingModel[0].title,
                textAlign: .center,
                style: TextStyle(
                  fontFamily: "AA-GALAXY",
                  fontSize: 20,
                  color: ColorManager.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
