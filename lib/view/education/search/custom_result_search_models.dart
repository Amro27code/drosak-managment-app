import 'package:flutter/cupertino.dart';

import '../../../core/numbers/height_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../model/education/education_model.dart';
import '../widgets/item_biulder_education.dart';

class CustomResultSearchModels extends StatelessWidget {
  const CustomResultSearchModels({
    super.key,
    required this.getListSearch,
    required this.onDismissedDeleteFun,
    required this.onDismissedUpdateFun,
  });

  final Future<List<EducationModel>> getListSearch;
  final Function(EducationModel) onDismissedDeleteFun;
  final Function(EducationModel) onDismissedUpdateFun;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EducationModel>>(
      future: getListSearch,
      builder: (context, snapShot) {
        return snapShot.connectionState == ConnectionState.waiting
            ? Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                  color: ColorManager.primary,
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: PaddingManager.p16,
                  vertical: PaddingManager.p18,
                ),
                itemCount:
                    (snapShot.data ?? []).length + 1, //_educationList.length,
                separatorBuilder: (context, index) =>
                    verticalSpace(height: HeightManager.h16),
                itemBuilder: (context, index) => snapShot.data!.length == index
                    ? verticalSpace(height: 40)
                    : ItemBuilderEducation(
                        educationModel: snapShot.data![index],
                        onDismissedDeleteFun:
                        onDismissedDeleteFun,
                        onDismissedUpdateFun:
                           onDismissedUpdateFun,
                      ),
              );
      },
    );
  }
}
