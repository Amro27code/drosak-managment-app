import 'package:drosak_managment_app/model/explore/explore_model.dart';
import 'package:flutter/material.dart';

import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/strings/font_manager.dart';

class TitleInItemStack extends StatelessWidget {
  const TitleInItemStack({super.key, required this._exploreModel});

  final ExploreModel _exploreModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: HeightManager.h25,
      // width: .infinity,
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p4),
      // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      // alignment: .centerRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CircleRadiusManager.r12),
        color: ColorManager.primary,
      ),
      child: Text(
        // "المراحل التعليمية",
        _exploreModel.title,
        textAlign: .start,
        style: TextStyle(
          // backgroundColor: Colors.red,
          color: Colors.white,
          fontSize: FontSizeManager.s15,
          fontFamily: FontManager.geDinerOne,
          fontWeight: .w500,
        ),
      ),
    );
  }
}
