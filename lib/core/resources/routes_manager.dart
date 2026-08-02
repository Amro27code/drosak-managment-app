import 'package:flutter/material.dart';

import '../../view/splash screen/screens/splash_screen.dart';

class RoutesManager {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.ssh: (context) => const SplashScreen(),
  };
}

class RouteNames {
  static const String ssh = "ssh";
}
