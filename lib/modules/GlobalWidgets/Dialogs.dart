import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../helper.dart';

Widget errorDialog(String content) {
  return Container(
    decoration: BoxDecoration(
      color: LightColor,
      boxShadow: [
        BoxShadow(
          color: ShadowColor,
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(0, 0),
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    padding: EdgeInsets.only(top: 25, right: 24, bottom: 25, left: 16),
    child: Row(
      children: [
        Container(
          width: 26,
          child: SvgPicture.asset("assets/Error.svg"),
        ),
        Container(
            padding: EdgeInsets.only(left: 12),
            child: Text(content, style: t1()))
      ],
    ),
  );
}
