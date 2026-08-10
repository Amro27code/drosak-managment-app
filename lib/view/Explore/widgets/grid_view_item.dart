import 'package:drosak_managment_app/core/numbers/font_size_manager.dart';
import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:drosak_managment_app/core/strings/font_manager.dart';
import 'package:drosak_managment_app/view/Explore/widgets/positioned_in_stack.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/color_manager.dart';
import '../../../model/explore/explore_model.dart';
import 'back_positioned_item_in_stack.dart';
import 'content_grid_item.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this._exploreModel,
    required this.index,
    required this.onTap,
  });

  final ExploreModel _exploreModel;
  final int index;

  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(
        //   context,
        // ).pushNamed(RouteNames.main, arguments: {"index": index});
        onTap(index);
      },
      child: Stack(
        clipBehavior: .none,
        children: [
          backPositionedItemInStack(),
          ContentGridItem(exploreModel: _exploreModel),
          buildPositionedInStack(color: ColorManager.black, num: 16),
          buildPositionedInStack(
            color: ColorManager.primary,
            num: 10,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontWeight: .w500,
                fontFamily: FontManager.geDinerOne,
                fontSize: FontSizeManager.s12,
                color: ColorManager.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
