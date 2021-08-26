import 'package:evrekacase/helper.dart';
import 'package:evrekacase/modules/GlobalWidgets/Buttons.dart';
import 'package:evrekacase/modules/GlobalWidgets/TextFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'LoginController.dart';

class LoginScreen extends StatelessWidget {
  final LoginController c = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenW(1, context),
        height: screenH(1, context),
        decoration: BoxDecoration(gradient: backGradient()),
        child: Form(
          key: c.formKey,
          child: Column(
            children: [
              Container(
                width: screenW(0.7, context),
                child: SvgPicture.asset("assets/Logo.svg"),
              ),
              Container(
                child: textBox("Username", false),
              ),
              Container(
                child: textBox("Password", true),
              ),
              Container(
                child: greenButton("LOGIN", c.opacity, () {
                  if (c.formKey.currentState.validate()) {}
                  print("button pressed");
                  c.login();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
