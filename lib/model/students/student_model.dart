import '../../core/database/my_sqflite_database.dart';

class StudentModel {
  int id;
  int groupFkId;
  String name;
  String imagePath;
  String? phoneNumber;
  String? createdAt;

  // String? phoneNumber;
  String? note;

  @override
  String toString() {
    return 'StudentModel{id: $id, groupFkId: $groupFkId, name: $name, imagePath: $imagePath, phoneNumber: $phoneNumber, note: $note}';
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
    this.phoneNumber = '',
    this.createdAt = '',
  });

  factory StudentModel.fromJson(Map json) {
    return StudentModel(
      id: json[MySqfliteDatabase.studentIdColumn] as int,
      note: json[MySqfliteDatabase.studentNoteColumn] as String?,
      groupFkId: json[MySqfliteDatabase.studentGroupFKColumn] as int,
      name: json[MySqfliteDatabase.studentNameColumn] as String,
      imagePath: json[MySqfliteDatabase.studentImagePathColumn] as String,
      // phoneNumber: json[MySqfliteDatabase.studentPhoneNumber] as String,
    );
  }
}
