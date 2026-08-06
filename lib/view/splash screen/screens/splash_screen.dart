import 'package:drosak_managment_app/controller/splash/splash_screen_controller.dart';
import 'package:drosak_managment_app/core/resources/assets_manager.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late SplashScreenController _splashScreenController;

  @override
  void initState() {
    super.initState();
    _splashScreenController = SplashScreenController(
      vsync: this,
      context: context,
    );
  }

  @override
  void dispose() {
    _splashScreenController.disposeFunction();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SizedBox(
        width: .infinity,
        child: Column(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .start,
          children: [
            SlideTransition(
              position: _splashScreenController.animationTop,
              child: Image.asset(AssetsValueManager.topSplash),
            ),
            Center(child: Image.asset(AssetsValueManager.logo)),
            Align(
              alignment: .bottomEnd,
              child: SlideTransition(
                position: _splashScreenController.animationBottom,
                child: Image.asset(AssetsValueManager.bottomSplash),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
