import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routeName});
final String routeName;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),//ابعاد الشاشة تبع figma او شاشة التلفون اللي بتجرب منها
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: routeName,
      ),
    );
  }
}
