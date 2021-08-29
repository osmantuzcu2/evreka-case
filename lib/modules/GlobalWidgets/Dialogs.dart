import 'package:flutter/material.dart';
import '../../helper.dart';

Widget errorDialog(String content) {
  return Container(
    decoration: BoxDecoration(
      color: LightColor,
      boxShadow: [
        BoxShadow(
          color: ShadowColor,
          spreadRadius: 1.5,
          blurRadius: 8,
          offset: Offset(0, 0),
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    padding: EdgeInsets.only(top: 30, bottom: 30, left: 8, right: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 32,
            child: Image.asset("assets/Error.png"),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.only(left: 12),
              child: Text(content, maxLines: 3, style: t1())),
        )
      ],
    ),
  );
}
