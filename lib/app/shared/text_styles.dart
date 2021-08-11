import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class DeviceHeight {
  static const iphone5S = 568.0;
  static const iphone6S = 667.0;
  static const iphone11ProMax = 896.0;
}

class TextSize {
  static double xxxSmall = 6.0;
  static double xxSmall = 10.0;
  static double xSmall = 12.0;
  static double small = 14.0;
  static double medium = 16.0;
  static double large = 18.0;
  static double xLarge = 20;
  static double xxLarge = 22;
  static double big = 32;
  static double xBig = 34;
  static double profileSize = 55;

  void init(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;

    xxSmall = 10.0;
    xSmall = 12.0;
    small = _screenHeight <= DeviceHeight.iphone5S ? 14 : 16;
    medium = 16.0;
    large = 18.0;
    xLarge = 20;
    xxLarge = 24;
    big = _screenHeight <= DeviceHeight.iphone5S ? 18 : 24;
    xBig = _screenHeight <= DeviceHeight.iphone5S ? 36 : 42;
  }
}

class TextStyles {
  static TextStyle appBarTitle({Color? textColor}) {
    return GoogleFonts.lato(
        fontSize: TextSize.medium, color: textColor ?? Colors.black, fontWeight: FontWeight.w700);
  }

  static TextStyle paragraph(
    double size, {
    FontWeight? weight,
    Color? color,
    double? lineHeight,
    bool isLink = false,
  }) {
    return GoogleFonts.lato(
        decoration: isLink ? TextDecoration.underline : TextDecoration.none,
        fontSize: size,
        height: lineHeight ?? 1.010,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal);
  }
}
