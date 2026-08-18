import '../../core/database/my_sqflite_database.dart';

class EducationModel {
  final String? _imagePath;
  final int _id;

  final String _title;
  final String _subtitle;
  String? _dateCreated;

  String? get dateCreated => _dateCreated;

  @override
  String toString() {
    return 'EducationModel{_imagePath: $_imagePath, _id: $_id, _title: $_title, _subtitle: $_subtitle, _dateCreated: $_dateCreated}';
  }

  EducationModel({
    required this._imagePath,
    required this._title,
    required this._subtitle,
    required this._id,
    this._dateCreated,
  });

  factory EducationModel.fromJson(Map json) {
    return EducationModel(
      id: json[MySqfliteDatabase.eduIdColumn] as int,
      imagePath: json[MySqfliteDatabase.eduImageColumn] as String,
      title: json[MySqfliteDatabase.eduTitleColumn] as String,
      subtitle: json[MySqfliteDatabase.eduSubTitleColumn] as String,
      dateCreated: json[MySqfliteDatabase.dateCreatedColumn].toString(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      MySqfliteDatabase.eduTitleColumn: title,
      MySqfliteDatabase.eduSubTitleColumn: subtitle,
      MySqfliteDatabase.eduImageColumn: imagePath,
    };
  }

  String get title => _title;

  int get id => _id;

  String? get imagePath => _imagePath;

  String get subtitle => _subtitle;
}
