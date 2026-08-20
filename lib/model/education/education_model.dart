import '../../core/database/my_sqflite_database.dart';

class EducationModel {
  final String? _imagePath;
  final int _id;

  final String _title;
  final String _subtitle;
  String? _dateCreated;
  int _status;

  @override
  String toString() {
    return 'EducationModel{_imagePath: $_imagePath, _id: $_id, _title: $_title, _subtitle: $_subtitle, _dateCreated: $_dateCreated, _status: $_status}';
  }

  String? get dateCreated => _dateCreated;

  int get status => _status;

  EducationModel({
    required this._imagePath,
    required this._title,
    required this._subtitle,
    required this._id,
    this._dateCreated,
    this._status = 1,
  });

  factory EducationModel.fromJson(Map json) {
    return EducationModel(
      id: json[MySqfliteDatabase.eduIdColumn] as int,
      imagePath: json[MySqfliteDatabase.eduImageColumn] as String,
      title: json[MySqfliteDatabase.eduTitleColumn] as String,
      subtitle: json[MySqfliteDatabase.eduSubTitleColumn] as String,
      dateCreated: json[MySqfliteDatabase.dateCreatedColumn].toString(),
      status: json[MySqfliteDatabase.statusColumn],
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
