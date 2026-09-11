import 'dart:async';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/functions/convert_time_of_period_to_string.dart';
import '../../../core/resources/widgets/functions/custom_row_elevated_button.dart';
import '../../../core/resources/widgets/space/horizontal_space.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../core/strings/font_manager.dart';
import '../../../core/strings/string_manager.dart';
import '../../../model/education/education_model.dart';

class MiddleSectionCreateNewStudent extends StatelessWidget {
  const MiddleSectionCreateNewStudent({
    super.key,
    required this.streamListEducation,
    required this.onChangedStage,
    this.initialEduItem,
    required this.selectedEduInEdit,
  });

  final Function(EducationModel?) onChangedStage;
  final Stream<List<EducationModel>> streamListEducation;
  final Stream<EducationModel?> selectedEduInEdit;

  final EducationModel? initialEduItem;


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
            StreamBuilder2<List<EducationModel>, EducationModel?>(
              // stream: streamListEducation,
              streams: StreamTuple2(streamListEducation, selectedEduInEdit),
              builder: (context, snapshots) {
                return snapshots.snapshot1.connectionState ==
                        ConnectionState.waiting
                    ? Center(child: CupertinoActivityIndicator())
                    :
                      //! ========= choose EDU ============
                      Expanded(
                        child: CustomDropdown<EducationModel>.search(
                          searchHintText: StringManager.search,
                          hintText:  StringManager.chooseEduStage,
                          items: snapshots.snapshot1.data,
                          initialItem: initialEduItem,
                          // snapshots.snapshot2.data,//initialEduItem,
                          headerBuilder: (context, selectedItem, enabled) {
                            print(enabled);
                            print(selectedItem);
                            return Text(
                              selectedItem.title,
                              maxLines: 1,
                              overflow: .ellipsis,
                            );
                          },
                          listItemBuilder:
                              (context, item, isSelected, onItemSelect) =>
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(item.title),
                                    subtitle: item.subtitle.isEmpty
                                        ? null
                                        : Text(item.subtitle),
                                    leading: CircleAvatar(
                                      child: Text(item.id.toString()),
                                    ),
                                  ),
                          onChanged: onChangedStage,
                          noResultFoundText:
                              "لم يتم العثور على المرحلة التعليمية",
                        ),
                      );
              },
            ),
          ],
        ),
        verticalSpace(height: 21),
        Row(
          children: [
            Text(
              StringManager.bnb2,
              style: TextStyle(
                color: ColorManager.primary,
                fontFamily: FontManager.geDinerOne,
              ),
            ),
            horizontalSpace(width: 11),
            StreamBuilder2<List<EducationModel>, EducationModel?>(
              // stream: streamListEducation,
              streams: StreamTuple2(streamListEducation, selectedEduInEdit),
              builder: (context, snapshots) {
                return snapshots.snapshot1.connectionState ==
                        ConnectionState.waiting
                    ? Center(child: CupertinoActivityIndicator())
                    :
                      //! ========= choose EDU ============
                      Expanded(
                        child: CustomDropdown<EducationModel>.search(
                          searchHintText: StringManager.search,
                          hintText: StringManager.chooseGroup,
                          items: snapshots.snapshot1.data,
                          initialItem: initialEduItem,
                          // snapshots.snapshot2.data,//initialEduItem,
                          headerBuilder: (context, selectedItem, enabled) {
                            print(enabled);
                            print(selectedItem);
                            return Text(
                              selectedItem.title,
                              maxLines: 1,
                              overflow: .ellipsis,
                            );
                          },
                          listItemBuilder:
                              (context, item, isSelected, onItemSelect) =>
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(item.title),
                                    subtitle: item.subtitle.isEmpty
                                        ? null
                                        : Text(item.subtitle),
                                    leading: CircleAvatar(
                                      child: Text(item.id.toString()),
                                    ),
                                  ),
                          onChanged: onChangedStage,
                          noResultFoundText:
                              "لم يتم العثور على المرحلة التعليمية",
                        ),
                      );
              },
            ),
          ],
        ),

        // verticalSpace(height: 21),
        // Row(
        //   children: [
        //     Text(
        //       StringManager.day,
        //       style: TextStyle(
        //         color: ColorManager.primary,
        //         fontFamily: FontManager.geDinerOne,
        //       ),
        //     ),
        //     horizontalSpace(width: 11),
        //     //!============ DAY ==============
        //     Expanded(
        //       flex: 3,
        //       child: CustomDropdown<String>.search(
        //         searchHintText: StringManager.search,
        //
        //         hintText: StringManager.chooseDay,
        //         items: StringManager.days,
        //         onChanged: onChangedDay,
        //         noResultFoundText: "لم يتم العثور على اليوم",
        //       ),
        //     ),
        //     // Spacer(),
        //   ],
        // ),
        // verticalSpace(height: 10),
        //
        // Row(
        //   children: [
        //     Text(
        //       StringManager.time,
        //       style: TextStyle(
        //         color: ColorManager.primary,
        //         fontFamily: FontManager.geDinerOne,
        //       ),
        //     ),
        //     horizontalSpace(width: 11),
        //
        //     CustomRowElevatedButtonWidget(
        //       text: StringManager.chooseTime,
        //       notIcon: true,
        //       onPressed: onPressedChooseTime,
        //     ),
        //     Spacer(),
        //     //! customRadioButton(),
        //     if (timeGroup != null)
        //       Align(
        //         alignment: .centerLeft,
        //         child: Text(
        //           "${convertTimeOfDayToString(timeGroup!)} ${periodForTimeOfDay(timeGroup!)}",
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontFamily: FontManager.geDinerOne,
        //           ),
        //         ),
        //       ),
        //   ],
        // ),

        // verticalSpace(height: 21),
        // Center(
        //   child: CustomRowElevatedButtonWidget(
        //     iconData: Icons.download_outlined,
        //     text: StringManager.add,
        //     mainAxisSize: .min,
        //     onPressed: onPressedSave,
        //   ),
        // ),
      ],
    );
  }
}
