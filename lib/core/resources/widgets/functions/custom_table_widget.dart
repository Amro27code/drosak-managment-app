import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/group/group_model.dart';
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

    required this.lengthSecondaryRow,
    required this.isEdit,
    required this.listGroupModel,
  });

  final Color tableColor;
  final Color primaryRowColor;
  final Color secondaryRowColor;

  final int lengthSecondaryRow;
  final bool isEdit;
  final List<GroupModel> listGroupModel;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: tableColor,
        borderRadius: BorderRadius.circular(RadiusCircleAvatar.rc15),
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
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
        for (int i = 0; i < listGroupModel.length; i++)
          TableRow(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            children: [
              //! Replace to List.generate
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: PaddingManager.p4,
                  horizontal: PaddingManager.p12,
                ),
                child: Center(
                  child: Text(
                    listGroupModel[i].day,
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
                    listGroupModel[i].time,
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
                    listGroupModel[i].tPMorAM,
                    style: TextStyle(color: secondaryRowColor),
                  ),
                ),
              ),
              if (isEdit)
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: PaddingManager.p4,
                    horizontal: PaddingManager.p12,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
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
  }
}
