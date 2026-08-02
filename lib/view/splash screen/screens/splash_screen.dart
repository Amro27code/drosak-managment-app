import 'package:drosak_managment_app/core/resources/assets_manager.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
            Image.asset(AssetsValueManager.topSplash),
            Center(child: Image.asset(AssetsValueManager.logo)),
            Align(
              alignment: .bottomEnd,
              child: Image.asset(AssetsValueManager.bottomSplash),
            ),
          ],
        ),
      ),
    );
  }
}
