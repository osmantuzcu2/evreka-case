import 'dart:convert';

import 'package:evrekacase/modules/Login/LoginModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  double opacity = 0.3;
  var json;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    json = jsonEncode({
      "Id": "7",
      "UserName": "osmantuzcu",
      "Password": "123456",
      "UserType": "admin",
      "Name": "Osman",
      "LastName": "Tuzcu",
      "EMail": "osman@ss.ss",
      "Phone": "000000000",
      "Status": "true",
      "Token": "token"
    });
  }

  login() {
    LoginModel.fromJson(json);
  }
}
