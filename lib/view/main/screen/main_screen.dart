import 'package:drosak_managment_app/controller/main/main_screen_controller.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';

import '../bnb/bnb_main_screen.dart';
import '../widget/custom_app_bar.dart';

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
      appBar: CustomAppBar(

        streamCurrentIndex: _mainScreenController.currentIndexBnbOutput,
      ),

      body: StreamBuilder<int>(
        stream: _mainScreenController.currentIndexBnbOutput,
        builder: (context, snapshot) => MainScreenController
            .bnbItems[snapshot.data ??
                0] // maybe replace 0 to args[StringManager.indexScreen]
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
