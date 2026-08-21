import 'package:drosak_managment_app/controller/main/main_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bnb/bnb_main_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenController _mainScreenController;

  @override
  void initState() {
    super.initState();
    _mainScreenController = MainScreenController();
  }

  @override
  void dispose() {
    _mainScreenController.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _mainScreenController.getArguments(context);
    return Scaffold(
      body: StreamBuilder<int>(
        stream: _mainScreenController.currentIndexBnbOutput,
        builder: (context, snapshot) =>
        snapshot.connectionState == ConnectionState.waiting ? Center(
          child: CupertinoActivityIndicator(),):
        MainScreenController
            .bnbItems[snapshot.data!] // maybe replace 0 to args[StringManager.indexScreen]
            .screen,
      ),
      bottomNavigationBar: BnbMainScreen(
        // currentIndex: args[StringManager.indexScreen],
        listItem: MainScreenController.bnbItems,
        onTap: _mainScreenController.onTapBnb,
        bnbStream: _mainScreenController.currentIndexBnbOutput,
      ),
    );
  }
}
