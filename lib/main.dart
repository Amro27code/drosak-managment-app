import 'dart:io';

import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import 'myApp/my_app.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String routeName = await checkWhichScreen();
  print(routeName);

  runApp( MyApp(routeName: routeName));
}

Future<String> checkWhichScreen() async {
  String? androidVersion = await getAndroidVersion();
  // print("$androidVersion-----------------------");
  if (androidVersion != null) {
    String version=androidVersion.split('.')[0].trim();
    if (int.parse(version/*[0]*/) >= 12) {
      // custom ssh
      return RouteNames.ssh;
    }
    //onb
  }
  return RouteNames.onb;
}

Future<String?> getAndroidVersion() async {
  if (Platform.isAndroid) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.version.release;
  } else {
    return null;
  }
}
