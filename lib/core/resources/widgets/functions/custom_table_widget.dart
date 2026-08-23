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
    required this.day,
    required this.time,
    required this.tPM_OR_AM,
    required this.lengthSecondaryRow,
    required this.isEdit,
  });

  final Color tableColor;
  final Color primaryRowColor;
  final Color secondaryRowColor;
  final String day;
  final String time;
  final String tPM_OR_AM;
  final int lengthSecondaryRow;
  final bool isEdit;

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
                  "اليوم",
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
                child: Text("الوقت", style: TextStyle(color: primaryRowColor)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: PaddingManager.p4,
                horizontal: PaddingManager.p12,
              ),
              child: Center(
                child: Text("م / ص", style: TextStyle(color: primaryRowColor)),
              ),
            ),
            if (isEdit) Center(child: Text(" ")),
          ],
        ),
        for (int i = 1; i <= lengthSecondaryRow; i++)
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
                  child: Text(day, style: TextStyle(color: secondaryRowColor)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: PaddingManager.p4,
                  horizontal: PaddingManager.p12,
                ),
                child: Center(
                  child: Text(time, style: TextStyle(color: secondaryRowColor)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: PaddingManager.p4,
                  horizontal: PaddingManager.p12,
                ),
                child: Center(
                  child: Text(
                    tPM_OR_AM,
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
