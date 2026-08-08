import 'package:drosak_managment_app/core/numbers/height_manager.dart';
import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/numbers/width_manager.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/color_manager.dart';

Positioned backPositionedItemInStack() {
  return Positioned(
    bottom: -16,
    left: -16,
    child: Container(
      width: HeightManager.h32,
      height: WidthManager.w32,
      padding: const EdgeInsets.all(PaddingManager.p5),
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
