// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/dado_empresa.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

import '../../../common/custom_cherry.dart';
import '../../../controller/config_controller.dart';

class InsertDadoEmpresa {
  final IsarService _service = IsarService();
  final Logger _logger = Logger();

  //Inserir ip(prefixo) no banco de dados
  Future<void> insertIp(
      ConfigController controller, BuildContext context) async {
    final isar = await _service.db;
    String ip;
    if (controller.contractController.text.endsWith('/')) {
      ip = controller.contractController.text;
    } else {
      ip = '${controller.contractController.text}/';
    }

    dado_empresa companyInformation = dado_empresa(
        ip_empresa: ip,
        id_empresa: int.tryParse(controller.idCompanyController.text),
        id_nfce: int.tryParse(controller.serieNfceController.text),
        num_caixa: int.tryParse(controller.numCaixaController.text),
        intervalo_envio: int.tryParse(controller.intervalController.text),
        tamanho_impressora: controller.sizePrinter.value,
        cor_fundo: controller.backgroundColor['name'] as String);

    try {
      await isar.writeTxn(() async {
        var i = await isar.dado_empresas.count();
        if (i > 0) {
          isar.dado_empresas.clear();
        }

        await isar.dado_empresas.put(companyInformation);
        _logger.d('Ip inserido no banco de dados');
        const CustomCherrySuccess(message: 'Ip inserido com sucesso!')
            .show(context);
      });
    } catch (e) {
      _logger.e('Falha ao inserir o ip no banco de dados. $e');
      CustomCherryError(message: 'Falha ao inserir o ip no banco de dados. $e')
          .show(context);
    }
    Get.back();
  }
}
