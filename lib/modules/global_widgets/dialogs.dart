import 'package:flutter/material.dart';
import '../../helper.dart';

Widget errorDialog(String content) {
  return Container(
    decoration: BoxDecoration(
      color: lightColor,
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          spreadRadius: 1.5,
          blurRadius: 8,
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    padding: const EdgeInsets.only(top: 30, bottom: 30, left: 8, right: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            width: 32,
            child: Image.asset("assets/Error.png"),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.only(left: 12),
              child: Text(content, maxLines: 3, style: t1())),
        )
      ],
    ),
  );
}
