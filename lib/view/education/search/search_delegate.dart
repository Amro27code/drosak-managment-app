import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:drosak_managment_app/view/education/search/custom_result_search_models.dart';
import 'package:flutter/material.dart';
import '../../../core/database/education_db.dart';

class EducationSearchDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
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
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("buildSuggestions", style: TextStyle(color: Colors.white)),
    );
  }
}
