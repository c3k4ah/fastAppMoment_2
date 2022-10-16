import 'package:flutter/painting.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color swatch_1 = HexColor('#090b0d');
Color swatch_2 = HexColor('#606566');
Color swatch_3 = HexColor('#274950');
Color swatch_4 = HexColor('#8f9194');
Color swatch_5 = HexColor('#98754e');
Color swatch_6 = HexColor('#3997a1');
Color swatch_7 = HexColor('#d4dcd8');
Color swatch_8 = HexColor('#577986');
/**
$swatch_2: #090b0d;
$swatch_2: #606566;
$swatch_3: #274950;
$swatch_4: #8f9194;
$swatch_5: #98754e;
$swatch_6: #3997a1;
$swatch_7: #d4dcd8;
$swatch_8: #577986;
 */