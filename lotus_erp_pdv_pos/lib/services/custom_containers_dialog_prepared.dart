import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/custom_container_dialog.dart';
import 'dependencies.dart';

class CustomContainersDialogPrepared {
  var configController = Dependencies.configController();
  double sizeDualContainer = Get.size.width * 0.35;

  // Constrói a linha de Containers que mostram o id do caixa e o login do operador
  Widget buildLineIdAndUser() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _buildIdRegister(),
        _buildUserName(),
      ]),
    );
  }

  // Constrói o container informando a data de abertura do caixa
  Widget buildDate() {
    return CustomContainerDialog(
        text: 'DATA',
        information: configController.caixaSelected!.abertura_data!,
        width: sizeDualContainer);
  }

  // Constrói o container informando a data de abertura do caixa
  Widget _buildIdRegister() {
    return CustomContainerDialog(
        text: 'ID Caixa',
        information:
            configController.caixaSelected!.id_caixa.toString().padLeft(6, '0'),
        width: sizeDualContainer);
  }

  // Costrói o container informando o login do operador
  Widget _buildUserName() {
    return CustomContainerDialog(
        text: 'OPERADOR',
        information: configController.userLogin,
        width: sizeDualContainer);
  }
}
