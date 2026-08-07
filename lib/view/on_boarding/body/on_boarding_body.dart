import 'package:drosak_managment_app/view/on_boarding/widgets/on_boarding_items.dart';
import 'package:flutter/material.dart';
import '../../../core/constant values/constant_values.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody(
      {super.key, required this._pageController, required this.onPageChanged});

  final PageController _pageController;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: .rtl,
        child: PageView.builder(
          controller: _pageController,
          itemCount: ConstListValues.onBoardingModel.length,
          onPageChanged:onPageChanged,
          itemBuilder: (BuildContext context, int index) =>
              OnBoardingItems(
                onBoardingModel: ConstListValues.onBoardingModel[index],
              ),
        ),
      ),
    );
  }
}
