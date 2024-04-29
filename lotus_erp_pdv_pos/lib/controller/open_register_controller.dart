import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/pages/open_register/components/sent.dart';

import '../models/collections/caixa.dart';
import '../repositories/isar_db/caixa/get_caixa.dart';

class OpenRegisterController extends GetxController {
  TextEditingController openController = TextEditingController(text: '0,00');
  TextEditingController movimentController = TextEditingController(text: '0,00');
  TextEditingController descriptionMovimentController = TextEditingController();
  // open
  var buttonEnabled = true.obs;
  int sent = Sent.SENT.index;
  bool isRegisterOpen = false;

  void clearAllMoviment() {
    movimentController.text = '0,00';
    descriptionMovimentController.text = '';
  }

  // moviment
  var valueDropdown = 'DEBITO'.obs;

  void updateValueDropdown(String value) {
    valueDropdown.value = value;
    update();
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

  Future<void> verifyIsRegisterOpen() async {
    caixa? caixaSelected = await GetCaixa().getOpenCaixa();
    if (caixaSelected != null) {
      isRegisterOpen = true;
    } else {
      isRegisterOpen = false;
    }
  }

  void toggleIsRegisterOpen(bool value) {
    isRegisterOpen = value;
  }
}
