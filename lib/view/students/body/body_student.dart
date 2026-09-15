import 'package:drosak_managment_app/model/students/student_model.dart';
import 'package:drosak_managment_app/view/students/widget/item_builder_student.dart';
import 'package:flutter/cupertino.dart' hide RefreshCallback;
import 'package:flutter/material.dart';
import '../../../core/numbers/height_manager.dart';
import '../../../core/numbers/padding_margin_manager.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';

class BodyStudent extends StatelessWidget {
  final RefreshCallback onRefresh;

  final Stream<List<StudentModel>> studentListStream;

  final Function(int id) deleteFun;

  // var groupListStream;

  const BodyStudent({
    super.key,
    required this.onRefresh,
    required this.studentListStream,
    required this.deleteFun,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: StreamBuilder<List<StudentModel>>(
        stream: studentListStream,
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
                  : ItemBuilderStudent(
                      studentModel: snapshot.data![index],
                      deleteFun: () {
                        deleteFun(snapshot.data![index].id);
                      },
                      editFun: () {
                        // _groupController.editFun(snapshot.data![index]);
                      },
                      streamTableList: Stream.empty(),
                    ),
            );
          }
        },
      ),
    );
  }
}
