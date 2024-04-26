// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/dado_empresa.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

import '../../../common/custom_cherry.dart';
import '../../../models/collections/empresa.dart';
import '../../../services/dependencies.dart';

class InsertDadoEmpresa {
  final IsarService _service = IsarService();
  final Logger _logger = Logger();
  var configController = Dependencies.configController();

  //Inserir ip(prefixo) no banco de dados
  Future<void> insertIp(BuildContext context, empresa? empresa) async {
    final isar = await _service.db;

    dado_empresa companyInformation = dado_empresa(
        id_nfce: int.tryParse(configController.serieNfceController.text),
        num_caixa: int.tryParse(configController.numCaixaController.text),
        tamanho_impressora: configController.sizePrinter.value,
        id_empresa: empresa!.id,
        cor_fundo: configController.backgroundColor['name'] as String);

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
