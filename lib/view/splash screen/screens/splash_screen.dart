import 'package:drosak_managment_app/core/resources/assets_manager.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animationBottom;
  late Animation<Offset> _animationTop;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addStatusListener((status) {
            print(status);
            if (status ==
                AnimationStatus.completed) /* OR =>   status.isCompleted */ {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.onb,
                (route) => false,
              );
            }
          });
    _animationBottom =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    _animationTop = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
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
              position: _animationTop,
              child: Image.asset(AssetsValueManager.topSplash),
            ),
            Center(child: Image.asset(AssetsValueManager.logo)),
            Align(
              alignment: .bottomEnd,
              child: SlideTransition(
                position: _animationBottom,
                child: Image.asset(AssetsValueManager.bottomSplash),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
