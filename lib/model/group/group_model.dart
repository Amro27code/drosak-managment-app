import '../../core/database/my_sqflite_database.dart';

class GroupModel {
  final int id;
  final int educationFKId;
  final String name;
  final String? note;

  @override
  String toString() {
    return 'GroupModel{id: $id, educationFKId: $educationFKId, name: $name, note: $note}';
  }

  Map<String, Object?> toJson() {
    return {
      MySqfliteDatabase.groupNameColumn: name,
      MySqfliteDatabase.groupNoteColumn: note,
      MySqfliteDatabase.groupEduFKColumn: educationFKId,
    };
  }

  GroupModel({
     this.id=0,
    required this.educationFKId,
    required this.name,
    required this.note,
  });

  factory GroupModel.fromJson(Map json) {
    return GroupModel(
      id: json[MySqfliteDatabase.groupIdColumn] as int,
      note: json[MySqfliteDatabase.groupNoteColumn] as String?,
      educationFKId: json[MySqfliteDatabase.groupEduFKColumn] as int,
      name: json[MySqfliteDatabase.groupNameColumn] as String,
    );
  }
}
