import 'package:flutter/material.dart';

import '../../../core/numbers/radius_circle_avatar.dart';
import '../../../core/resources/color_manager.dart';

InkWell addImageButton({required VoidCallback pickImageMethod}) {
  return InkWell(
    onTap: pickImageMethod,
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
    child: CircleAvatar(
      radius: RadiusCircleAvatar.rc15,
      backgroundColor: ColorManager.primary,
      child: Icon(Icons.image, size: 14, color: Colors.white),
    ),
  );
}
