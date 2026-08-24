import 'package:drosak_managment_app/core/numbers/padding_margin_manager.dart';
import 'package:drosak_managment_app/core/resources/widgets/functions/custom_table_widget.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:flutter/material.dart';
import '../../../controller/mainScreens/add_new_group_controller.dart';
import '../../../core/resources/widgets/functions/custom_row_elevated_button.dart';
import '../../../core/resources/widgets/space/vertical_space.dart';
import '../widget/MiddleSectionCreateNewGroup.dart';
import '../widget/custom_app_bar_new_group.dart';
import '../widget/tap_section_widget.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  late AddNewGroupController _addNewGroupController;

  @override
  void initState() {
    super.initState();
    _addNewGroupController = AddNewGroupController(context);
  }

  List<String> items = ["amro", "ammar"];

  @override
  Widget build(BuildContext context) {
    _addNewGroupController.getArgsFromBackScreen();
    return Scaffold(
      appBar: CustomAppBarAddNewGroup(
        // addNewGroupController: _addNewGroupController,
        textTitle: _addNewGroupController.status,
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
                  name: _addNewGroupController.nameEditingController,
                  desc: _addNewGroupController.descEditingController,
                  nameKey: _addNewGroupController.nameKey,
                ),
                verticalSpace(height: 21),
                MiddleSectionCreateNewGroup(
                  listEducationName: _addNewGroupController.listNameEducations,
                  onChangedDay: _addNewGroupController.onChangedEducationStage,
                  onPressedChooseTime: () {},
                  onPressedSave: () {},
                  radioButtonStream: _addNewGroupController.outputRadioButton,
                  groupValueAM: _addNewGroupController.timeGroup,
                  timeGroup: _addNewGroupController.timeGroup,
                  onChangedRadio: _addNewGroupController.onChangedRadio,
                ),
                verticalSpace(height: 21),
                CustomTableWidget(
                  listGroupModel: _addNewGroupController.listGroupModel,
                  isEdit: true,
                  lengthSecondaryRow: 1,
                ),
                verticalSpace(height: 21),
                CustomRowElevatedButtonWidget(
                  iconData: Icons.save,
                  text: StringManager.saveAll,
                  onPressed: () {},
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
