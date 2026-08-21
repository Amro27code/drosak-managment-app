import 'dart:io';
import 'package:drosak_managment_app/core/numbers/height_manager.dart';
import 'package:drosak_managment_app/view/education/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/widgets/space/horizontal_space.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import 'add_image_button.dart';
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
   padding: EdgeInsets.only(
     bottom: MediaQuery.of(context).viewInsets.bottom,
   ),
   child: Container(
     constraints: BoxConstraints(maxHeight: HeightManager.h550),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.vertical(
         top: Radius.circular(CircleRadiusManager.r30),
       ),
     ),
     padding: EdgeInsets.all(PaddingManager.p30),
     child: Column(
       // mainAxisAlignment: .center,
       mainAxisSize: .min,
       // crossAxisAlignment: .center,
       children: [
         Row(
           children: [
             addImageButton(pickImageMethod: pickImageMethod),
             horizontalSpace(width: 10),
             Expanded(
               child: Form(
                 key: formKey,
                 child: customTextField(
                   controller: nameController,
                   hintText: hintText,
                   onSubmitted: onSubmitted,
                   validator: (String? value) {
                     if (value == null || value.isEmpty) {
                       return "لا يمكن تركه فارغ";
                     } else {
                       return null;
                     }
                   },
                 ),
               ),
             ),
           ],
         ),
         verticalSpace(height: 12),
         customTextField(
           controller: descController,
           hintText: hintTextDesc,
           onSubmitted: onSubmittedDesc,
           maxLines: 3,
           validator: (String? value) {},
         ),
         verticalSpace(height: 40),

         StreamBuilder(
           stream: imageStream,
           builder: (context, snapShot) {
             if (snapShot.connectionState == ConnectionState.waiting) {
               return SizedBox();
               //   Center(
               //   child: CupertinoActivityIndicator(radius: 20),
               // );
             } else if (snapShot.data == null||(snapShot.data??"").isEmpty) {
               return SizedBox();
             } else if (snapShot.data != null) {
               return Column(
                 children: [
                   Stack(
                     children: [
                       Image.file(
                         File(snapShot.data!),
                         errorBuilder: (context, error, stackTrace) =>
                             Text(
                               "Not Found",
                               style: TextStyle(color: Colors.white),
                             ),
                         // width: WidthManager.w32,
                         height: HeightManager.h200,
                         width: .infinity,
                         fit: .cover,
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
                   ),
                   verticalSpace(height: 15),
                 ],
               );
             } else {
               return SizedBox();
             }
           },
         ),

         customAddButton(
           onTapAddInSheet: onTapAddInSheet,
           textInButton: textInButton,
         ),
       ],
     ),
     // ),
   ),
 );


}
