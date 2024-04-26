// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/custom_cherry.dart';
import 'package:lotus_erp_pdv_pos/models/collections/tipo_recebimento.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/empresa/search_empresa.dart';

import '../../../../models/collections/empresa.dart';
import '../../../../repositories/isar_db/dado_empresa/insert_dado_empresa.dart';
import '../../../../repositories/isar_db/tipo_recebimento/search_tipo_recebimento.dart';
import '../../../../services/dependencies.dart';
import '../../../loading/loading_page.dart';

class LogicConfirmButton {
  var configController = Dependencies.configController();
  var pdvController = Dependencies.pdvController();

  Future<void> isValid(BuildContext context) async {
    bool result = _verifyEmpty(context);
    if (result == true) {
      Get.dialog(const LoadingPage());
      await _searchAndInsert(context);
      Get.back();
    } else {
      const CustomCherryError(message: 'Preencha todos os campos!')
          .show(context);
      Get.back();
    }
  }

  Future<bool> _searchAndInsert(BuildContext context) async {
    empresa? empresas = await SearchEmpresa().searchEmpresa();
    if (empresas != null) {
      await InsertDadoEmpresa().insertIp(context, empresas);
      configController.updateVariables();
      // TODO : VERIFICAR A NECESSIDADE
      //   List<usuario> user = await SearchUsuario().search(context);
      //   if (user.isNotEmpty) {
      //     await InsertUsuario().insert(context, user);
      //   }
      List<tipo_recebimento?> paymentType =
          await SearchPaymentType().search(context);

      if (paymentType.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool _verifyEmpty(BuildContext context) {
    if (configController.serieNfceController.text.isEmpty) {
      const CustomCherryError(
              message: 'Preencha o campo Serie NFCE corretamente!')
          .show(context);
      return false;
    }
    if (configController.numCaixaController.text.isEmpty) {
      const CustomCherryError(
              message: 'Preencha o campo Num. Caixa corretamente!')
          .show(context);
      return false;
    }
    return true;
  }
}
