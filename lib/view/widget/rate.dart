import 'package:flutter/material.dart';

Widget rate({
  required int rateStar,
  required double width,
  required double iconSize,
  required Color color,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    width: width,
    //color: Colors.amber,
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < 5; i++)
              Icon(
                Icons.star_border,
                color: color,
                size: iconSize,
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < rateStar; i++)
              Icon(
                Icons.star,
                color: color,
                size: iconSize,
              ),
          ],
        ),
      ],
    ),
  );
}
