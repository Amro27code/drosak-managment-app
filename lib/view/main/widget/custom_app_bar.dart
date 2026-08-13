import 'package:drosak_managment_app/controller/main/main_screen_controller.dart';
import 'package:flutter/material.dart';

import '../../../core/numbers/font_size_manager.dart';
import '../../../core/numbers/width_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/space/horizontal_space.dart';
import '../../../core/strings/font_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.streamCurrentIndex});

  final Stream<int> streamCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leadingWidth: 80.w,
      automaticallyImplyLeading: false,
      backgroundColor: ColorManager.primary,
      foregroundColor: Colors.white,
      title: Row(
        children: [
          // horizontalSpace(width: WidthManager.w16),
          Icon(Icons.search, size: 20),
          horizontalSpace(width: WidthManager.w9),
          Icon(Icons.add_circle_outline_sharp, size: 20),
        ],
      ),
      // title: Text("المراحل التعليمية"),
      actions: [
        StreamBuilder(
          stream: streamCurrentIndex,
          builder: (context, snapShot) {
            return Text(
              // "المراحل التعليمية",
              MainScreenController.bnbItems[snapShot.data ?? 0].title,
              style: TextStyle(
                fontFamily: FontManager.geDinerOne,
                fontWeight: .w500,
                fontSize: FontSizeManager.s15,
              ),
            );
          },
        ),
        horizontalSpace(width: WidthManager.w13),
      ], //[Icon(Icons.add_circle_outline_sharp), Icon(Icons.search)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
