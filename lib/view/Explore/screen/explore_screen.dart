import 'package:drosak_managment_app/controller/explore/explore_controller.dart';
import 'package:drosak_managment_app/core/constant%20values/constant_values.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:drosak_managment_app/view/Explore/body/explore_body.dart';
import 'package:drosak_managment_app/view/Explore/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ExploreController _exploreController;

  @override
  void initState() {
    super.initState();
    _exploreController = ExploreController();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: .rtl,
      child: Scaffold(
        appBar: AppBarWidget(),
        backgroundColor: ColorManager.black,
        body: ExploreBody(
          exploreModels: ConstListValues.exploreModel,
          onTap: (index) {
            _exploreController.goToMainScreen(index: index, context: context);
          },
        ),
      ),
    );
  }
}
