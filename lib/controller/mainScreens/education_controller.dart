import 'package:drosak_managment_app/core/resources/assets_manager.dart';
import 'package:drosak_managment_app/model/education/education_model.dart';

class EducationController {
  List<EducationModel> educationList = [
    EducationModel(
      id: 1,
      imagePath: AssetsValueManager.onb3,
      title: "الصف الأول الإعدادي",
      subtitle:
          "تلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلا",
    ),
    EducationModel(
      id: 2,
      imagePath: AssetsValueManager.onb3,
      title: "الصف الثاني الإعدادي",
      subtitle:
          "تلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلا",
    ),
  ];
}
