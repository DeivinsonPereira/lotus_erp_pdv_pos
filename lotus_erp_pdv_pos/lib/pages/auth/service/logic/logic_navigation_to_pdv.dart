import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/pages/open_register/open_register_dialog.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/caixa/insert_caixa.dart';
import 'package:lotus_erp_pdv_pos/services/datetime_formatter.dart';

import '../../../../models/collections/caixa.dart';
import '../../../../repositories/http/download_persist_servidor_repository.dart';
import '../../../../repositories/http/open_register_servidor_repository.dart';
import '../../../../repositories/isar_db/caixa/get_caixa.dart';
import '../../../../repositories/isar_db/image_path_group/insert_path_group.dart';
import '../../../../repositories/isar_db/image_path_product/insert_path_product.dart';
import '../../../../services/dependencies.dart';
import '../../../../services/format_numbers.dart';
import '../../../loading/loading_page.dart';
import '../../../pdv/pdv_page.dart';

class LogicNavigationToPdv {
  var pdvController = Dependencies.pdvController();
  var configController = Dependencies.configController();
  var openRegisterController = Dependencies.openRegisterController();
  var loginController = Dependencies.loginController();
  var paymentController = Dependencies.paymentController();
  // navega para o pdv
  Future<void> navigationToPdv(BuildContext context) async {
    var openCaixa = await GetCaixa().getOpenCaixa();
    if (openCaixa != null) {
      _methodsClosedCaixa();
    } else {
      Get.dialog(const OpenRegisterDialog(), transitionCurve: Curves.easeInOut);
    }
  }

  // navega para o pdv
  Future<void> navigationToPdvWithOpenRegister(BuildContext context) async {
    _methodsOpenCaixa();
  }

  // faz as chamadas dos métodos necessários para iniciar o pdv
  Future<void> _methodsClosedCaixa() async {
    Get.dialog(const LoadingPage());

    await pdvController.setGroups();
    await pdvController.setProducts();
    pdvController.addGroupDescription();
    await DownloadImagesRepository().downloadImageGroups();
    await DownloadImagesRepository().downloadImageProducts();
    await InsertPathGroup().saveImagemGrupos();
    await InsertPathProduct().saveImagemProdutos();
    Future.delayed(const Duration(seconds: 2), () async {
      await pdvController.setPathImageGroup();
      await pdvController.setPathImageProducts();
      await pdvController.filterProducts();
      await pdvController.filterPathImageProducts();
      paymentController.getPaymentForms();
      loginController.passwordController.clear();
      loginController.usernameController.clear();
      Get.back();
      Get.to(() => const PdvPage(), transition: Transition.rightToLeft);
      openRegisterController.toggleButtonEnabled(true);
    });
  }

  Future<void> _methodsOpenCaixa() async {
    var valorAbertura = FormatNumbers.formatStringToDouble(
        openRegisterController.openController.text);

    Get.dialog(const LoadingPage());

    await OpenRegisterServidorRepository().openRegister();

    caixa caixas = caixa(
        id_empresa: configController.idCompany.value,
        abertura_id_user: configController.userId.value,
        abertura_data: DateTime.now(),
        abertura_hora: DatetimeFormatterWidget.formatHour(DateTime.now()),
        abertura_valor: FormatNumbers.formatStringToDouble(
            openRegisterController.openController.text),
        status: 0,
        fechou_id_user: null,
        fechou_data: null,
        fechou_hora: null,
        enviado: 0,
        id_caixa_servidor: configController.idCaixaServidor.value);

    if (valorAbertura > 0.00) {
      InsertCaixa().insertCaixa(caixas);
    } else {
      InsertCaixa().insertCaixaWithCaixaItem(caixas);
    }

    await pdvController.setGroups();
    await pdvController.setProducts();
    pdvController.addGroupDescription();
    await DownloadImagesRepository().downloadImageGroups();
    await DownloadImagesRepository().downloadImageProducts();
    await InsertPathGroup().saveImagemGrupos();
    await InsertPathProduct().saveImagemProdutos();
    Future.delayed(const Duration(seconds: 2), () async {
      await pdvController.setPathImageGroup();
      await pdvController.setPathImageProducts();
      await pdvController.filterProducts();
      await pdvController.filterPathImageProducts();
      paymentController.getPaymentForms();
      Get.back();
      Get.back();
      Get.to(() => const PdvPage(), transition: Transition.rightToLeft);
      openRegisterController.toggleButtonEnabled(true);
    });
  }
}
