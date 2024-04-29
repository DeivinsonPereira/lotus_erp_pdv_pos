import 'package:get/get.dart';

class BackOperations {
  void executeBackOperations(int quantity) {
    for (var i = 0; i < quantity; i++) {
      Get.back();
    }
  }
}
