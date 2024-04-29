import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/models/collections/caixa.dart';
import 'package:lotus_erp_pdv_pos/pages/loading/loading_page.dart';
import 'package:lotus_erp_pdv_pos/services/datetime_formatter.dart';

import '../../../repositories/http/open_register_servidor_repository.dart';
import '../../../repositories/isar_db/caixa/insert_caixa.dart';
import '../../../services/dependencies.dart';
import '../../../services/format_numbers.dart';

class LogicOpenRegister {
  var openRegisterController = Dependencies.openRegisterController();
  var configController = Dependencies.configController();

  void openRegister(BuildContext context) async {
    Get.dialog(const LoadingPage());

    openRegisterController.toggleButtonEnabled(false);

    await OpenRegisterServidorRepository().openRegister(context);

  Future.delayed(const Duration(seconds: 1), () async {
    caixa caixaSelected = caixa(
      id_empresa: configController.idCompany,
      abertura_id_user: configController.userId.value,
      abertura_data: DatetimeFormatterWidget.formatDate(DateTime.now()),
      abertura_hora: DatetimeFormatterWidget.formatHour(DateTime.now()),
      abertura_valor: FormatNumbers.formatStringToDouble(
          openRegisterController.openController.text),
      fechou_id_user: null,
      fechou_data: null,
      fechou_hora: null,
      enviado: 0,
      status: 0,
      id_caixa_servidor: configController.idCaixaServidor,
    );

    
      await InsertCaixa().insertCaixaWithCaixaItem(caixaSelected);
    });

    Get.back();
    Get.back();
  }
}
