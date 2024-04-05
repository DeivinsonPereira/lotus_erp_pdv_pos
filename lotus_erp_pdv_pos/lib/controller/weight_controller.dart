import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesageController extends GetxController {
  TextEditingController weighingController = TextEditingController(text: '0.000');

  var weight = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    weighingController.addListener(_atualizarPesagem);
  }

  // mantém o campo de texto com o formato para pesagem
  void _atualizarPesagem() {
    String input = weighingController.text
        .replaceAll('.', '')
        .replaceAll(',', '')
        .replaceAll(RegExp(r'[^0-9]'), '');

    if (input.length > 9) {
      input = input.substring(input.length - 9);
    }

    double valor = input.isEmpty
        ? 0
        : double.parse(input) / 1000; 

    String valorFormatado = valor.toStringAsFixed(3);

    weight.value = valor;

    if (weighingController.text != valorFormatado) {
      weighingController.value = TextEditingValue(
        text: valorFormatado,
        selection: TextSelection.collapsed(offset: valorFormatado.length),
      );
    }
  }

  void cleanWeightController() {
    weighingController.clear();
    update();
  }

}
