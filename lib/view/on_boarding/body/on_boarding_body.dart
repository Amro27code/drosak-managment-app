import 'package:drosak_managment_app/view/on_boarding/widgets/on_boarding_items.dart';
import 'package:flutter/material.dart';
import '../../../core/constant values/constant_values.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        itemCount: ConstListValues.onBoardingModel.length,
        itemBuilder: (BuildContext context, int index) => OnBoardingItems(
          onBoardingModel: ConstListValues.onBoardingModel[index],
        ),
      ),
    );
  }
}
