import 'package:drosak_managment_app/controller/on_boarding/on_boarding_controller.dart';
import 'package:drosak_managment_app/core/resources/height_manager.dart';
import 'package:drosak_managment_app/view/on_boarding/body/on_boarding_body.dart';
import 'package:drosak_managment_app/view/on_boarding/bottomNavigationBar/on_boarding_nav_bar.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnBoardingController _onBoardingController;

  @override
  void initState() {
    super.initState();
    _onBoardingController = OnBoardingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBody(
        pageController: _onBoardingController.pageController,
        onPageChanged:_onBoardingController.onPageChange,
      ),
      bottomNavigationBar: OnBoardingNavBar(
        dotCount: 5,
        positionStream: _onBoardingController.outputOnPageChanged,
        onTapNext: _onBoardingController.goNext,
      ),
    );
  }
}
