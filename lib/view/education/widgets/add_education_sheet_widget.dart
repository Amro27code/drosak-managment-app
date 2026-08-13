import 'package:drosak_managment_app/view/education/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import 'add_image_button.dart';
import 'custom_add_button.dart';

void addEducationSheetWidget({
  required BuildContext context,
  required String? hintText,
  required TextEditingController controller,
  required ValueChanged<String> onSubmitted,
  required VoidCallback onTapAddInSheet,
  required String textInButton,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: ColorManager.black,
    // isScrollControlled: true,
    builder: (context) {
      return
      // Padding(
      // padding: EdgeInsets.only(
      //   bottom: MediaQuery.viewInsetsOf(context).bottom,
      // ),
      // child:
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(CircleRadiusManager.r30),
          ),
        ),
        padding: EdgeInsets.all(PaddingManager.p30),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Row(
              children: [
                addImageButton(),
                SizedBox(width: 10),
                customTextField(
                  controller: controller,
                  hintText: hintText,
                  onSubmitted: onSubmitted,
                ),
              ],
            ),
            verticalSpace(height: 40),
            customAddButton(
              onTapAddInSheet: onTapAddInSheet,
              textInButton: textInButton,
            ),
          ],
        ),
        // ),
      );
    },
  );
}
