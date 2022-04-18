import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#3F72B0");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color secondary = HexColor.fromHex("#112D4E");
  static Color background = HexColor.fromHex("#DBE2EF");
  static Color scaffoldBackgroundColor = HexColor.fromHex("#F9F7F7");
  //tatic Color scaffoldBackgroundColor2 = HexColor.fromHex("#e3d9d9");
  static Color scaffoldBackgroundColorDark = HexColor.fromHex("#000");
  static Color darkPrimary = HexColor.fromHex("#3F72B0");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000");
}

/*
 flutter uses color AARRGGBB format 

 AA => transparency 
 RR => red
 GG => green
 BB => blue

 if you want to create custom color 8-digit code from 6-digit color code the just append transparence (AA) value to it 
 
100% - FF
95% - F2
90% - E6
85% - D9
80% - CC
75% - BF
70% - B3
65% - A6
60% - 99
55% - 8C
50% - 80
45% - 73
40% - 66
35% - 59
30% - 4D
25% - 40
20% - 33
15% - 26
10% - 1A
5% - 0D
0% - 00

*/

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
