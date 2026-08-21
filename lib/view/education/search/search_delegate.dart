import 'package:drosak_managment_app/controller/mainScreens/education_controller.dart';
import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/view/education/search/custom_result_search_models.dart';
import 'package:flutter/material.dart';
import '../../../core/database/education_db.dart';
import '../../../model/education/education_model.dart';

class EducationSearchDelegate extends SearchDelegate<String> {
  EducationSearchDelegate({
    required this.deleteEduDismiss,
    required this.updateEduDismiss,
  });

  final Function(EducationModel) deleteEduDismiss;
  final Function(EducationModel) updateEduDismiss;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super
        .appBarTheme(context)
        .copyWith(
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.white),
          ),
          appBarTheme: AppBarTheme(backgroundColor: ColorManager.primary),
          textTheme:
              // super
              // .appBarTheme(context)
              // .textTheme
              // .copyWith
              // OR =>
              TextTheme(titleLarge: TextStyle(color: Colors.white)),
        );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close, color: Colors.white),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Navigator.pop(context); NOOO
        close(context, "");
      },
      icon: Icon(Icons.arrow_back, color: Colors.white),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    EducationOperations educationOperations = EducationOperations();
    return query.isEmpty
        ? Center(
            child: Text("D.N.E", style: TextStyle(color: Colors.white)),
          )
        : CustomResultSearchModels(
            getListSearch: educationOperations.selectSearchEducations(
              query: query,
            ),
            onDismissedDeleteFun: deleteEduDismiss, //(EducationModel p1) {},
            onDismissedUpdateFun: updateEduDismiss, //(EducationModel p1) {},
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("build Suggestions", style: TextStyle(color: Colors.white)),
    );
  }
}
