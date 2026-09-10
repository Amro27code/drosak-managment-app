import 'package:drosak_managment_app/controller/mainScreens/add_new_student_controller.dart';
import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/resources/widgets/functions/custom_table_widget.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/widgets/functions/custom_row_elevated_button.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../group/widget/custom_app_bar_new_group.dart';
import '../../group/widget/middle_section_create_new_group.dart';
import '../../group/widget/tap_section_widget.dart';

class CreateStudentScreen extends StatefulWidget {
  const CreateStudentScreen({super.key});

  @override
  State<CreateStudentScreen> createState() => _CreateStudentScreenState();
}

class _CreateStudentScreenState extends State<CreateStudentScreen> {
  late AddNewStudentController _addNewStudentController;

  @override
  void initState() {
    super.initState();
    _addNewStudentController = AddNewStudentController(context);
  }

  @override
  Widget build(BuildContext context) {
    _addNewStudentController.getArgsFromBackScreen();
    return Scaffold(
      appBar: CustomAppBarAddNewGroup(
        // addNewGroupController: _addNewGroupController,
        textTitle: _addNewStudentController.status,
      ),
      body: Directionality(
        textDirection: .rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingManager.p12,
            vertical: PaddingManager.p24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TapSectionCreateNewGroup(
                  name: _addNewStudentController.nameEditingController,
                  desc: _addNewStudentController.noteEditingController,
                  nameKey: _addNewStudentController.nameKey,
                ),
                verticalSpace(height: 21),
                StreamBuilder<EducationModel?>(
                  stream: _addNewStudentController.outputEducationEdit,
                  builder: (context, asyncSnapshot) {
                    return MiddleSectionCreateNewGroup(
                      onChangedDay: _addNewStudentController.onChangedDay,
                      onChangedStage: _addNewStudentController.onChangedStage,
                      onPressedChooseTime:
                          _addNewStudentController.onPressedChooseTime,
                      onPressedSave: _addNewStudentController.onPressedSave,
                      radioButtonStream:
                          _addNewStudentController.outputRadioButton,
                      initialEduItem: asyncSnapshot.data,
                      // _addNewGroupController.eduGroup,
                      timeGroup: _addNewStudentController.timeGroup,
                      onChangedRadio: _addNewStudentController.onChangedRadio,
                      streamListEducation:
                          _addNewStudentController.outputListEducation,
                      selectedEduInEdit:
                          _addNewStudentController.outputEducationEdit,
                    );
                  },
                ),
                verticalSpace(height: 21),
                CustomTableWidget(
                  // listGroupModel: _addNewGroupController.newListGroupModel,
                  isEdit: true,
                  onPressedDelete: _addNewStudentController.onPressedDeleteRecord,
                  streamTableList: _addNewStudentController.outputListNewTable,
                ),
                verticalSpace(height: 21),
                CustomRowElevatedButtonWidget(
                  iconData: Icons.save,
                  text:
                      _addNewStudentController.status ==
                          StringManager.editThisGroup
                      ? StringManager.edit
                      : StringManager.saveAll,
                  onPressed:
                      _addNewStudentController.editOrSaveAll, //!!!!!!!!!!!!!!!!!
                  // width: WidthManager.w95,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
