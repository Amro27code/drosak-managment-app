import 'package:flutter/material.dart';

import '../../../core/numbers/font_size_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/strings/font_manager.dart';

class CustomAppBarAddNewGroup extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarAddNewGroup({super.key, required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.primary,
      foregroundColor: Colors.white,
      title: Text(
        textTitle,
        style: TextStyle(
          fontFamily: FontManager.geDinerOne,
          fontSize: FontSizeManager.s15,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
