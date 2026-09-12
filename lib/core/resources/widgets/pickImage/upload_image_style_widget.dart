import 'package:dotted_border/dotted_border.dart';
import 'package:drosak_managment_app/core/strings/font_manager.dart';
import 'package:flutter/material.dart';

import '../../../numbers/circle_radius_manager.dart';
import '../../../numbers/height_manager.dart';
import '../../color_manager.dart';

class UploadImageStyleWidget extends StatelessWidget {
  const UploadImageStyleWidget({super.key, required this.pickImageMethod});

  final void Function() pickImageMethod;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickImageMethod,
      child: SizedBox(
        height: HeightManager.h200,
        width: .infinity,
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            color: Colors.grey,
            dashPattern: [10],
            radius: Radius.circular(CircleRadiusManager.r12),
          ),
          child: Container(
            width: .infinity,
            height: .infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CircleRadiusManager.r12),
              color: ColorManager.primary.withValues(alpha: 0.2),
            ),
            child: Column(
              mainAxisAlignment: .center,
              spacing: HeightManager.h6,
              children: [
                Icon(Icons.upload, size: 50, color: Colors.white),
                Text(
                  "إضغط لتحميل صورة",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontManager.geDinerOne,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
