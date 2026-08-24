import 'dart:async';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
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
    required this.listEducationName,
    required this.onChangedDay,
    required this.onPressedChooseTime,
    required this.onPressedSave,
    required this.timeGroup,
    required this.groupValueAM,
    required this.radioButtonStream,
    required this.onChangedRadio,
  });

  final List<String> listEducationName;
  final Function(String?) onChangedDay;
  final VoidCallback onPressedChooseTime;
  final VoidCallback onPressedSave;
  final String? timeGroup;
  final Stream<String?> radioButtonStream;
  final String? groupValueAM;
  final ValueChanged<String?> onChangedRadio;

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
              child: CustomDropdown<String>.search(
                searchHintText: StringManager.search,
                hintText: StringManager.chooseEduStage,
                items: listEducationName,
                onChanged: (p0) {},
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
            //!============ DAY ==============
            Expanded(
              flex: 3,
              child: CustomDropdown<String>.search(
                searchHintText: StringManager.search,

                hintText: StringManager.chooseDay,
                items: StringManager.days,
                onChanged: onChangedDay,
                noResultFoundText: "لم يتم العثور على اليوم",
              ),
            ),
            // Spacer(),
          ],
        ),
        Row(
          children: [
            Text(
              StringManager.time,
              style: TextStyle(
                color: ColorManager.primary,
                fontFamily: FontManager.geDinerOne,
              ),
            ),
            horizontalSpace(width: 11),

            CustomRowElevatedButtonWidget(
              text: StringManager.chooseTime,
              notIcon: true,
              onPressed: onPressedChooseTime,
            ),
            customRadioButton(),
          ],
        ),
        verticalSpace(height: 10),
        if (timeGroup != null)
          Align(
            alignment: .centerLeft,
            child: Text(
              timeGroup!,
              style: TextStyle(
                color: Colors.white,
                fontFamily: FontManager.geDinerOne,
              ),
            ),
          ),
        verticalSpace(height: 21),
        Center(
          child: CustomRowElevatedButtonWidget(
            iconData: Icons.download_outlined,
            text: StringManager.add,
            mainAxisSize: .min,
            onPressed: onPressedSave,
          ),
        ),
      ],
    );
  }

  StreamBuilder<String?> customRadioButton() {
    return StreamBuilder(
      stream: radioButtonStream,
      builder: (context, snapshot) {
        return Expanded(
          child: Wrap(
            children: [
              RadioGroup(
                onChanged: onChangedRadio,
                groupValue: snapshot.data,
                child: RadioListTile<String>(
                  value: "am",
                  title: Text("ص", style: TextStyle(color: Colors.white)),
                ),
              ),
              RadioGroup(
                onChanged: onChangedRadio,
                groupValue: snapshot.data, //"pm",
                child: RadioListTile<String>(
                  value: "pm",
                  title: Text("م", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
