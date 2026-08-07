import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/strings/font_manager.dart';
import '../../../core/strings/string_manager.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        StringManager.explore,
        style: TextStyle(
          fontWeight: .w500,
          fontFamily: FontManager.geDinerOne,
          fontSize: 20,
          color: ColorManager.primary,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
