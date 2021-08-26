import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  double opacity = 0.3;

  @override
  void onInit() {
    super.onInit();
  }

  login() {}
}
