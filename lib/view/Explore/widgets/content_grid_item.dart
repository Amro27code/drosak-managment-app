import 'package:drosak_managment_app/core/numbers/circle_radius_manager.dart';
import 'package:drosak_managment_app/core/numbers/height_manager.dart';
import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/numbers/width_manager.dart';
import 'package:drosak_managment_app/core/resources/widgets/space/vertical_space.dart';
import 'package:drosak_managment_app/view/Explore/widgets/title_in_item_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/resources/color_manager.dart';
import '../../../model/explore/explore_model.dart';

class ContentGridItem extends StatelessWidget {
  const ContentGridItem({super.key,required this._exploreModel});
  final ExploreModel _exploreModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidthManager.w131,
      height: HeightManager.h106, //TODO: =================
      padding:  const EdgeInsets.symmetric(horizontal: PaddingManager.p5, vertical: PaddingManager.p5),
      decoration: BoxDecoration(
        color: ColorManager.black,
        borderRadius: BorderRadius.circular(CircleRadiusManager.r18),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary,
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          TitleInItemStack(exploreModel: _exploreModel,),
          verticalSpace(height: 6),
          SvgPicture.asset(
            alignment: .centerRight,
            _exploreModel.imagePath,
            height: HeightManager.h63,
            width: WidthManager.w95,
          ),
        ],
      ),
    );
  }
}

