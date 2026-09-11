import 'package:flutter/material.dart';

import '../../../core/resources/widgets/functions/add_image_button.dart';
import '../../../core/resources/widgets/functions/customTextField.dart';
import '../../../core/resources/widgets/space/horizontal_space.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../core/strings/string_manager.dart';

class TapSectionCreateNewGroup extends StatelessWidget {
  const TapSectionCreateNewGroup({
    super.key,
    required this.name,
    required this.desc,
    required this.nameKey,
  });

  final TextEditingController name;
  final TextEditingController desc;
  final GlobalKey<FormState> nameKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: nameKey,
          child: customTextField(
            controller: name,
            hintText: StringManager.groupName,
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
      ],
    );
  }
}
