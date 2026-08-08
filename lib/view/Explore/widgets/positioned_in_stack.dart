import 'package:flutter/material.dart';

Positioned buildPositionedInStack({
  required Color color,
  required double num,
  Widget? child,
}) {
  return Positioned(
    bottom: -1 * num,
    left: -1 * num,
    child: CircleAvatar(radius: num, backgroundColor: color, child: child),
  );
}
