import 'dart:ui';

import 'package:flutter/material.dart';

Widget blurContainer({
  required double width,
  required double height,
  required double radius,
  required double sigmaX,
  required double sigmaY,
  required EdgeInsets margin,
  required Widget child,
}) {
  return Container(
    height: height,
    width: width,
    margin: margin,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
        ),
        child: child,
      ),
    ),
  );
}
