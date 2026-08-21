import 'package:drosak_managment_app/view/group/widget/item_builder_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide RefreshCallback;

import '../../../core/numbers/height_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../model/education/education_model.dart';
import '../../education/widgets/item_biulder_education.dart';

class BodyGroupScreen extends StatelessWidget {
  const BodyGroupScreen({
    super.key,
    required this.onRefresh,
    required this.onDismissedDeleteFun,
    required this.onDismissedUpdateFun,
  });

  // final Stream<List<EducationModel>> stream;
  final RefreshCallback onRefresh;

  //
  final Function(EducationModel educationModel) onDismissedDeleteFun;
  final Function(EducationModel educationModel) onDismissedUpdateFun;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: PaddingManager.p16,
          vertical: PaddingManager.p18,
        ),
        itemCount: 3,
        separatorBuilder: (context, index) =>
            verticalSpace(height: HeightManager.h16),
        itemBuilder: (context, index) => 2 == index
            ? verticalSpace(height: 40)
            : ItemBuilderGroup(
                // educationModel: snapShot.data![index],
                onDismissedDeleteFun: onDismissedDeleteFun,
                onDismissedUpdateFun: onDismissedUpdateFun,
                // educationModel: null,
              ),
      ),
    );
  }
}
