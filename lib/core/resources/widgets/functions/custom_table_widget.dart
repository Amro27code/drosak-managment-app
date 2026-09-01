import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/group/fk_group_appointment.dart';
import 'package:drosak_managment_app/model/group/group_model.dart';
import 'package:drosak_managment_app/model/group/time_of_day_model.dart';
import 'package:flutter/material.dart';

import '../../../numbers/padding_margin_manager.dart';
import '../../../numbers/radius_circle_avatar.dart';
import '../../color_manager.dart';

class CustomTableWidget extends StatelessWidget {
  const CustomTableWidget({
    super.key,
    this.tableColor = ColorManager.primary,
    this.primaryRowColor = ColorManager.primary,
    this.secondaryRowColor = ColorManager.primary,
    required this.isEdit,
    required this.streamTableList,
    this.onPressedDelete,
    this.groupId,
    this.notStream = false,
    this.fkList,
  });

  final Color tableColor;
  final Color primaryRowColor;
  final int? groupId;
  final Color secondaryRowColor;
  final Stream<List<AppointmentModel>> streamTableList;
  final FkGroupAppointment? fkList;

  // final int lengthSecondaryRow;
  final bool isEdit;
  final bool notStream;
  final void Function(int)? onPressedDelete;

  // final List<TimeOfDayModel> listGroupModel;

  @override
  Widget build(BuildContext context) {
    return notStream
        ?
          // asyncSnapshot.connectionState == .waiting ||
          //     asyncSnapshot.connectionState == .none
          //     ? SizedBox()
          //     :
          fkList == null
              ? SizedBox()
              : Table(
                  border: TableBorder.all(
                    color: tableColor,
                    borderRadius: BorderRadius.circular(
                      RadiusCircleAvatar.rc15,
                    ),
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: PaddingManager.p4,
                            horizontal: PaddingManager.p12,
                          ),
                          child: Center(
                            child: Text(
                              StringManager.day,
                              // textAlign: .end,
                              style: TextStyle(color: primaryRowColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: PaddingManager.p4,
                            horizontal: PaddingManager.p12,
                          ),
                          child: Center(
                            child: Text(
                              StringManager.time,
                              style: TextStyle(color: primaryRowColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: PaddingManager.p4,
                            horizontal: PaddingManager.p12,
                          ),
                          child: Center(
                            child: Text(
                              StringManager.tPMorAM,
                              style: TextStyle(color: primaryRowColor),
                            ),
                          ),
                        ),
                        if (isEdit) Center(child: Text(" ")),
                      ],
                    ),
                    //!!!!!!!!!!!!!!!!!!
                    for (int i = 0; i < fkList!.appointments.length; i++)
                      TableRow(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        children: [
                          //! Replace to List.generate
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: PaddingManager.p4,
                              horizontal: PaddingManager.p12,
                            ),
                            child: Center(
                              child: Text(
                                fkList!.appointments[i].day,
                                style: TextStyle(color: secondaryRowColor),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: PaddingManager.p4,
                              horizontal: PaddingManager.p12,
                            ),
                            child: Center(
                              child: Text(
                                fkList!.appointments[i].time,
                                style: TextStyle(color: secondaryRowColor),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: PaddingManager.p4,
                              horizontal: PaddingManager.p12,
                            ),
                            child: Center(
                              child: Text(
                                fkList!.appointments[i].tPMorAM,
                                style: TextStyle(color: secondaryRowColor),
                              ),
                            ),
                          ),
                          if (isEdit || onPressedDelete == null)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: PaddingManager.p4,
                                horizontal: PaddingManager.p12,
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    onPressedDelete!(i);
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    size: 22,
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                )
        : StreamBuilder(
            stream: streamTableList,
            builder: (context, asyncSnapshot) {
              return asyncSnapshot.connectionState == .waiting ||
                      asyncSnapshot.connectionState == .none
                  ? SizedBox()
                  : Table(
                      border: TableBorder.all(
                        color: tableColor,
                        borderRadius: BorderRadius.circular(
                          RadiusCircleAvatar.rc15,
                        ),
                      ),
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: PaddingManager.p4,
                                horizontal: PaddingManager.p12,
                              ),
                              child: Center(
                                child: Text(
                                  StringManager.day,
                                  // textAlign: .end,
                                  style: TextStyle(color: primaryRowColor),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: PaddingManager.p4,
                                horizontal: PaddingManager.p12,
                              ),
                              child: Center(
                                child: Text(
                                  StringManager.time,
                                  style: TextStyle(color: primaryRowColor),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: PaddingManager.p4,
                                horizontal: PaddingManager.p12,
                              ),
                              child: Center(
                                child: Text(
                                  StringManager.tPMorAM,
                                  style: TextStyle(color: primaryRowColor),
                                ),
                              ),
                            ),
                            if (isEdit) Center(child: Text(" ")),
                          ],
                        ),
                        for (int i = 0; i < asyncSnapshot.data!.length; i++)
                          if (groupId == asyncSnapshot.data![i].appointmentId ||
                              groupId == null)
                            TableRow(
                              //!!!!!!!!!!!!!!!!!!
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              children: [
                                //! Replace to List.generate
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: PaddingManager.p4,
                                    horizontal: PaddingManager.p12,
                                  ),
                                  child: Center(
                                    child: Text(
                                      asyncSnapshot.data![i].day,
                                      style: TextStyle(
                                        color: secondaryRowColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: PaddingManager.p4,
                                    horizontal: PaddingManager.p12,
                                  ),
                                  child: Center(
                                    child: Text(
                                      asyncSnapshot.data![i].time,
                                      style: TextStyle(
                                        color: secondaryRowColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: PaddingManager.p4,
                                    horizontal: PaddingManager.p12,
                                  ),
                                  child: Center(
                                    child: Text(
                                      asyncSnapshot.data![i].tPMorAM,
                                      style: TextStyle(
                                        color: secondaryRowColor,
                                      ),
                                    ),
                                  ),
                                ),
                                if (isEdit || onPressedDelete == null)
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: PaddingManager.p4,
                                      horizontal: PaddingManager.p12,
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          onPressedDelete!(i);
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          size: 22,
                                          color: ColorManager.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                      ],
                    );
            },
          );
  }
}
