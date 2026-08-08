import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/view/Explore/body/explore_body.dart';
import 'package:drosak_managment_app/view/Explore/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: .rtl,
      child: Scaffold(
        appBar: AppBarWidget(),
        backgroundColor: ColorManager.black,
        body: ExploreBody(),
      ),
    );
  }
}
