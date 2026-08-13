import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/numbers/height_manager.dart';
import '../../../core/numbers/width_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../core/strings/font_manager.dart';
import '../../../model/education/education_model.dart';

class StudyStageInStackWidget extends StatelessWidget {
  const StudyStageInStackWidget({super.key,required this.educationModel});

  final EducationModel educationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: HeightManager.h103,
      padding: EdgeInsetsGeometry.only(
        left: 10.w,
        top: 6.h,
        right: 22.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: ColorManager.black,
        borderRadius: BorderRadius.circular(CircleRadiusManager.r18),
        border: Border.all(color: ColorManager.primary),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary,
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: -3,
            blurStyle: .outer,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: .center,
        children: [
          CircleAvatar(
            radius: 32.r,
            child: SvgPicture.asset(educationModel.imagePath),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .end,
              children: [
                Text(
                  educationModel.title,
                  style: TextStyle(
                    fontSize: FontSizeManager.s16,
                    color: Colors.white,
                    fontWeight: .w500,
                    fontFamily: FontManager.geDinerOne,
                  ),
                ),
                verticalSpace(height: 5),
                SizedBox(
                  width: WidthManager.w234,
                  height: HeightManager.h55,
                  child: Text(
                    educationModel.subtitle,
                    maxLines: 3,
                    overflow: .ellipsis,
                    textDirection: .rtl,
                    style: TextStyle(
                      fontSize: FontSizeManager.s10,
                      fontWeight: .w500,
                      color: ColorManager.subtitle,
                      fontFamily: FontManager.geDinerOne,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
