import 'package:get/get.dart';

class BackgourdController extends GetxController {
  RxBool home = false.obs;

  var blurlevel = 0.0.obs;

  void changeHome(bool value) {
    home.value = value;
  }

  void changeBlurlevel(double value) {
    blurlevel.value = value;
  }
}
