import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper.dart';

Widget textBox(
    String hint, bool password, Function() func, TextEditingController cont) {
  return TextFormField(
    controller: cont,
    obscureText: password,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please fill this field';
      }
      return null;
    },
    decoration: InputDecoration(
        hintText: hint,
        suffixIcon: GestureDetector(
          onTap: func,
          child: Image.asset(
            "assets/Clear.png",
          ),
        ),
        hintStyle: inputBoxLabelFilled(),
        focusColor: yellow,
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: shadowColor)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: yellow)),
        fillColor: shadowColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: TextStyle(color: errorColor)),
  );
}
