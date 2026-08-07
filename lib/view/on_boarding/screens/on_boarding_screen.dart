import 'package:drosak_managment_app/core/resources/height_manager.dart';
import 'package:drosak_managment_app/view/on_boarding/body/on_boarding_body.dart';
import 'package:drosak_managment_app/view/on_boarding/bottomNavigationBar/on_boarding_nav_bar.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBody(),
      bottomNavigationBar: OnBoardingNavBar(currentIndex:2 ,dotCount: 5,),
    );
  }
}
