import 'dart:async';
import 'package:drosak_managment_app/core/resources/routes_manager.dart';
import 'package:drosak_managment_app/core/strings/string_manager.dart';
import 'package:drosak_managment_app/model/group/group_model.dart';
import 'package:drosak_managment_app/model/group/time_of_day_model.dart';
import 'package:flutter/widgets.dart';
import '../../model/group/fk_group_appointment.dart';

class StudentController {
  late BuildContext _context;

  late StreamController<List<FkGroupAppointment>> _fkListStreamController;
  late Stream<List<FkGroupAppointment>> fkListOutput;
  late Sink<List<FkGroupAppointment>> _fkListInput;
  List<FkGroupAppointment> fkList = [
    FkGroupAppointment(
      groupModel: GroupModel(educationFKId: 1, name: "name", note: "note"),
      appointments: [
        AppointmentModel(day: "day", time: "t", tPMorAM: "tPMorAM"),
        AppointmentModel(day: "day", time: "t", tPMorAM: "tPMorAM"),
      ],
    ),
  ];

  StudentController(BuildContext context) {
    _context = context;
    init();
  }

  void init() {
    _fkListStreamController = StreamController();
    _fkListInput = _fkListStreamController.sink;
    fkListOutput = _fkListStreamController.stream;
    _fkListInput.add(fkList);
  }

  void onTapAdd() {
    Navigator.pushNamed(
      _context,
      RouteNames.addNewStudent,
      arguments: StringManager.addNewStudent
    ).then((value) => init());
  }
}
