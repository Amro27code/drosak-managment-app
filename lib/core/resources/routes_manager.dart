import 'package:drosak_managment_app/view/Attendance/screen/attendance.dart';
import 'package:drosak_managment_app/view/Audience/screen/audience.dart';
import 'package:drosak_managment_app/view/Explore/screen/explore_screen.dart';
import 'package:drosak_managment_app/view/education/screen/education.dart';
import 'package:drosak_managment_app/view/group/screen/group.dart';
import 'package:drosak_managment_app/view/main/screen/main_screen.dart';
import 'package:drosak_managment_app/view/on_boarding/screens/on_boarding_screen.dart';
import 'package:drosak_managment_app/view/students/screen/students.dart';
import 'package:flutter/material.dart';
import '../../view/splash screen/screens/splash_screen.dart';

class RoutesManager {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.ssh: (context) => const SplashScreen(),
    RouteNames.onb: (context) => const OnBoardingScreen(),
    RouteNames.explore: (context) => const ExploreScreen(),
    RouteNames.main: (context) => const MainScreen(),
    RouteNames.student: (context) => const Students(),
    RouteNames.group: (context) => const Group(),
    RouteNames.attendance: (context) => const Attendance(),
    RouteNames.education: (context) => const Education(),
    RouteNames.audience: (context) => const Audience(),
  };
}

class RouteNames {
  static const String ssh = "ssh";
  static const String onb = "onb";
  static const String explore = "explore";
  static const String main = "main";
  static const String student = "st";
  static const String education = "edu";
  static const String group = "group";
  static const String audience = "aud";
  static const String attendance = "att";
}
