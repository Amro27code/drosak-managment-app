import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:drosak_managment_app/model/group/group_model.dart';
import 'package:drosak_managment_app/view/education/widgets/stackItem.dart';
import 'package:drosak_managment_app/view/group/widget/stack_item_group.dart';
import 'package:flutter/material.dart';

import '../../../core/numbers/font_size_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/strings/font_manager.dart';
import '../../../model/group/fk_group_appointment.dart';
import '../../../model/group/time_of_day_model.dart';
import '../../Explore/widgets/back_positioned_item_in_stack.dart';
import '../../Explore/widgets/positioned_in_stack.dart';

class ItemBuilderGroup extends StatelessWidget {
  const ItemBuilderGroup({
    super.key,
    required this.editFun,
    required this.deleteFun,
    required this.groupModel,
    required this.streamTableList,
  });

  // final EducationModel educationModel;

  // final DismissDirectionCallback onDismissed;
  final Stream<List<AppointmentModel>> streamTableList;
  final VoidCallback deleteFun;
  final VoidCallback editFun;
  final FkGroupAppointment groupModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: .none,
      children: [
        backPositionedItemInStack(numTopRight: -10),
        StudyGroupInStackWidget(
          groupModel: groupModel,
          streamTableList: streamTableList, editFun: editFun, deleteFun: deleteFun,
        ),
        buildPositionedInStack(
          radius: 16,
          color: ColorManager.black,
          numTopRight: -10,
        ),
        buildPositionedInStack(
          radius: 10,
          color: ColorManager.primary,
          numTopRight: -5,
          child: Text(
            "${groupModel.groupModel.id}",
            textAlign: .center,
            style: .new(
              color: Colors.white,
              fontFamily: FontManager.geDinerOne,
              fontSize: FontSizeManager.s12,
            ),
          ),
        ),
      ],
    );
  }
}
