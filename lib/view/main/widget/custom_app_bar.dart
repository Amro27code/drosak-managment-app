import 'package:flutter/material.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/numbers/width_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/space/horizontal_space.dart';
import '../../../core/strings/font_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onTapSearch,
    required this.onTapAdd,
  });

  final VoidCallback onTapSearch;
  final VoidCallback onTapAdd;
  final String title;

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
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: onTapSearch,
            icon: Icon(Icons.search, size: 20),
          ),
          // horizontalSpace(width: WidthManager.w9),
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: onTapAdd,
            icon: Icon(Icons.add_circle_outline_sharp, size: 20),
          ),
        ],
      ),
      // title: Text("المراحل التعليمية"),
      actions: [
        Text(
          title,
          style: TextStyle(
            fontFamily: FontManager.geDinerOne,
            fontWeight: .w500,
            fontSize: FontSizeManager.s15,
          ),
        ),
        horizontalSpace(width: WidthManager.w13),
      ], //[Icon(Icons.add_circle_outline_sharp), Icon(Icons.search)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
