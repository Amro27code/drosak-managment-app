import '../../core/database/my_sqflite_database.dart';
import '../group/time_of_day_model.dart';

class StudentModel {
  final int id;
  final int groupFkId;
  final String name;
  final String eduName;
  final String groupName;
  final String imagePath;
  final String? phoneNumber;
  final String? createdAt;
  final List<AppointmentModel>? listAppointment;

  // String? phoneNumber;
  final String? note;


  @override
  String toString() {
    return '\nStudentModel{id: $id, groupFkId: $groupFkId, name: $name, eduName: $eduName, groupName: $groupName, imagePath: $imagePath, phoneNumber: $phoneNumber, createdAt: $createdAt, listAppointment: $listAppointment, note: $note}';
  }

  Map<String, Object?> toJson() {
    return {
      MySqfliteDatabase.studentNameColumn: name,
      MySqfliteDatabase.studentNoteColumn: note,
      MySqfliteDatabase.studentGroupFKColumn: groupFkId,
      // MySqfliteDatabase.studentIdColumn: id,
      MySqfliteDatabase.studentImagePathColumn: imagePath,
    };
  }

  StudentModel({
    this.id = 0,
    required this.groupFkId,
    required this.name,
    required this.note,
    required this.imagePath,
    required this.groupName,
    required this.eduName,
    this.phoneNumber = '',
    this.createdAt = '',
    this.listAppointment,
  });

  factory StudentModel.fromJson(Map json,List<AppointmentModel> appointments) {
    return StudentModel(
      id: json[MySqfliteDatabase.studentIdColumn] as int,
      note: json[MySqfliteDatabase.studentNoteColumn] as String?,
      groupFkId: json[MySqfliteDatabase.studentGroupFKColumn] as int,
      name: json[MySqfliteDatabase.studentNameColumn] as String,
      imagePath: json[MySqfliteDatabase.studentImagePathColumn] as String,
      groupName: json[MySqfliteDatabase.groupNameColumn] as String,
      eduName: json[MySqfliteDatabase.eduTitleColumn] as String,
      listAppointment: appointments//!!!!!!!!!!!!!
      // phoneNumber: json[MySqfliteDatabase.studentPhoneNumber] as String,
    );
  }
}
