import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/pages/open_register/components/sent.dart';

class OpenRegisterController extends GetxController {
  TextEditingController openController = TextEditingController();

  double value = 0.0;
  var buttonEnabled = true.obs;
  int sent = Sent.SENT.index;

  // Converte o valor de texto para double
  void setValue() {
    value = double.parse(openController.text);
  }

  // Ativa ou desativa o botão
  void toggleButtonEnabled(bool value) {
    buttonEnabled.value = value;
    update();
  }

  // Atualiza o valor de sent (enviado)
  void updateSent(int value) {
    sent = value;
  }
}
