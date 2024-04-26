// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../common/custom_cherry.dart';
import '../../../../models/collections/empresa_valida.dart';
import '../../../../repositories/isar_db/empresa_valida/insert_empresa_valida.dart';
import '../../../../repositories/isar_db/empresa_valida/search_empresa_valida.dart';
import '../../../../services/dependencies.dart';

class LogicValidContract {
  final Logger _logger = Logger();
  var empresaValidaController = Dependencies.empresaValidaController();

  Future<void> valid(BuildContext context) async {
    if (empresaValidaController.isButtonEnabled.value) {
      empresaValidaController.updateIsButtonEnabled(false);
      empresa_valida? valida = empresa_valida(licenca: '', cnpj: '');

      try {
        String? response =
            await SearchEmpresaValida().searchLicenceFromServer(context);
        if (response != null) {
          valida.contrato = response;
          if (empresaValidaController.ipSelected.endsWith('/')) {
            valida.ip_servidor = empresaValidaController.ipSelected;
          } else {
            valida.ip_servidor = '${empresaValidaController.ipSelected}/';
          }
        } else {
          _logger.e('Erro ao validar o contrato.');
          empresaValidaController.updateIsButtonEnabled(true);
          return;
        }
      } catch (e) {
        _logger.e('Erro ao validar o contrato $e');
        empresaValidaController.updateIsButtonEnabled(true);
        const CustomCherryError(message: 'Erro ao validar o contrato.')
            .show(context);
        return;
      }
      
      try {
        empresa_valida? response = await SearchEmpresaValida().searchIdClient();
        if (response != null) {
          valida.id_cliente = response.id_cliente;
          valida.licenca =
              empresaValidaController.licencaContratoController.text;
          valida.cnpj = empresaValidaController.cnpjController.text;
        } else {
          _logger.e('Erro ao buscar o  id do cliente.');
          const CustomCherryError(message: 'Erro ao buscar o id do cliente.')
              .show(context);
          empresaValidaController.updateIsButtonEnabled(true);
          return;
        }
      } catch (e) {
        _logger.e('Erro ao buscar o id do cliente $e');
        empresaValidaController.updateIsButtonEnabled(true);
        const CustomCherryError(message: 'Erro ao buscar o id do cliente.')
            .show(context);
        return;
      }

      try {
        InsertEmpresaValida().insertEmpresaValida(valida, context);
        const CustomCherrySuccess(message: 'Contrato validado com sucesso.')
            .show(context);
        Get.back();
      } catch (e) {
        _logger.e('Erro ao salvar os dados $e');
        const CustomCherryError(
                message: 'Erro ao salvar o contrato no banco de dados.')
            .show(context);
        empresaValidaController.updateIsButtonEnabled(true);
        return;
      }
    }
  }
}
