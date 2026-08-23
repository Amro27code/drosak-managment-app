import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/functions/custom_row_elevated_button.dart';
import '../../../core/resources/widgets/space/horizontal_space.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../core/strings/font_manager.dart';
import '../../../core/strings/string_manager.dart';

class MiddleSectionCreateNewGroup extends StatelessWidget {
  const MiddleSectionCreateNewGroup({
    super.key,
    required this.listEducationModel,
    required this.onChanged,
  });

  final List<EducationModel> listEducationModel;
  final Function(EducationModel?) onChanged;

  @override


  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              StringManager.bnb1,
              style: TextStyle(
                color: ColorManager.primary,
                fontFamily: FontManager.geDinerOne,
              ),
            ),
            horizontalSpace(width: 11),
            Expanded(
              child: CustomDropdown<EducationModel>.search(
                searchHintText: StringManager.search,
                hintText: StringManager.chooseEduStage,
                items: listEducationModel,
                onChanged: onChanged,
                noResultFoundText: "لم يتم العثور على المرحلة التعليمية",
              ),
            ),
          ],
        ),
        verticalSpace(height: 21),
        Row(
          children: [
            Text(
              StringManager.day,
              style: TextStyle(
                color: ColorManager.primary,
                fontFamily: FontManager.geDinerOne,
              ),
            ),
            horizontalSpace(width: 11),
            // Expanded(
            //   child:
            Expanded(
              flex: 3,
              child: CustomDropdown<String>.search(
                searchHintText: StringManager.search,

                hintText: StringManager.chooseDay,
                items: StringManager.days,
                onChanged: (value) {
                  print('changing value to: $value');
                },
                noResultFoundText: "لم يتم العثور على اليوم",
              ),
            ),
            Spacer(),
            Text(
              StringManager.time,
              style: TextStyle(
                color: ColorManager.primary,
                fontFamily: FontManager.geDinerOne,
              ),
            ),
            horizontalSpace(width: 11),
            Expanded(
              flex: 3,
              child: CustomDropdown<EducationModel>.search(
                searchHintText: StringManager.search,

                hintText: StringManager.chooseTime,
                items: listEducationModel,
                onChanged: (value) {
                  print('changing value to: $value');
                },
                noResultFoundText: "لم يتم العثور على المرحلة التعليمية",
              ),
            ),
          ],
        ),
        verticalSpace(height: 21),
        Center(
          child: CustomRowElevatedButtonWidget(
            iconData: Icons.download_outlined,
            text: StringManager.add,
            mainAxisSize: .min,
          ),
        ),
      ],
    );
  }
}
