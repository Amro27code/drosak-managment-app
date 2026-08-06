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
      title: ConstValues.onbTitle1,
    ),
    OnBoardingModel(
      imagePath: AssetsValueManager.onb3,
      title: ConstValues.onbTitle1,
    ),
    OnBoardingModel(
      imagePath: AssetsValueManager.onb4,
      title: ConstValues.onbTitle1,
    ),
    OnBoardingModel(
      imagePath: AssetsValueManager.onb5,
      title: ConstValues.onbTitle1,
    ),
  ];
}
class ConstValues{
static const String onbTitle1='يمكنك إضافة  بعض المراحل التعليمية ';
static const String onbTitle2='يمكنك إضافة  بعض المراحل التعليمية ';
static const String onbTitle3='يمكنك إضافة  بعض المراحل التعليمية ';
static const String onbTitle4='يمكنك إضافة  بعض المراحل التعليمية ';
static const String onbTitle5='يمكنك إضافة  بعض المراحل التعليمية ';
}
