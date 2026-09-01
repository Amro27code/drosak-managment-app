import 'package:drosak_managment_app/model/group/group_model.dart';
import 'package:drosak_managment_app/model/group/time_of_day_model.dart';

class FkGroupAppointment {
  GroupModel groupModel;
  List<AppointmentModel> appointments;

  @override
  String toString() {
    return 'FkGroupAppointment{groupModel: $groupModel, appointments: $appointments}';
  }

  FkGroupAppointment({required this.groupModel, required this.appointments});
}
