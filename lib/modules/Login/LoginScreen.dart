import 'package:evrekacase/helper.dart';
import 'package:evrekacase/modules/GlobalWidgets/Buttons.dart';
import 'package:evrekacase/modules/GlobalWidgets/Dialogs.dart';
import 'package:evrekacase/modules/GlobalWidgets/TextFields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoginController.dart';

class LoginScreen extends StatelessWidget {
  final LoginController c = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenW(1, context),
          height: screenH(1, context),
          decoration: BoxDecoration(gradient: backGradient()),
          child: Stack(
            children: [
              Form(
                key: c.formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 48),
                        width: screenW(0.50, context),
                        child: Image.asset("assets/Logo.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Text(
                          "Please enter your user name and password.",
                          style: t2(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 32),
                        child: textBox(
                          "Username",
                          false,
                          () => c.clear(c.userNameCont),
                          c.userNameCont,
                        ),
                      ),
                      Container(
                        child: textBox(
                          "Password",
                          true,
                          () => c.clear(c.passwordCont),
                          c.passwordCont,
                        ),
                      ),
                      GetBuilder<LoginController>(builder: (_) {
                        if (c.isError == true) {
                          return errorDialog("Wrong Username or Password.");
                        } else {
                          return Container();
                        }
                      }),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: screenW(0.9, context),
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: greenButton("LOGIN", c.opacity, () {
                    if (c.formKey.currentState.validate()) {
                      c.login();
                    }
                    print("button pressed");
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
