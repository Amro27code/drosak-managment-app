import 'dart:io';
import 'package:drosak_managment_app/core/numbers/height_manager.dart';
import 'package:drosak_managment_app/core/resources/widgets/functions/customTextField.dart';
import 'package:flutter/material.dart';
import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/widgets/pickImage/upload_image_style_widget.dart';
import '../../../core/resources/widgets/space/horizontal_space.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../core/resources/widgets/functions/add_image_button.dart';
import 'custom_add_button.dart';

Padding addEducationSheetWidget({
  required BuildContext context,
  required String? hintText,
  required String? hintTextDesc,
  required TextEditingController nameController,
  required TextEditingController descController,
  required ValueChanged<String> onSubmitted,
  required ValueChanged<String> onSubmittedDesc,
  required VoidCallback onDeleteImage,
  required VoidCallback onTapAddInSheet,
  required String textInButton,
  required VoidCallback pickImageMethod,
  required Stream<String?> imageStream,
  required GlobalKey<FormState> formKey,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: Container(
      constraints: BoxConstraints(maxHeight: HeightManager.h550),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(CircleRadiusManager.r30),
        ),
      ),
      padding: EdgeInsets.all(PaddingManager.p30),
      child: Column(
        mainAxisSize: .min,
        children: [
          Form(
            key: formKey,
            child: customTextField(
              controller: nameController,
              hintText: hintText,
              onSubmitted: onSubmitted,
              validator: (String? value) {
                // if (value == null || value.isEmpty) {
                //   return "لا يمكن تركه فارغ";
                // } else {
                //   return null;
                // }
              },
            ),
          ),
          verticalSpace(height: 12),
          customTextField(
            controller: descController,
            hintText: hintTextDesc,
            onSubmitted: onSubmittedDesc,
            maxLines: 3,
            validator: (String? value) {
              return null;
            },
          ),
          verticalSpace(height: HeightManager.h25),

          StreamBuilder(
            stream: imageStream,

            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return UploadImageStyleWidget(pickImageMethod: pickImageMethod);
              } else if (snapShot.data == null ||
                  (snapShot.data ?? "").isEmpty) {
                return UploadImageStyleWidget(pickImageMethod: pickImageMethod);
              } else if (snapShot.data != null) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        CircleRadiusManager.r12,
                      ),
                      child: Image.file(
                        File(snapShot.data!),
                        errorBuilder: (context, error, stackTrace) => Text(
                          "Not Found",
                          style: TextStyle(color: Colors.white),
                        ),
                        height: HeightManager.h200,
                        width: .infinity,
                        fit: .cover,
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black45,
                        ),
                        onPressed: onDeleteImage,
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  ],
                );
              } else {
                return UploadImageStyleWidget(pickImageMethod: pickImageMethod);
              }
            },
          ),
          verticalSpace(height: HeightManager.h16),

          customAddButton(
            onTapAddInSheet: onTapAddInSheet,
            textInButton: textInButton,
          ),
        ],
      ),
    ),
  );
}
