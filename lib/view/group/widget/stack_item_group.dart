import 'dart:io';

import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/numbers/radius_circle_avatar.dart';
import 'package:drosak_managment_app/core/resources/assets_manager.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/resources/color_manager.dart';
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
                  Table(
                    border: TableBorder.all(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        RadiusCircleAvatar.rc15,
                      ),
                    ),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: PaddingManager.p4,
                              horizontal: PaddingManager.p12,
                            ),
                            child: Center(
                              child: Text(
                                "اليوم",
                                // textAlign: .end,
                                style: TextStyle(color: ColorManager.primary),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: PaddingManager.p4,
                              horizontal: PaddingManager.p12,
                            ),
                            child: Center(
                              child: Text(
                                "الوقت",
                                style: TextStyle(color: ColorManager.primary),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: PaddingManager.p4,
                              horizontal: PaddingManager.p12,
                            ),
                            child: Center(
                              child: Text(
                                "م / ص",
                                style: TextStyle(color: ColorManager.primary),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for(int i=1;i<=5;i++)
                      TableRow(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: PaddingManager.p4,
                              horizontal: PaddingManager.p12,
                            ),
                            child: Center(
                              child: Text(
                                "اليوم",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: PaddingManager.p4,
                              horizontal: PaddingManager.p12,
                            ),
                            child: Center(
                              child: Text(
                                "الوقت",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: PaddingManager.p4,
                              horizontal: PaddingManager.p12,
                            ),
                            child: Center(
                              child: Text(
                                "م / ص",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
