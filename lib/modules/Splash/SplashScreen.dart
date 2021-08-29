import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'SplashController.dart';

class SplashScreen extends StatelessWidget {
  final SplashController c = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Image.asset("assets/Logo.png"),
      ),
    ));
  }
}
