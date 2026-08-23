import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../numbers/font_size_manager.dart';

import '../../../numbers/padding_margin_manager.dart';
import '../../../numbers/width_manager.dart';
import '../../color_manager.dart';

class CustomRowElevatedButtonWidget extends StatelessWidget {
  const CustomRowElevatedButtonWidget({
    super.key,
    required this.iconData,
    required this.text,
    this.mainAxisSize = .max,
  });

  final IconData iconData;
  final String text;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
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
          Text(text, style: TextStyle(fontSize: FontSizeManager.s14)),
          Icon(iconData, color: Colors.white, size: FontSizeManager.s14),
        ],
      ),
    );
  }
}
