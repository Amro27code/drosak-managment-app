import 'package:drosak_managment_app/controller/mainScreens/group_controller.dart';
import 'package:drosak_managment_app/view/group/widget/item_builder_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide RefreshCallback;
import '../../../core/numbers/height_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../../model/group/fk_group_appointment.dart';
import '../../../model/group/time_of_day_model.dart';

class BodyGroupScreen extends StatefulWidget {
  const BodyGroupScreen({
    super.key,
    required this.onRefresh,
    // required this.deleteFun,
    required this.editFun,
    required this.groupListStream,
    required this.streamTableList,
  });

  final RefreshCallback onRefresh;
  final Stream<List<AppointmentModel>> streamTableList;

  //
  // final VoidCallback deleteFun;
  final VoidCallback editFun;
  final Stream<List<FkGroupAppointment>> groupListStream;

  @override
  State<BodyGroupScreen> createState() => _BodyGroupScreenState();
}

class _BodyGroupScreenState extends State<BodyGroupScreen> {
  late GroupController _groupController;
  @override
  void initState() {
    super.initState();
    _groupController=GroupController(context);
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: StreamBuilder<List<FkGroupAppointment>>(
        stream: widget.groupListStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == .waiting) {
            return Center(child: CupertinoActivityIndicator());
          } else if ((snapshot.data ?? []).isEmpty) {
            return SizedBox();
          } else {
            return ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: PaddingManager.p16,
                vertical: PaddingManager.p18,
              ),
              itemCount: snapshot.data!.length + 1,
              separatorBuilder: (context, index) =>
                  verticalSpace(height: HeightManager.h16),
              itemBuilder: (context, index) => snapshot.data!.length == index
                  ? verticalSpace(height: 40)
                  : ItemBuilderGroup(
                      groupModel: snapshot.data![index],
                      deleteFun: () {
                        _groupController.deleteFun(snapshot.data![index]);
                      },
                      editFun: widget.editFun,
                      streamTableList: widget.streamTableList,
                      // educationModel: null,
                    ),
            );
          }
        },
      ),
    );
  }
}
