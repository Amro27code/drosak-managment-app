import 'package:drosak_managment_app/core/numbers/circle_radius_manager.dart';
import 'package:drosak_managment_app/core/numbers/font_size_manager.dart';
import 'package:drosak_managment_app/core/numbers/height_manager.dart';
import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/numbers/width_manager.dart';
import 'package:drosak_managment_app/core/resources/widgets/space/vertical_space.dart';
import 'package:drosak_managment_app/view/Explore/widgets/title_in_item_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/strings/font_manager.dart';

class ContentGridItem extends StatelessWidget {
  const ContentGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidthManager.w131,
      height: HeightManager.h106, //TODO: =================
      padding:  const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
          TitleInItemStack(),
          verticalSpace(height: 6),
          SvgPicture.asset(
            alignment: .centerRight,
            AssetsValueManager.onb1,
            height: HeightManager.h63,
            width: WidthManager.w95,
          ),
        ],
      ),
    );
  }
}

