import 'package:drosak_managment_app/model/group/fk_group_appointment.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/numbers/height_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import 'item_builder_group.dart';

class CustomResultSearchModelsGroup extends StatelessWidget {
  const CustomResultSearchModelsGroup({
    super.key,
    required this.getListSearch,
    required this.onDeleteFun,
    required this.onUpdateFun,
    // this.searchNow = false,
  });

  final Future<List<FkGroupAppointment>> getListSearch;
  final Function(FkGroupAppointment) onDeleteFun;
  final Function(FkGroupAppointment) onUpdateFun;
  // final bool searchNow;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FkGroupAppointment>>(
      //<List<FkGroupAppointment>>
      future: getListSearch,
      builder: (context, snapShot) {
        return snapShot.connectionState == ConnectionState.waiting ||
                snapShot.data == null
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
                itemCount: (snapShot.data ?? []).length + 1,
                separatorBuilder: (context, index) =>
                    verticalSpace(height: HeightManager.h16),
                itemBuilder: (context, index) => snapShot.data!.length == index
                    ? verticalSpace(height: 40)
                    : ItemBuilderGroup(
                        groupModel: snapShot.data![index],
                        deleteFun: () {
                          // _groupController.deleteFun(snapShot.data![index]);
                          onDeleteFun(snapShot.data![index]);
                        },
                        editFun: () {
                          onUpdateFun(snapShot.data![index]);
                        },
                        // streamTableList: Stream.fromFuture(snapShot.data![index].appointments),
                      ),
              );
      },
    );
  }
}
