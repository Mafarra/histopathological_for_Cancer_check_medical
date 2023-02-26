import 'package:flutter/material.dart';

class AppColor {
  static Color primaryColor = HexColor.fromHex("#FF4572");
  static Color seconderyColor = HexColor.fromHex("#121212");
  static Color greenColor = HexColor.fromHex("#00FF00");
  static Color redColor = HexColor.fromHex("#FF0000");
  static Color whiteColor = HexColor.fromHex("#FFFFFF");
}

extension HexColor on Color {
  static fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
