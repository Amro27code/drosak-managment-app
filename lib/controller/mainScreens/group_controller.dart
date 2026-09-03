import 'dart:async';
import 'dart:developer';
import 'package:drosak_managment_app/core/database/appointment_db.dart';
import 'package:drosak_managment_app/core/database/group_db.dart';
import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:drosak_managment_app/model/group/fk_group_appointment.dart';
import 'package:drosak_managment_app/model/group/group_model.dart';
import 'package:drosak_managment_app/model/group/time_of_day_model.dart';
import 'package:flutter/material.dart';

import '../../core/strings/string_manager.dart';

class GroupController {
  BuildContext context;
  late GroupOperations groupOperations;

  late StreamController<List<FkGroupAppointment>> _groupListStreamController;
  late Sink<List<FkGroupAppointment>> _inputGroupList;
  late Stream<List<FkGroupAppointment>> outputGroupList;

  late StreamController<List<AppointmentModel>> _fkStreamController;
  late Sink<List<AppointmentModel>> _inputFk;
  late Stream<List<AppointmentModel>> outputFk;

  List<GroupModel> groupList = [];
  List<FkGroupAppointment> fkList = [];

  List<AppointmentModel> appointmentList = [];

  GroupController(this.context) {
    init();
  }

  Future<void> init() async {
    _groupListStreamController = StreamController();
    _inputGroupList = _groupListStreamController.sink;
    outputGroupList = _groupListStreamController.stream.asBroadcastStream();

    _fkStreamController = StreamController();
    _inputFk = _fkStreamController.sink;
    outputFk = _fkStreamController.stream.asBroadcastStream();

    getAllData();

    print(groupList);
  }

  void onTapAdd({
    bool isEdit = false,
    GroupModel? groupModel,
    AppointmentModel? appointmentModel,
  }) {
    // int newId = groupList.isEmpty ? 1 : groupList.last.id + 1;
    Navigator.pushNamed(
      context,
      RouteNames.addNewGroup,
      arguments:
      // {
      //   "idNewGroup": newId,
      //   "status":
      StringManager.addNewGroup,
      // }, //groupList.isEmpty ? 1 : groupList.last.id + 1,
    ).then((value) => getAllData()); //!
  }

  void getAllData() async {
    //!    جرب انقله الى ال group db
    List<FkGroupAppointment> fkList = [];
    GroupOperations groupOperations = GroupOperations();
    groupList = await groupOperations.selectGroups();
    AppointmentOperations appointmentOperations = AppointmentOperations();
    appointmentList = await appointmentOperations.selectFromAppointment();
    for (GroupModel item in groupList) {
      List<AppointmentModel> listWhereAppointment = appointmentList
          .where((element) => element.groupIdFK == item.id)
          .toList();
      fkList.add(
        FkGroupAppointment(
          groupModel: item,
          appointments: listWhereAppointment,
        ),
      );
      _inputGroupList.add(fkList);
    }
    log(fkList.toString());
  }

  void addController() {
    _inputGroupList.add(fkList);
  }

  Future<void> onRefresh() async {
    fkList.clear();
    _inputGroupList.add(fkList);
    getAllData();
  }

  void deleteFun(FkGroupAppointment fkAGModel) async {
    bool? confirmDelete;
    confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("هل تريد الحذف ؟"),
        actions: [
          TextButton(
            onPressed: () async {
              GroupOperations groupOperations = GroupOperations();
              bool x = await groupOperations.deleteFromGroupTable(
                fkAGModel.groupModel,
              );
              print(x);
              if (x) {
                init();
                await onRefresh();
                fkList.remove(fkAGModel);
                _inputGroupList.add(fkList);
                Navigator.of(context).pop(true);
              }
            },
            child: Text("نعم"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("لا"),
          ),
        ],
      ),
    );
  }

  void editFun(FkGroupAppointment model) {
    Navigator.of(context)
        .pushNamed(
          RouteNames.addNewGroup,
          arguments: {"status": StringManager.editThisGroup, "fkModel": model},
        )
        .then((value) => getAllData());
  }
}
