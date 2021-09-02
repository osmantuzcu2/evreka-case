import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

import '../global_widgets/dialogs.dart';
import '../login/login_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    connectivity();
    super.onInit();
  }

  ///Connectivity Check
  dynamic connectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.dialog(
        errorDialog("Please Check Your Connectivity"),
        barrierDismissible: true,
      );
    } else {
      Get.off(LoginScreen());
    }
  }
}
