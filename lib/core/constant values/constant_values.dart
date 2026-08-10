import 'package:drosak_managment_app/model/explore/explore_model.dart';
import 'package:drosak_managment_app/model/on_boarding/on_boarding_model.dart';

import '../resources/assets_manager.dart';

class ConstListValues {
  static const List<OnBoardingModel> onBoardingModel = [
    OnBoardingModel(
      imagePath: AssetsValueManager.onb1,
      title: ConstValues.onbTitle1,
    ),
    OnBoardingModel(
      imagePath: AssetsValueManager.onb2,
      title: ConstValues.onbTitle2,
    ),
    OnBoardingModel(
      imagePath: AssetsValueManager.onb3,
      title: ConstValues.onbTitle3,
    ),
    OnBoardingModel(
      imagePath: AssetsValueManager.onb4,
      title: ConstValues.onbTitle4,
    ),
    OnBoardingModel(
      imagePath: AssetsValueManager.onb5,
      title: ConstValues.onbTitle5,
    ),
  ];

  // static const List<ExploreModel> exploreModel = [
  //   ExploreModel(
  //     imagePath: AssetsValueManager.onb1,
  //     title: ConstValues.exploreTitle1,
  //   ),
  //   ExploreModel(
  //     imagePath: AssetsValueManager.onb2,
  //     title: ConstValues.exploreTitle2,
  //   ),
  //   ExploreModel(
  //     imagePath: AssetsValueManager.onb3,
  //     title: ConstValues.exploreTitle3,
  //   ),
  //   ExploreModel(
  //     imagePath: AssetsValueManager.onb4,
  //     title: ConstValues.exploreTitle4,
  //   ),
  //   ExploreModel(
  //     imagePath: AssetsValueManager.onb5,
  //     title: ConstValues.exploreTitle5,
  //   ),
  // ];

  static const List<ExploreModel> exploreModel = [
    ExploreModel(
      imagePath: AssetsValueManager.onb5,
      title: ConstValues.exploreTitle5,
    ),
    ExploreModel(
      imagePath: AssetsValueManager.onb4,
      title: ConstValues.exploreTitle4,
    ),
    ExploreModel(
      imagePath: AssetsValueManager.onb3,
      title: ConstValues.exploreTitle3,
    ),
    ExploreModel(
      imagePath: AssetsValueManager.onb2,
      title: ConstValues.exploreTitle2,
    ),

    ExploreModel(
      imagePath: AssetsValueManager.onb1,
      title: ConstValues.exploreTitle1,
    ),
  ];

}

class ConstValues {
  static const String onbTitle1 = 'يمكنك إضافة  بعض المراحل التعليمية ';
  static const String onbTitle2 =
      'يمكنك إضافة  بعض المجموعات لكل مرحلة من المراحل التعليمية';
  static const String onbTitle3 =
      'يمكنك إضافة  بعض الطلاب لكل جروب الموجودة في كل مرحلة تعليمية';
  static const String onbTitle4 = 'يمكنك إضافة  حضور وغياب لكل طالب ';
  static const String onbTitle5 =
      'يمكنك إضافة  ما إذا كان الطالب دفع هذا الشهر أم لا وإضافة تاريخ الدفع';

  static const String exploreTitle1 = "المراحل التعليمية";
  static const String exploreTitle2 = "المجموعات";
  static const String exploreTitle3 = "الطلاب";
  static const String exploreTitle4 = "الحضور";
  static const String exploreTitle5 = "الدفع";
}
