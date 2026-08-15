import '../../core/database/my_sqflite_database.dart';

class EducationModel {
  final String? _imagePath;
  final int _id;

  final String _title;
  final String _subtitle;

  @override
  String toString() {
    //عشان الطباعة يعني بدل ما اطبع اوبجكت ويقلي instance يطبعلي اللي هون
    return 'EducationModel{_imagePath: $_imagePath, _id: $_id, _title: $_title, _subtitle: $_subtitle}';
  }

  const EducationModel({
    required this._imagePath,
    required this._title,
    required this._subtitle,
    required this._id,
  });

  factory EducationModel.fromJson(Map json) {
    return EducationModel(
      id: json[MySqfliteDatabase.eduIdColumn] as int,
      imagePath: json[MySqfliteDatabase.eduImageColumn] as String,
      title: json[MySqfliteDatabase.eduTitleColumn] as String,
      subtitle: json[MySqfliteDatabase.eduSubTitleColumn] as String,
    );
  }

  Map<String,Object?> toJson(){
    return {
      MySqfliteDatabase.eduTitleColumn: title,
      MySqfliteDatabase.eduSubTitleColumn: subtitle,
      MySqfliteDatabase.eduImageColumn:  imagePath,
    };
  }
  String get title => _title;

  int get id => _id;

  String? get imagePath => _imagePath;

  String get subtitle => _subtitle;
}
