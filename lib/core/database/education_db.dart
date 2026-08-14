import '../../model/education/education_model.dart';
import 'my_sqflite_database.dart';

class EducationOperations extends MySqfliteDatabase {
  Future<bool> insertEducation(EducationModel educationModel) {
    return insert(
      values: educationModel.toJson(),
      // {
      //   MySqfliteDatabase.eduTitleColumn: educationModel.title,
      //   MySqfliteDatabase.eduSubTitleColumn: educationModel.subtitle,
      //   MySqfliteDatabase.eduImageColumn: educationModel.imagePath,
      // },
      tableName: MySqfliteDatabase.eduTable,
    );
  }

  Future<List<EducationModel>> selectAllEducations() async {
    //بدل ما يرجع عشكل ماب لا يرجع موديلات احسن عشان اقعدر اتعامل معه واعرضه للواجهات
    List<EducationModel> listEducationModel = [];
    List<Map<String, Object?>> data = await select(
      tableName: MySqfliteDatabase.eduTable,
    );
    // TODO: وبدلا من استخدام الفور لوب الحل بتحت الكومينت
    // data.forEach((element) {
    //   listEducationModel.add(
    //     //تخيل لو كان في عندي 100 att بدي اقعد احطهم هيك زي تحت ؟ والحل استخدم ال named con
    //     // EducationModel(
    //     //           id: element[MySqfliteDatabase.eduIdColumn] as int,
    //     //           imagePath: element[MySqfliteDatabase.eduImageColumn] as String,
    //     //           title: element[MySqfliteDatabase.eduTitleColumn] as String,
    //     //           subtitle: element[MySqfliteDatabase.eduSubTitleColumn] as String,
    //     //         )
    //
    //     EducationModel.fromJson(element)
    //   );
    // });
    listEducationModel += data
        .map((item) => EducationModel.fromJson(item))
        .toList();
    return listEducationModel;
  }
}
