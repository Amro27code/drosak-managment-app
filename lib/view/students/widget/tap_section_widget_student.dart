import 'dart:io';
import 'package:drosak_managment_app/core/numbers/circle_radius_manager.dart';
import 'package:flutter/material.dart';
import '../../../core/numbers/height_manager.dart';
import '../../../core/resources/widgets/functions/customTextField.dart';
import '../../../core/resources/widgets/pickImage/upload_image_style_widget.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../core/strings/string_manager.dart';

class TapSectionCreateNewStudent extends StatelessWidget {
  const TapSectionCreateNewStudent({
    super.key,
    required this.name,
    required this.desc,
    required this.nameKey,
    required this.pickImageMethod,
    required this.imageStream,
    required this.onDeleteImage,
  });

  final TextEditingController name;
  final TextEditingController desc;
  final void Function() pickImageMethod;
  final GlobalKey<FormState> nameKey;

  final Stream<String?> imageStream;

  final VoidCallback onDeleteImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: nameKey,
          child: customTextField(
            controller: name,
            hintText: StringManager.studentName,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "لا يمكن تركه فارغ";
              } else {
                return null;
              }
            },
          ),
        ),
        verticalSpace(height: 21),
        customTextField(
          controller: desc,
          hintText: StringManager.notes,
          maxLines: 3,
          validator: (String? value) {
            return null;
          },
        ),
        verticalSpace(height: 21),
        StreamBuilder(
          stream: imageStream,
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return UploadImageStyleWidget(pickImageMethod: pickImageMethod);
            } else if (snapShot.data == null || (snapShot.data ?? "").isEmpty) {
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
                      // width: WidthManager.w32,
                      height: HeightManager.h200,
                      width: .infinity,
                      fit: .cover,
                    ),
                  ),
                  // if (snapShot.data != null)
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
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
