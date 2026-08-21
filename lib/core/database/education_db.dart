import '../../model/education/education_model.dart';
import 'my_sqflite_database.dart';

class EducationOperations extends MySqfliteDatabase {
  // Future<bool> deleteEducation(EducationModel educationModel) {
  //   return delete(
  //     tableName: MySqfliteDatabase.eduTable,
  //     where: "${MySqfliteDatabase.eduIdColumn}==${educationModel.id}",
  //   );
  // }
  //
  // Future<bool> updateEducation({required int id}) {
  //   //usually send to this function full model
  //   return update(
  //     tableName: MySqfliteDatabase.eduTable,
  //     where: "${MySqfliteDatabase.eduIdColumn}==$id",
  //     values: {},
  //   );
  // }

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

  // Future<List<EducationModel>> selectAllEducations() async {
  //   //بدل ما يرجع عشكل ماب لا يرجع موديلات احسن عشان اقدر اتعامل معه واعرضه للواجهات
  //   List<EducationModel> listEducationModel = [];
  //   List<Map<String, Object?>> data = await select(
  //     tableName: MySqfliteDatabase.eduTable,
  //     where: "${MySqfliteDatabase.statusColumn}==?",
  //     whereArgs: ["1"],
  //   );
  //   // TODO: وبدلا من استخدام الفور لوب الحل بتحت الكومينت
  //   // data.forEach((element) {
  //   //   listEducationModel.add(
  //   //     //تخيل لو كان في عندي 100 att بدي اقعد احطهم هيك زي تحت ؟ والحل استخدم ال named con
  //   //     // EducationModel(
  //   //     //           id: element[MySqfliteDatabase.eduIdColumn] as int,
  //   //     //           imagePath: element[MySqfliteDatabase.eduImageColumn] as String,
  //   //     //           title: element[MySqfliteDatabase.eduTitleColumn] as String,
  //   //     //           subtitle: element[MySqfliteDatabase.eduSubTitleColumn] as String,
  //   //     //         )
  //   //
  //   //     EducationModel.fromJson(element)
  //   //   );
  //   // });
  //   listEducationModel += data
  //       .map((item) => EducationModel.fromJson(item))
  //       .toList();
  //   return listEducationModel;
  // }

  Future<List<EducationModel>> selectSearchEducations({
     String query="",
  }) async {
    List<EducationModel> listEducationModel = [];
    List<Map<String, Object?>> data = await selectWhere(
      tableName: MySqfliteDatabase.eduTable,
      query: query,
      where: "${MySqfliteDatabase.eduTitleColumn} LIKE ? AND ${MySqfliteDatabase.statusColumn}==?",
      whereArgs: ['%$query%','1'],
    );
    listEducationModel += data
        .map((item) => EducationModel.fromJson(item))
        .toList();
    print(listEducationModel);
    return listEducationModel;
  }

  Future<bool> softDelete(EducationModel model) async {
    return await update(
      tableName: MySqfliteDatabase.eduTable,
      values: {MySqfliteDatabase.statusColumn: 0},
      where: "${MySqfliteDatabase.eduIdColumn}==${model.id}",
    );
  }

  Future<bool> softUpdate(EducationModel model) async {
    return await update(
      tableName: MySqfliteDatabase.eduTable,
      values: model.toJson(),
      where: "${MySqfliteDatabase.eduIdColumn}==${model.id}",
    );
  }
}
