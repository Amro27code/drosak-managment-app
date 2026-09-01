import 'package:flutter/material.dart';

import '../../../strings/string_manager.dart';

String convertTimeOfDayToString(TimeOfDay timeGroup) {
  return "${timeGroup.hourOfPeriod}:${timeGroup.minute.toString().padLeft(2, '0')}";
}
String periodForTimeOfDay(TimeOfDay timeGroup){
  return timeGroup.period == DayPeriod.am ? StringManager.am : StringManager.pm;
}
