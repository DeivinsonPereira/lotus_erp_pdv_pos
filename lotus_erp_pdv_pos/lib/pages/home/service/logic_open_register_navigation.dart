import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/custom_cherry.dart';

import '../../../services/dependencies.dart';
import '../../open_register/open_register_dialog.dart';

class LogicOpenRegisterNavigation {
  var openRegisterController = Dependencies.openRegisterController();
  // faz a logica de abertura do dialog ou não se o caixa estiver aberto
  void openRegisterNavigation(BuildContext context) async {
    if (openRegisterController.isRegisterOpen == false) {
      Get.dialog(const OpenRegisterDialog());
    } else {
      const CustomCherryError(
              message: 'Já existe um caixa aberto para esse usuário!')
          .show(context);
    }
  }
}
