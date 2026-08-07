import 'package:flutter/material.dart';

import '../../../core/strings/font_manager.dart';

Text textOnb({required String text}){
  return  Text(
    text,
    style: TextStyle(
      fontFamily: FontManager.geDinerOne,
      color: Colors.white,
      fontSize: 15,
      fontWeight: .w500,
    ),
  );
}