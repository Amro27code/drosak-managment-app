import '../../model/education/education_model.dart';
import 'my_sqflite_database.dart';

class EducationOperations extends MySqfliteDatabase {
  Future<bool> insertEducation(EducationModel educationModel) {
    print(";;;;;;;;;;;;;;");
    return insert(
      values: {
        MySqfliteDatabase.eduTitleColumn: educationModel.title,
        MySqfliteDatabase.eduSubTitleColumn: educationModel.subtitle,
        MySqfliteDatabase.eduImageColumn: educationModel.imagePath,
      },
      tableName: MySqfliteDatabase.eduTable,
    );
  }

  Future<List<Map<String, Object?>>> selectAllEducations() {
    return select(tableName: MySqfliteDatabase.eduTable);
  }

}
