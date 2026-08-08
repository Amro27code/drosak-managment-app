import 'package:drosak_managment_app/core/numbers/height_manager.dart';
import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/numbers/width_manager.dart';
import 'package:drosak_managment_app/view/Explore/widgets/grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingManager.p30,
        vertical: PaddingManager.p24,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: WidthManager.w131 / HeightManager.h106,
        mainAxisSpacing: 34,
        crossAxisSpacing: 39,
      ),
      itemCount: 5,
      itemBuilder: (context, index) => GridViewItem(),
    );
  }
}
