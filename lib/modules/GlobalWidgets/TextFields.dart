import 'package:evrekacase/helper.dart';
import 'package:flutter/material.dart';

Widget textBox(String hint, bool password) {
  return TextFormField(
    obscureText: password,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please fill this field';
      }
      return null;
    },
    decoration: InputDecoration(
        hintText: hint,
        focusColor: Yellow,
        fillColor: ShadowColor,
        errorStyle: TextStyle(color: ErrorColor)),
  );
}
