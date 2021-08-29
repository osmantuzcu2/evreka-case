import 'dart:convert';

import 'package:evrekacase/modules/GlobalWidgets/Dialogs.dart';
import 'package:evrekacase/modules/HomePage/HomePageScreen.dart';
import 'package:evrekacase/modules/Login/LoginModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  double opacity = 1;
  Map<String, dynamic> json;
  bool showTitleUsername = true;

  @override
  void onInit() {
    init();
    userNameCont.text = "demo";
    passwordCont.text = "demo";
    super.onInit();
  }

  init() {
    json = {
      "Id": "7",
      "UserName": "demo",
      "Password": "demo",
    };
  }

  login() {
    update();
    var response = LoginModel.fromJson(json);
    if (response.userName == userNameCont.text &&
        response.password == passwordCont.text) {
      Get.off(HomePageScreen());
    } else {
      isLoading = true;
      update();
    }
  }

  clear(TextEditingController cont) {
    cont.clear();
    update();
  }

  change() {
    if (userNameCont.text != "") {
      showTitleUsername = false;
      update();
    }
  }
}
