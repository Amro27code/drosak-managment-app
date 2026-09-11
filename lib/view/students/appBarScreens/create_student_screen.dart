import 'package:drosak_managment_app/controller/mainScreens/add_new_student_controller.dart';
import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/resources/widgets/functions/custom_table_widget.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';
import 'package:drosak_managment_app/view/students/widget/middle_section_create_new_student.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/widgets/functions/customTextField.dart';
import '../../../core/resources/widgets/functions/custom_row_elevated_button.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../../group/widget/custom_app_bar_new_group.dart';
import '../widget/tap_section_widget_student.dart';

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
                TapSectionCreateNewStudent(
                  name: _addNewStudentController.nameEditingController,
                  desc: _addNewStudentController.noteEditingController,
                  nameKey: _addNewStudentController.nameKey,
                  pickImageMethod: _addNewStudentController.pickImageMethod,
                  imageStream: _addNewStudentController.imageOutputController,
                  onDeleteImage: _addNewStudentController.onDeleteImage,
                ),
                verticalSpace(height: 21),
                StreamBuilder<EducationModel?>(
                  stream: _addNewStudentController.outputEducationEdit,
                  builder: (context, asyncSnapshot) {
                    return MiddleSectionCreateNewStudent(
                      onChangedStage: _addNewStudentController.onChangedStage,
                      initialEduItem: asyncSnapshot.data,
                      // _addNewGroupController.eduGroup,
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
                  onPressedDelete:
                      _addNewStudentController.onPressedDeleteRecord,
                  streamTableList: _addNewStudentController.outputListNewTable,
                ),

                Form(
                  key: _addNewStudentController.phoneKey,
                  child: customTextField(
                    controller:
                        _addNewStudentController.phoneNumberEditingController,
                    hintText: StringManager.phoneNumber,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "لا يمكن تركه فارغ";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                verticalSpace(height: 21),
                Form(
                  child: customTextField(
                    controller:
                        _addNewStudentController.dateTextEditingController,
                    hintText: StringManager.date,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "لا يمكن تركه فارغ";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                verticalSpace(height: 21),
                CustomRowElevatedButtonWidget(
                  iconData: Icons.save,
                  text:
                      _addNewStudentController.status ==
                          StringManager.editThisGroup
                      ? StringManager.edit
                      : StringManager.saveAll,
                  onPressed: _addNewStudentController
                      .editOrSaveAll, //!!!!!!!!!!!!!!!!!
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
