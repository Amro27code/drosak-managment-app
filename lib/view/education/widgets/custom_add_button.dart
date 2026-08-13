import 'package:flutter/material.dart';

import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/strings/font_manager.dart';

ElevatedButton customAddButton({
  required VoidCallback onTapAddInSheet,
  required String textInButton,
}) {
  return ElevatedButton(
    onPressed: onTapAddInSheet,
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(CircleRadiusManager.r12),
      ),
    ),
    child: Text(
      textInButton,
      style: TextStyle(
        color: Colors.white,
        fontFamily: FontManager.geDinerOne,
        fontSize: FontSizeManager.s16,
        fontWeight: .w500,
      ),
    ),
  );
}
