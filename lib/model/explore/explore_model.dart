class ExploreModel {
  final String _title; //TODO: TRY Remove final
  final String _imagePath;

  ExploreModel({required this._title, required this._imagePath});

  String get title => _title;

  String get imagePath => _imagePath;
}
