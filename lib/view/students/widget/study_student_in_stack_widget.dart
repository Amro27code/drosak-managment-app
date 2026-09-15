import 'dart:io';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/numbers/height_manager.dart';
import '../../../core/numbers/width_manager.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../core/strings/font_manager.dart';
import '../../../model/group/time_of_day_model.dart';
import '../../../model/students/student_model.dart';
import 'custom_table_student_appointment.dart';

class StudyStudentInStackWidget extends StatelessWidget {
  const StudyStudentInStackWidget({
    super.key,
    required this.studentModel,
    this.streamTableList,
    required this.editFun,
    required this.deleteFun,
  });

  final StudentModel studentModel;
  final Stream<List<AppointmentModel>>? streamTableList;
  final VoidCallback editFun;
  final VoidCallback deleteFun;


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: .rtl,
      child: Container(
        // height: HeightManager.h103,
        padding: EdgeInsetsGeometry.only(
          left: 10.w,
          top: 6.h,
          right: 22.w,
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          color: ColorManager.black,
          borderRadius: BorderRadius.circular(CircleRadiusManager.r18),
          border: Border.all(color: ColorManager.primary),
          boxShadow: [
            BoxShadow(
              color: ColorManager.primary,
              blurRadius: 10,
              offset: Offset(0, 0),
              spreadRadius: -3,
              blurStyle: .outer,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    // mainAxisAlignment: .spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          studentModel.name,
                          textAlign: .start,
                          style: TextStyle(
                            fontSize: FontSizeManager.s16,
                            color: Colors.white,
                            fontWeight: .w500,
                            fontFamily: FontManager.geDinerOne,
                          ),
                        ),
                      ),
                      Spacer(),
                      PopupMenuButton(
                        //! اسحبه
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: editFun,
                            child: Text(StringManager.edit),
                          ),
                          PopupMenuItem(
                            onTap: deleteFun,
                            child: Text(StringManager.remove),
                          ),
                        ],
                        child: Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.white,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          CircleRadiusManager.r50,
                        ),
                        child:
                        // studentModel.imagePath
                            // == null
                            // ? SvgPicture.asset(
                            //     AssetsValueManager.bnb3,
                            //     height: HeightManager.h64,
                            //     width: WidthManager.w64,
                            //   )
                            // :
                          Image.file(
                                File(studentModel.imagePath),
                                height: HeightManager.h64,
                                fit: .cover,
                                width: WidthManager.w64,
                                errorBuilder: (context, error, stackTrace) =>
                                    SvgPicture.asset(
                                      AssetsValueManager.bnb3,
                                      height: HeightManager.h64,
                                      width: WidthManager.w64,
                                    ),
                              ),
                      ),
                    ],
                  ),
                  verticalSpace(height: 5),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: studentModel.eduName,
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: " / ",
                          style: TextStyle(color: Colors.white38),
                        ),
                        TextSpan(
                          text: studentModel.groupName,
                          style: TextStyle(color: ColorManager.primary),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(height: 15),
                  //! TABLE
                  CustomTableForStudentWidget(
                    secondaryRowColor: Colors.white,
                    tableColor: Colors.white,
                    isEdit: false,
                    // streamTableList: streamTableList,
                    notStream: true,
                    fkList: studentModel,
                    groupId: studentModel.id,
                  ),
                  verticalSpace(height: 5),
                  Text(
                    "${StringManager.notes}: ${studentModel.note ?? ''}",
                    style: TextStyle(
                      fontSize: FontSizeManager.s10,
                      fontWeight: .w400,
                      color: ColorManager.subtitle,
                      fontFamily: FontManager.geDinerOne,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
