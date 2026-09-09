import 'package:drosak_managment_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class EducationSearchDelegate extends SearchDelegate<String> {
  EducationSearchDelegate({required this.myBuildResult});

  Widget Function(String query) myBuildResult;

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
        close(context, "");
      },
      icon: Icon(Icons.arrow_back, color: Colors.white),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return myBuildResult(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("build Suggestions", style: TextStyle(color: Colors.white)),
    );
  }
}
