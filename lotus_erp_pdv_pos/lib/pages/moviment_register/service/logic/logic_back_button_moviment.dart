import 'package:get/get.dart';

import '../../../../services/dependencies.dart';

class LogicBackButtonMoviment {
  var openRegisterController = Dependencies.openRegisterController();

  void back() {
    Get.back();
    openRegisterController.descriptionMovimentController.clear();
    openRegisterController.movimentController.text = '0,00';
    openRegisterController.valueDropdown.value = 'DEBITO';
  }
}
