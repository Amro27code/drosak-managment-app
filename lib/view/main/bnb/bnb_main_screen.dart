import 'package:drosak_managment_app/core/numbers/height_manager.dart';
import 'package:drosak_managment_app/core/numbers/width_manager.dart';
import 'package:drosak_managment_app/model/bnb/bnb_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/color_manager.dart';

class BnbMainScreen extends StatelessWidget {
  const BnbMainScreen({
    super.key,
    // required this.currentIndex,
    required this.listItem,
    required this.onTap,
    required this.bnbStream,
  });

  // final int currentIndex;
  final List<BnbModel> listItem;
  final ValueChanged<int> onTap;
  final Stream<int> bnbStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bnbStream,
      builder: (context, snapShot) {
        return BottomNavigationBar(
          type: .fixed,
          unselectedItemColor: ColorManager.nonActiveBnb,
          selectedItemColor: ColorManager.primary,
          backgroundColor: ColorManager.backgroundBnb,
          // currentIndex: currentIndex,
          currentIndex: snapShot.data??0,
          // currentIndex: snapShot.data == null ? currentIndex : snapShot.data!,
          onTap: onTap,
          items: [
            for (int i = 0; i < listItem.length; i++)
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  listItem[i].imagePath,
                  width: WidthManager.w20,
                  height: HeightManager.h20,
                  colorFilter: i == (snapShot.data ?? 0)
                      ? ColorFilter.mode(ColorManager.primary, BlendMode.srcIn)
                      : null,
                ),
                label: listItem[i].title,
              ),
          ],
        );
      },
    );
  }
}
