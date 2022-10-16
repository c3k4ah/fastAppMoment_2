import 'package:flutter/material.dart';

import '../../colors.dart';

Widget skinTextDetails({
  required String label,
  required String text,
  bool? bold,
  Color? labelColor,
  double? textSize,
  double? width,
  double? height,
  TextAlign? textAlign,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 15, top: 5),
    width: width ?? 150,
    height: height ?? 60,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign ?? TextAlign.start,
          text: TextSpan(
            text: "$label :\n",
            style: TextStyle(
              color: labelColor ?? swatch_7,
              fontSize: textSize ?? 20,
              fontWeight: (bold ?? true) ? FontWeight.w500 : FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                text: text,
                style: TextStyle(
                  color: swatch_4,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
