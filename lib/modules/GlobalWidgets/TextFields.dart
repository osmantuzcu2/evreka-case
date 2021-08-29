import 'package:flutter/cupertino.dart';

import '../../helper.dart';
import 'package:flutter/material.dart';

Widget textBox(String hint, bool password, Function() func,
    TextEditingController cont, Function() changeFunc(val)) {
  return TextFormField(
    controller: cont,
    obscureText: password,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please fill this field';
      }
      return null;
    },
    onChanged: changeFunc,
    decoration: InputDecoration(
        hintText: hint,
        suffixIcon: GestureDetector(
          onTap: func,
          child: Container(
              child: Image.asset(
            "assets/Clear.png",
          )),
        ),
        hintStyle: inputBoxLabelFilled(),
        focusColor: Yellow,
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: ShadowColor)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Yellow)),
        fillColor: ShadowColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: TextStyle(color: ErrorColor)),
  );
}
