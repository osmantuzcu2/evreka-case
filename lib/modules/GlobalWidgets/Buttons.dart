import 'package:flutter/material.dart';

import '../../helper.dart';

Widget greenButton(String text, double opc, Function func) {
  return GestureDetector(
    onTap: () => func,
    child: Opacity(
      opacity: opc,
      child: Container(
          decoration: BoxDecoration(
            color: Green,
            boxShadow: [
              BoxShadow(
                color: ShadowColorGreen,
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          padding: EdgeInsets.only(top: 25, right: 24, bottom: 25, left: 16),
          child: Center(
              child: Text(
            text,
            style: buttonText(),
          ))),
    ),
  );
}
