import 'package:drosak_managment_app/view/Explore/screen/explore_screen.dart';
import 'package:drosak_managment_app/view/on_boarding/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../view/splash screen/screens/splash_screen.dart';

class RoutesManager {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.ssh: (context) => const SplashScreen(),
    RouteNames.onb: (context) => const OnBoardingScreen(),
    RouteNames.explore: (context) => const ExploreScreen(),
  };
}

class RouteNames {
  static const String ssh = "ssh";
  static const String onb = "onb";
  static const String explore = "explore";
}
