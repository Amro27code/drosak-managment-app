import 'package:drosak_managment_app/core/numbers/height_manager.dart';
import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/numbers/width_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/color_manager.dart';

Positioned backPositionedItemInStack({
  double? numBottomLeft,
  double? numTopRight,
}) {
  return Positioned(
    bottom: numBottomLeft?.h,
    left: numBottomLeft?.w,

    top: numTopRight?.h,
    right: numTopRight?.w,

    child: Container(
      width: HeightManager.h32,
      height: WidthManager.w32,
      padding: EdgeInsets.all(PaddingManager.p5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.black,
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary,
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 1,
          ),
        ],
      ),
      alignment: .center,
    ),
  );
}
