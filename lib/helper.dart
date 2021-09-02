import 'package:flutter/material.dart';

////Devices Width
double screenW(double wwidth, BuildContext context) {
  return MediaQuery.of(context).size.width * wwidth;
}

////Devices Height
double screenH(double hheight, BuildContext context) {
  return MediaQuery.of(context).size.height * hheight;
}

////Main Back Gradient
LinearGradient backGradient() {
  return LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: [HexColor("#ECECEC"), Colors.white]);
}

////Hex Color Convertor
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    String rtn;
    final hx = hexColor.toUpperCase().replaceAll('#', '');
    if (hx.length == 6) {
      rtn = 'FF$hx';
    }
    return int.parse(rtn, radix: 16);
  }
}

///Hex Colors defenation
final darkBlue = HexColor("#172C49");
final yellow = HexColor("#E9CF30");
final darkGrey = HexColor("#535A72");
final lightColor = HexColor("#FBFCFF");
final green = HexColor("#3BA935");
final errorColor = HexColor("#FC3131");
final shadowColor = HexColor("#BBBBBB");
final shadowColorGreen = HexColor("#72C875");
final borderColor = HexColor("#E1E1E1");

///Text Styles

TextStyle h3() => TextStyle(
    color: darkBlue,
    fontSize: 20,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.bold);
TextStyle h4() => TextStyle(
    color: darkGrey,
    fontSize: 16,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.bold);
TextStyle t2() => TextStyle(
    color: darkGrey,
    fontSize: 20,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
TextStyle buttonText() => TextStyle(
    color: lightColor,
    fontSize: 20,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.bold);
TextStyle t1() => TextStyle(
    color: darkGrey,
    fontSize: 16,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
TextStyle inputBoxLabelFilled() => TextStyle(
    color: shadowColor,
    fontSize: 16,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
TextStyle inputBoxLabelActive() => TextStyle(
    color: yellow,
    fontSize: 12,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
TextStyle inputBoxLabelError() => TextStyle(
    color: errorColor,
    fontSize: 12,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
