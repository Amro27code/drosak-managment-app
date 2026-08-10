import 'package:flutter/material.dart';

class BnbModel {
  final String _title;

  final String _imagePath;
  final Widget _screen;


  const BnbModel({required this._imagePath, required this._title, required this._screen});

  String get title => _title;
  String get imagePath => _imagePath;
  Widget get screen => _screen;

}
