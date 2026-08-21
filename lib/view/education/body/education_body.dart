import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:flutter/cupertino.dart' hide RefreshCallback;
import 'package:flutter/material.dart';

import '../../../core/numbers/height_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../model/education/education_model.dart';
import '../widgets/item_biulder_education.dart';

class EducationBody extends StatelessWidget {
  const EducationBody({
    super.key,
    required this.stream,
    required this.onDismissedDeleteFun,
    required this.onDismissedUpdateFun,
    required this.onRefresh,
  });

  // final DismissDirectionCallback onDismissed;
  final Stream<List<EducationModel>> stream;
  final RefreshCallback onRefresh;

  final Function(EducationModel educationModel) onDismissedDeleteFun;
  final Function(EducationModel educationModel) onDismissedUpdateFun;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapShot) {
        return snapShot.connectionState == ConnectionState.waiting
            ? Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                  color: ColorManager.primary,
                ),
              )
            : RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: PaddingManager.p16,
                    vertical: PaddingManager.p18,
                  ),
                  itemCount:
                      (snapShot.data ?? []).length + 1, //_educationList.length,
                  separatorBuilder: (context, index) =>
                      verticalSpace(height: HeightManager.h16),
                  itemBuilder: (context, index) =>
                      snapShot.data!.length == index
                      ? verticalSpace(height: 40)
                      : ItemBuilderEducation(
                          educationModel: snapShot.data![index],
                          onDismissedDeleteFun: onDismissedDeleteFun,
                          onDismissedUpdateFun: onDismissedUpdateFun,
                        ),
                ),
              );
      },
    );
  }
}
