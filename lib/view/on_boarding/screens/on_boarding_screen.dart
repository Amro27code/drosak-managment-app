import 'package:drosak_managment_app/view/on_boarding/body/on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBody(),
      bottomNavigationBar: Container(color: Colors.green, height: 39),
    );
  }
}
