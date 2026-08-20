import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:drosak_managment_app/view/education/widgets/stackItem.dart';
import 'package:flutter/material.dart';

import '../../../core/numbers/font_size_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/strings/font_manager.dart';
import '../../Explore/widgets/back_positioned_item_in_stack.dart';
import '../../Explore/widgets/positioned_in_stack.dart';

class ItemBuilderEducation extends StatelessWidget {
  const ItemBuilderEducation({
    super.key,
    required this.educationModel,
    required this.onDismissedDeleteFun,
    required this.onDismissedUpdateFun,
  });

  final EducationModel educationModel;

  // final DismissDirectionCallback onDismissed;
  final Function(EducationModel educationModel) onDismissedDeleteFun;
  final Function(EducationModel educationModel) onDismissedUpdateFun;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(educationModel.id),
      //بتاخذ حاجة unique
      // direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) async {
        bool? confirmDelete;
        if (direction == DismissDirection.startToEnd) {
          confirmDelete = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "هل انت متأكد من حذف العنصر..؟",
                textAlign: .center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSizeManager.s14,
                  fontFamily: FontManager.geDinerOne,
                ),
              ),
              backgroundColor: ColorManager.black,
              actions: [
                TextButton(
                  onPressed: () {
                    confirmDelete = false;
                    Navigator.pop(context);
                  },
                  child: Text(
                    "لا",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: FontSizeManager.s12,
                      fontFamily: FontManager.geDinerOne,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    confirmDelete = true;
                    await onDismissedDeleteFun(educationModel);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "نعم",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: FontSizeManager.s12,
                      fontFamily: FontManager.geDinerOne,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return confirmDelete;
      },
      // onDismissed: (direction) async {
      //   print(direction);
      //   if (direction == DismissDirection.startToEnd) {
      //     await onDismissedDeleteFun(educationModel);
      //   } else {
      //     await onDismissedUpdateFun(educationModel);
      //   }
      // },
      background: Container(
        color: Colors.red,
        alignment: .centerLeft,
        padding: EdgeInsets.all(PaddingManager.p10),
        child: Text(
          "حذف",
          style: TextStyle(
            color: Colors.white,
            fontSize: FontSizeManager.s16,
            fontFamily: FontManager.geDinerOne,
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: .centerRight,
        padding: EdgeInsets.all(PaddingManager.p10),
        child: Text(
          "تعديل",
          style: TextStyle(
            color: Colors.white,
            fontSize: FontSizeManager.s16,
            fontFamily: FontManager.geDinerOne,
          ),
        ),
      ),
      child: Stack(
        clipBehavior: .none,
        children: [
          backPositionedItemInStack(numTopRight: -10),
          StudyStageInStackWidget(educationModel: educationModel),
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
              "${educationModel.id}",
              textAlign: .center,
              style: .new(
                color: Colors.white,
                fontFamily: FontManager.geDinerOne,
                fontSize: FontSizeManager.s12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
