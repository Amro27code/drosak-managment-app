class EducationModel {
  final String _imagePath;
  final int _id;

  final String _title;
  final String _subtitle;

  const EducationModel({
    required this._imagePath,
    required this._title,
    required this._subtitle,
    required this._id,
  });

  String get title => _title;

  int get id => _id;

  String get imagePath => _imagePath;

  String get subtitle => _subtitle;
}
