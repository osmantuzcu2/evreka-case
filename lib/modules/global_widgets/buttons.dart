import 'package:flutter/material.dart';
import '../../helper.dart';

Widget greenButton(String text, double opc, Function() func) {
  return GestureDetector(
    onTap: func,
    child: Opacity(
      opacity: opc,
      child: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: green,
            boxShadow: [
              BoxShadow(
                color: shadowColorGreen,
                spreadRadius: 1.5,
                blurRadius: 8,
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
              child: Text(
            text,
            style: buttonText(),
          ))),
    ),
  );
}
