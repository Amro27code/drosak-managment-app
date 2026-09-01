import 'package:drosak_managment_app/core/database/my_sqflite_database.dart';

class AppointmentModel {
  final String day;
  final String time;
  final String tPMorAM;
  final int? groupIdFK;
  final int appointmentId;

  @override
  String toString() {
    return 'AppointmentModel{day: $day, time: $time, tPMorAM: $tPMorAM, groupIdFK: $groupIdFK, appointmentId: $appointmentId}';
  }

  AppointmentModel({
    required this.day,
    required this.time,
    required this.tPMorAM,
    this.groupIdFK=0,
    this.appointmentId = 0,
  });

  Map<String, Object?> toJson(int groupId) {
    return {
      // MySqfliteDatabase.appointmentIdColumn: appointmentId,
      MySqfliteDatabase.appointmentGroupFKColumn: groupId,
      MySqfliteDatabase.appointmentDayColumn: day,
      MySqfliteDatabase.appointmentTimeColumn: time,
      MySqfliteDatabase.appointmentPMorAMColumn: tPMorAM,
    };
  }

  factory AppointmentModel.fromJson(Map json) {
    return AppointmentModel(
      appointmentId: json[MySqfliteDatabase.appointmentIdColumn] as int,
      tPMorAM: json[MySqfliteDatabase.appointmentPMorAMColumn] as String,
      time: json[MySqfliteDatabase.appointmentTimeColumn] as String,
      day: json[MySqfliteDatabase.appointmentDayColumn] as String,
      groupIdFK: (json[MySqfliteDatabase.appointmentGroupFKColumn] as int? ) ??0,
    );
  }
}
