import 'package:flutter/material.dart';

//Devices Width
double screenW(double wwidth, context) {
  return MediaQuery.of(context).size.width * wwidth;
}

//Devices Height
double screenH(double hheight, context) {
  return MediaQuery.of(context).size.height * hheight;
}

//Main Back Gradient

LinearGradient backGradient() {
  return LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: [HexColor("#ECECEC"), Colors.white]);
}

//Hex Color Convertor
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

//Hex Colors defenation

final DarkBlue = HexColor("#172C49");
final Yellow = HexColor("#E9CF30");
final DarkGrey = HexColor("#535A72");
final LightColor = HexColor("#FBFCFF");
final Green = HexColor("#3BA935");
final ErrorColor = HexColor("#FC3131");
final ShadowColor = HexColor("#BBBBBB");
final ShadowColorGreen = HexColor("#72C875");
final BorderColor = HexColor("#E1E1E1");

//Text Styles

TextStyle h3() => TextStyle(
    color: DarkBlue,
    fontSize: 20,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.bold);
TextStyle h4() => TextStyle(
    color: DarkGrey,
    fontSize: 16,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.bold);
TextStyle t2() => TextStyle(
    color: DarkGrey,
    fontSize: 20,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
TextStyle buttonText() => TextStyle(
    color: LightColor,
    fontSize: 20,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.bold);
TextStyle t1() => TextStyle(
    color: DarkGrey,
    fontSize: 16,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
TextStyle inputBoxLabelFilled() => TextStyle(
    color: ShadowColor,
    fontSize: 16,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
TextStyle inputBoxLabelActive() => TextStyle(
    color: Yellow,
    fontSize: 12,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
TextStyle inputBoxLabelError() => TextStyle(
    color: ErrorColor,
    fontSize: 12,
    fontFamily: "Open Sans",
    fontWeight: FontWeight.normal);
