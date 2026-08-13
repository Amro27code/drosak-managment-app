import 'package:flutter/material.dart';

import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/strings/font_manager.dart';
import '../../../core/strings/string_manager.dart';

Expanded customTextField({
  required String? hintText,
  required TextEditingController controller,
  required ValueChanged<String> onSubmitted,
  int maxLines=1
}) {
  return Expanded(
    child: TextField(
      controller: controller,
      textAlign: .right,
      onSubmitted: onSubmitted,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        constraints: BoxConstraints(maxHeight: 40),
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorManager.nonActiveBnb,
          fontFamily: FontManager.geDinerOne,
          fontSize: FontSizeManager.s14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(CircleRadiusManager.r12),
        ),
      ),
    ),
  );
}
