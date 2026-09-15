import 'package:drosak_managment_app/view/students/widget/study_student_in_stack_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/numbers/font_size_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/strings/font_manager.dart';
import '../../../model/group/time_of_day_model.dart';
import '../../../model/students/student_model.dart';
import '../../Explore/widgets/back_positioned_item_in_stack.dart';
import '../../Explore/widgets/positioned_in_stack.dart';

class ItemBuilderStudent extends StatelessWidget {
  const ItemBuilderStudent({
    super.key,
    required this.editFun,
    required this.deleteFun,
    required this.studentModel,
    this.streamTableList,
  });

  // final EducationModel educationModel;

  // final DismissDirectionCallback onDismissed;


  final Stream<List<AppointmentModel>>? streamTableList;
  final VoidCallback deleteFun;
  final VoidCallback editFun;
  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: .none,
      children: [
        backPositionedItemInStack(numTopRight: -10),
        StudyStudentInStackWidget(
          studentModel: studentModel,
          editFun: editFun,
          deleteFun: deleteFun,
        ),
        buildPositionedInStack(
          radius: 16,
          color: ColorManager.black,
          numTopRight: -10,
        ),
        buildPositionedInStack(
          radius: 10,
          color: ColorManager.primary,
          numTopRight: -5,
          child: Text(
            "${studentModel.id}",
            textAlign: .center,
            style: .new(
              color: Colors.white,
              fontFamily: FontManager.geDinerOne,
              fontSize: FontSizeManager.s12,
            ),
          ),
        ),
      ],
    );
  }
}
