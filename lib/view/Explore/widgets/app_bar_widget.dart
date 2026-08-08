import 'package:drosak_managment_app/core/numbers/font_size_manager.dart';
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
          fontSize: FontSizeManager.s20,
          color: ColorManager.primary,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
