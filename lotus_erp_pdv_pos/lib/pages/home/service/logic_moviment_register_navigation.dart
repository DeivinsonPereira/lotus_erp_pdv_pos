import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/services/dependencies.dart';

import '../../../common/custom_cherry.dart';
import '../../moviment_register/moviment_register_dialog.dart';

class LogicMovimentRegisterNavigation {
  var openRegisterController = Dependencies.openRegisterController();

  void movimentRegisterNavigation(BuildContext context) {
    if (openRegisterController.isRegisterOpen) {
      Get.dialog(const MovimentRegisterDialog());
    } else {
      const CustomCherryError(
              message: 'Não existe um caixa aberto para esse usuário!')
          .show(context);
    }
  }
}
