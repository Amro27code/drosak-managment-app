import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Positioned buildPositionedInStack({
   Color? color,
   double? numBottomLeft,
   double? numTopRight,
  double? radius,
  Widget? child,
}) {
  return Positioned(
    bottom:numBottomLeft?.h,
    left: numBottomLeft?.w,

    top: numTopRight?.h,
    right: numTopRight?.w,

    child: CircleAvatar(radius: (radius??0).r, backgroundColor: color, child: child),
  );
}
