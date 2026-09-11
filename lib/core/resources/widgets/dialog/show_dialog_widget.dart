import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../numbers/font_size_manager.dart';

void showDialogPickImageMethod({
  required BuildContext context,
  required Future<void> Function({required ImageSource imageSource})
  onPressedPickImage,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context1) {
      return AlertDialog(
        backgroundColor: Colors.grey[800],
        title: Column(
          children: [
            ListTile(
              onTap: () {
                onPressedPickImage(imageSource: ImageSource.gallery);
                Navigator.of(context).pop();
              },
              title: Text(
                "Photo Library",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSizeManager.s15,
                ),
              ),
              trailing: Icon(Icons.image, color: Colors.white),
            ),
            ListTile(
              onTap: () {
                onPressedPickImage(imageSource: ImageSource.camera);
                Navigator.of(context).pop();
              },
              title: Text(
                "Take Photo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSizeManager.s15,
                ),
              ),
              trailing: Icon(Icons.camera_alt_outlined, color: Colors.white),
            ),
          ],
        ),
      );

      // return AlertDialog(
      //   title: Row(
      //     mainAxisAlignment: .spaceEvenly,
      //     children: [
      //       IconButton.filled(
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: ColorManager.primary,
      //           foregroundColor: Colors.white,
      //           iconSize: 40,
      //         ),
      //         onPressed: () {
      //           onPressedPickCamera(imageSource: ImageSource.camera);
      //           Navigator.pop(context);
      //         },
      //         icon: Icon(Icons.camera_alt_outlined),
      //       ),
      //       IconButton.filled(
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: ColorManager.primary,
      //           foregroundColor: Colors.white,
      //           iconSize: 40,
      //         ),
      //         onPressed: () {
      //           onPressedPickGallery(imageSource: ImageSource.gallery);
      //           Navigator.pop(context);
      //         },
      //         icon: Icon(Icons.image),
      //       ),
      //     ],
      //   ),
      //   icon: Row(
      //     mainAxisAlignment: .spaceBetween,
      //     children: [
      //       IconButton.filled(
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: Colors.red,
      //           foregroundColor: Colors.white,
      //           iconSize: 10,
      //         ),
      //         onPressed: () {
      //           Navigator.pop(context1);
      //         },
      //         icon: Icon(Icons.close),
      //       ),
      //       Text(
      //         "اختر من...",
      //         style: TextStyle(
      //           fontWeight: .w900,
      //           fontSize: FontSizeManager.s15,
      //           fontFamily: FontManager.geDinerOne,
      //         ),
      //       ),
      //     ],
      //   ),
      // );
    },
  );
}
