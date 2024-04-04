// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/custom_cherry.dart';
import 'package:lotus_erp_pdv_pos/models/collections/produto_grupo.dart';
import 'package:lotus_erp_pdv_pos/models/collections/usuario.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/tipo_recebimento/insert_tipo_recebimento.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/usuario/insert_usuario.dart';

import '../../../../repositories/http/verify_ip_repository.dart';
import '../../../../repositories/isar_db/dado_empresa/insert_dado_empresa.dart';
import '../../../../repositories/isar_db/grupo/insert_group.dart';
import '../../../../repositories/isar_db/grupo/search_group.dart';
import '../../../../repositories/isar_db/produto/insert_product.dart';
import '../../../../repositories/isar_db/produto/search_product.dart';
import '../../../../repositories/isar_db/tipo_recebimento/search_tipo_recebimento.dart';
import '../../../../repositories/isar_db/usuario/search_usuario.dart';
import '../../../../services/dependencies.dart';
import '../../../loading/loading_page.dart';

class LogicConfirmButton {
  var configController = Dependencies.configController();
  var pdvController = Dependencies.pdvController();

  Future<void> isValid(BuildContext context) async {
    bool result = _verifyEmpty(context);
    if (result == true) {
      bool result = await VerifyIp().verify();
      if (result == true) {
        Get.dialog(const LoadingPage());
        await _searchAndInsert(context);
        

        Get.back();
      }
    } else {
      const CustomCherryError(
        message: 'Ip inválido, verifique o campo e tente novamente!',
      ).show(context);
      Get.back();
    }
  }

  Future<bool> _searchAndInsert(BuildContext context) async {
    var instance = InsertDadoEmpresa();
    await instance.insertIp(configController, context);
    configController.updateVariables();
    List<usuario> user = await SearchUsuario().search(context);
    if (user.isNotEmpty) {
      await InsertUsuario().insert(context, user);
    }
    List<produto_grupo> group = await SearchGroup().search(context);
    if (group.isNotEmpty) {
      await InsertGroup().insert(context, group);
    }
    var product = await SearchProduct().search(context);
    if (product.isNotEmpty) {
      await InsertProduct().insert(context, product);
    }
    var paymentType = await SearchPaymentType().search(context);
    bool result = false;
    if (paymentType.isNotEmpty) {
      result = await InsertTipoRecebimento().insert(context, paymentType);
    }
    if (paymentType.isNotEmpty &&
        group.isNotEmpty &&
        user.isNotEmpty &&
        product.isNotEmpty &&
        result == true) {
      return true;
    } else {
      return false;
    }
  }

  bool _verifyEmpty(BuildContext context) {
    if (configController.contractController.text.isEmpty) {
      const CustomCherryError(message: 'Preencha o campo ip corretamente!')
          .show(context);
      return false;
    }
    if (configController.idCompanyController.text.isEmpty) {
      const CustomCherryError(
              message: 'Preencha o campo Id Empresa corretamente!')
          .show(context);
      return false;
    }
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
    if (configController.intervalController.text.isEmpty) {
      const CustomCherryError(
              message: 'Preencha o campo Intervalo corretamente!')
          .show(context);
      return false;
    }
    return true;
  }
}
