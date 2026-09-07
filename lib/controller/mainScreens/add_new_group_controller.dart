import 'dart:async';
import 'dart:developer';
import 'package:drosak_managment_app/core/database/appointment_db.dart';
import 'package:drosak_managment_app/core/database/group_db.dart';
import 'package:drosak_managment_app/core/resources/widgets/functions/convert_time_of_period_to_string.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/group/fk_group_appointment.dart';
import 'package:drosak_managment_app/model/group/group_model.dart';
import 'package:drosak_managment_app/model/group/time_of_day_model.dart';
import 'package:flutter/material.dart';
import '../../core/database/education_db.dart';
import '../../model/education/education_model.dart';

class AddNewGroupController {
  BuildContext context;

  List<AppointmentModel> listAppointment = [];
  late TextEditingController nameEditingController;
  late TextEditingController descEditingController;

  late StreamController<String?> _radioButtonStreamController;
  late Sink<String?> _inputRadioButton;
  late Stream<String?> outputRadioButton;

  late StreamController<List<EducationModel>> _listEducationStreamController;
  late Sink<List<EducationModel>> _inputListEducation;
  late Stream<List<EducationModel>> outputListEducation;

  late StreamController<EducationModel?> _educationEditStreamController;
  late Sink<EducationModel?> _inputEducationEdit;
  late Stream<EducationModel?> outputEducationEdit;

  late StreamController<List<AppointmentModel>> _listNewTableStreamController;
  late Sink<List<AppointmentModel>> _inputListNewTable;
  late Stream<List<AppointmentModel>> outputListNewTable;

  late GlobalKey<FormState> nameKey;

  List<EducationModel> listNameEducations = [];

  TimeOfDay? timeGroup;
  String? dayGroup;
  EducationModel? eduGroup;
  String? groupValueRadio = StringManager.am;

  AddNewGroupController(this.context) {
    nameEditingController = TextEditingController();
    descEditingController = TextEditingController();

    _radioButtonStreamController = StreamController();
    _inputRadioButton = _radioButtonStreamController.sink;
    outputRadioButton = _radioButtonStreamController.stream.asBroadcastStream();

    _listEducationStreamController = StreamController();
    _inputListEducation = _listEducationStreamController.sink;
    outputListEducation = _listEducationStreamController.stream
        .asBroadcastStream();

    _listNewTableStreamController = StreamController();
    _inputListNewTable = _listNewTableStreamController.sink;
    outputListNewTable = _listNewTableStreamController.stream
        .asBroadcastStream();

    _educationEditStreamController = StreamController();
    _inputEducationEdit = _educationEditStreamController.sink;
    outputEducationEdit = _educationEditStreamController.stream
        .asBroadcastStream();

    _inputRadioButton.add(groupValueRadio);
    _inputListEducation.add(listNameEducations);
    _inputEducationEdit.add(eduGroup);

    nameKey = GlobalKey<FormState>();
    getAll();
    _inputListEducation.add(listNameEducations);
  }

  void getAll() async {
    await getAllEducations();
  }

  Future<List<EducationModel>> getAllEducations() async {
    EducationOperations educationOperations = EducationOperations();
    listNameEducations = await educationOperations.selectSearchEducations();
    _inputListEducation.add(listNameEducations);
    return listNameEducations;
  }

  void onChangedStage(EducationModel? value) {
    // _closeKeyboard();
    eduGroup = value;
  }

  void onChangedDay(String? day) {
    // _closeKeyboard();
    dayGroup = day;
  }

  late String status = StringManager.addNewGroup;
  late int idNewGroup;

  //? getArgsFromBackScreen
  void getArgsFromBackScreen() {
    var arg = ModalRoute.of(context); //!.settings.arguments as Map;
    // var arg = ModalRoute.of(context)!.settings.arguments as Map;
    if (ModalRoute.of(context) != null) {
      var arguments = arg!.settings.arguments;
      if (arguments is Map) {
        //   ? now add
        getArgsMap(arguments);
        // print(arguments);
        _inputEducationEdit.add(eduGroup);
      } else {
        status = arguments as String;
      }
    }
  }

  late GroupModel groupModel;

  void getArgsMap(var arguments) {
    if (arguments.containsKey("status")) {
      status = arguments["status"] as String;
    }
    if (arguments.containsKey("fkModel")) {
      if (arguments["fkModel"] is FkGroupAppointment) {
        listAppointment =
            arguments["fkModel"].appointments as List<AppointmentModel>;
        _inputListNewTable.add(listAppointment);

        groupModel = arguments["fkModel"].groupModel as GroupModel;
        print("groupModel=================");
        print(groupModel);
        nameEditingController.text = groupModel.name;
        descEditingController.text = groupModel.note ?? "";
        int? eduId = arguments["fkModel"].groupModel.educationFKId as int?;
        // log(listNameEducations.toString());
        List listEdu = listNameEducations
            .where((element) => element.id == eduId)
            .toList();

        if (listEdu.isNotEmpty) {
          eduGroup = listEdu[0];
          _inputEducationEdit.add(eduGroup);
        }
      }
    }
  }

  void onChangedRadio(String? value) {
    groupValueRadio = value;
    _inputRadioButton.add(groupValueRadio);
  }

  void _closeKeyboard() {
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    FocusScope.of(context).unfocus();
  }

  Future<void> onPressedChooseTime() async {
    // _closeKeyboard();

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: timeGroup ?? TimeOfDay(hour: 1, minute: 0),
      cancelText: StringManager.cancel,
      confirmText: StringManager.choose,
      helpText: StringManager.chooseTime,
    );
    if (time != null) {
      timeGroup = time;
    }
  }

  Future<void> onPressedSave() async {
    if (timeGroup == null ||
        dayGroup == null ||
        nameEditingController.text.isEmpty ||
        eduGroup == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("يجب ملئ كل الحقول المطلوبة"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      listAppointment.add(
        AppointmentModel(
          day: dayGroup!,
          time: convertTimeOfDayToString(timeGroup!),
          tPMorAM: periodForTimeOfDay(timeGroup!),
        ),
      );
      _inputListNewTable.add(listAppointment);
    }
  }

  Future<void> onPressedDeleteRecord(int index) async {
    AppointmentOperations appointmentOperations = AppointmentOperations();

    await appointmentOperations.deleteFromAppointmentTable(
      listAppointment[index],
    );

    listAppointment.removeAt(index);
    _inputListNewTable.add(listAppointment);
    print("listAppointment");
    print(listAppointment);
  }

  Future<void> onPressedSaveAll() async {
    GroupOperations groupOperations = GroupOperations();

    if (listAppointment.isNotEmpty) {
      int x = await groupOperations.insertToGroupTable(
        GroupModel(
          name: nameEditingController.text.trim(),
          note: descEditingController.text.trim(),
          // id: 0,
          educationFKId: eduGroup!.id,
        ),
      );
      if (listAppointment.isNotEmpty) {
        for (AppointmentModel element in listAppointment) {
          AppointmentOperations appointmentOperations = AppointmentOperations();
          await appointmentOperations.insertToAppointmentTable(element, x);
        }
      }
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("املأ الحقول يا محترم"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> editOrSaveAll() async {
    if (status == StringManager.editThisGroup) {
      await edit();
    } else {
      await onPressedSaveAll();
    }
  }

  Future<void> edit() async {
    print("Now Edit");
    print(listAppointment);
    GroupOperations groupOperations = GroupOperations();
    if (listAppointment.isNotEmpty) {
      //? String nameGroup=nameEditingController.text.trim();
      GroupModel g = GroupModel(
        id: groupModel.id,
        educationFKId: eduGroup!.id,
        name: nameEditingController.text.trim(),
        note: descEditingController.text.trim(),
      );
      print(nameEditingController.text.trim());
      print(descEditingController.text.trim());
      log(g.toString());
      bool x = await groupOperations.updateGroupTable(g);
      print("$x  ()++> groupModel");

      AppointmentOperations appointmentOperations = AppointmentOperations();
      bool deleteAll = await appointmentOperations.deleteAllAppointmentForGroup(
        g,
      );
      print("deleteAll= $deleteAll");

      if (listAppointment.isNotEmpty) {
        for (AppointmentModel element in listAppointment) {
          AppointmentOperations appointmentOperations = AppointmentOperations();
          await appointmentOperations.insertToAppointmentTable(
            element,
            groupModel.id,
          );
        }
      }

      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("املأ الحقول يا محترم"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
