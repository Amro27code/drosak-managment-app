import 'package:flutter/material.dart';

import '../../../core/numbers/height_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../model/education/education_model.dart';
import '../widgets/item_biulder_education.dart';

class EducationBody extends StatelessWidget {
  const EducationBody({
    super.key,
    required this._educationList,
  });

  final List<EducationModel> _educationList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: PaddingManager.p16,
        vertical: PaddingManager.p18,
      ),
      itemCount: _educationList.length,
      separatorBuilder: (context, index) =>
          verticalSpace(height: HeightManager.h16),
      itemBuilder: (context, index) => ItemBuilderEducation(
        educationModel: _educationList[index],
      ),
    );
  }
}
