import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_page/home_page_screen.dart';
import 'login_model.dart';

class LoginController extends GetxController {
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isError = false;
  double opacity = 1;
  Map<String, String> json;
  bool showTitleUsername = true;

  @override
  void onInit() {
    init();
    //init username and password for fast interview you can delete these 2 lines
    userNameCont.text = "demo";
    passwordCont.text = "demo";
    //
    super.onInit();
  }

  void init() {
    //Demo username password are here. You can connect your own Rast Api.
    json = {
      "Id": "7",
      "UserName": "demo",
      "Password": "demo",
    };
  }

  void login() {
    //If Username and password match Route to Home Page else shows Error Dialog
    final response = LoginModel.fromJson(json);
    if (response.userName == userNameCont.text &&
        response.password == passwordCont.text) {
      Get.off(HomePageScreen());
    } else {
      isError = true;
      update();
    }
  }

  void clear(TextEditingController cont) {
    //TextEditingControllers clear method
    cont.clear();
    update();
  }
}
