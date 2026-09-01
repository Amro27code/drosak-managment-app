import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/numbers/circle_radius_manager.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/functions/custom_table_widget.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../core/strings/font_manager.dart';
import '../../../model/group/fk_group_appointment.dart';
import '../../../model/group/time_of_day_model.dart';

class StudyGroupInStackWidget extends StatelessWidget {
  const StudyGroupInStackWidget({
    super.key,
    required this.groupModel,
    required this.streamTableList, required this.editFun, required this.deleteFun,
  });

  final FkGroupAppointment groupModel;
  final Stream<List<AppointmentModel>> streamTableList;
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
                          groupModel.groupModel.name,
                          textAlign: .end,
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
                    ],
                  ),
                  verticalSpace(height: 5),
                  //! TABLE
                  CustomTableWidget(
                    secondaryRowColor: Colors.white,
                    tableColor: Colors.white,
                    isEdit: true,
                    streamTableList: streamTableList,
                    notStream: true,
                    fkList: groupModel,
                    groupId: groupModel.groupModel.id,
                  ),
                  verticalSpace(height: 5),
                  Text(
                    "${StringManager.notes}: ${groupModel.groupModel.note ?? ''}",
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
