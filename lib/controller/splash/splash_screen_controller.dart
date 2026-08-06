import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../../core/resources/routes_manager.dart';

class SplashScreenController {

  late AnimationController _animationController;
  late Animation<Offset> _animationBottom;

  late Animation<Offset> _animationTop;
  final BuildContext _context;
  final TickerProvider _vsync;
  SplashScreenController({required this._context,required this._vsync}){
    initController();
  }
  void initController(){
    startAnimation();
  }
  void startAnimation(){
    _animationController =
    AnimationController(vsync: _vsync, duration: Duration(seconds: 1))
      ..addStatusListener((status) {
        print(status);
        if (status ==
            AnimationStatus.completed) /* OR =>   status.isCompleted */ {
          goToOnb();
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

  void goToOnb() {
     Navigator.pushNamedAndRemoveUntil(
      _context,
      RouteNames.onb,
          (route) => false,
    );
  }

  void disposeFunction(){
    _animationController.dispose();
  }
  Animation<Offset> get animationBottom => _animationBottom;

  Animation<Offset> get animationTop => _animationTop;
}
