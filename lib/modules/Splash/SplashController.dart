import 'package:connectivity/connectivity.dart';
import '../GlobalWidgets/Dialogs.dart';
import 'package:get/get.dart';
import '../Login/LoginScreen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    connectivity();
    super.onInit();
  }

  connectivity() async {
    //Connectivity Check
    var connectivityResult = await (Connectivity().checkConnectivity());
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
