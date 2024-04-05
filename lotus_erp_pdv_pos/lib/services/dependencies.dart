import 'package:get/get.dart';

import '../controller/bill_controller.dart';
import '../controller/config_controller.dart';
import '../controller/login_controller.dart';
import '../controller/pdv_controller.dart';
import '../controller/weight_controller.dart';

class Dependencies {
  static ConfigController configController() {
    if (Get.isRegistered<ConfigController>()) {
      return Get.find<ConfigController>();
    } else {
      return Get.put(ConfigController(), permanent: true);
    }
  }

  static LoginController loginController() {
    if (Get.isRegistered<LoginController>()) {
      return Get.find<LoginController>();
    } else {
      return Get.put(LoginController());
    }
  }

  static PdvController pdvController() {
    if (Get.isRegistered<PdvController>()) {
      return Get.find<PdvController>();
    } else {
      return Get.put(PdvController());
    }
  }

  static BillController billController() {
    if (Get.isRegistered<BillController>()) {
      return Get.find<BillController>();
    } else {
      return Get.put(BillController());
    }
  }

  static PesageController weightController() {
    if (Get.isRegistered<PesageController>()) {
      return Get.find<PesageController>();
    } else {
      return Get.put(PesageController());
    }
  }
}
