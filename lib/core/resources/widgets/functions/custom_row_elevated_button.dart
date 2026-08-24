import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../numbers/font_size_manager.dart';

import '../../../numbers/padding_margin_manager.dart';
import '../../../numbers/width_manager.dart';
import '../../color_manager.dart';

class CustomRowElevatedButtonWidget extends StatelessWidget {
  const CustomRowElevatedButtonWidget({
    super.key,
    this.iconData,
    this.text,
    this.mainAxisSize = .max,
    this.notText = false,
    this.notIcon = false,
    required this.onPressed,
  });

  final IconData? iconData;
  final String? text;
  final bool notText;
  final bool notIcon;
  final MainAxisSize mainAxisSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(
          horizontal: PaddingManager.p24,
          vertical: PaddingManager.p5,
        ),
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
        alignment: .center,
      ),
      child: Row(
        spacing: WidthManager.w5,
        mainAxisAlignment: .center,
        mainAxisSize: mainAxisSize,
        children: [
          if (!notText)
            Text(
              text == null ? "" : text!,
              style: TextStyle(fontSize: FontSizeManager.s14),
            ),
          if (!notIcon)
            Icon(iconData, color: Colors.white, size: FontSizeManager.s14),
        ],
      ),
    );
  }
}
