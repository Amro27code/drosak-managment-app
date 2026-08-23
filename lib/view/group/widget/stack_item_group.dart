import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/functions/custom_table_widget.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../core/strings/font_manager.dart';

class StudyGroupInStackWidget extends StatelessWidget {
  const StudyGroupInStackWidget({super.key});

  // final EducationModel educationModel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: .rtl,
      child: Container(
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
            Expanded(
              child: Column(
                // crossAxisAlignment: .end,
                children: [
                  Text(
                    "المجموعة الأولي بنات / الصف الأول الإعدادي",
                    textAlign: .end,
                    style: TextStyle(
                      fontSize: FontSizeManager.s16,
                      color: Colors.white,
                      fontWeight: .w500,
                      fontFamily: FontManager.geDinerOne,
                    ),
                  ),
                  verticalSpace(height: 5),
                  CustomTableWidget(
                    secondaryRowColor: Colors.white,
                    tableColor: Colors.white,
                    day: 'الاحد',
                    time: '10:30',
                    tPM_OR_AM: 'م',
                    lengthSecondaryRow: 3,

                    isEdit: true,
                  ),
                  verticalSpace(height: 5),
                  SizedBox(
                    child: Text(
                      "${StringManager.notes}:",
                      style: TextStyle(
                        fontSize: FontSizeManager.s10,
                        fontWeight: .w400,
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
      ),
    );
  }
}
