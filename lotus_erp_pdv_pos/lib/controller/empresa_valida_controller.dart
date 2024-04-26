// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/collections/empresa_valida.dart';
import '../pages/empresa_valida/empresa_valida_popup_page.dart';
import '../repositories/isar_db/empresa_valida/get_empresa_valida.dart';
import '../repositories/isar_db/empresa_valida/search_empresa_valida.dart';

class EmpresaValidaController extends GetxController {
  TextEditingController licencaContratoController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();

  var empresaContrato = ''.obs;
  bool isContratoValido = false;
  var isButtonEnabled = false.obs;
  String ipSelected = '';
  String licence = '';
  String cnpj = '';
  int idCliente = 0;

  @override
  void onInit() async {
    super.onInit();
    updateIsButtonEnabled(true);
  }

  // ADICIONA O IP NA VARIAVEL IPSELECTED
  void addIp(String value) => ipSelected = value;

  // ADICIONA A LICENCA NA VARIAVEL LICENCE
  void addLicence(String value) => licence = value;

  // ADICIONA O CNPJ NA VARIAVEL CNPJ
  void addCnpj(String value) => cnpj = value;

  // CARREGAR CONTRATO
  Future<void> loadContrato(BuildContext context) async {
    empresa_valida? dadosContrato =
        await GetEmpresaValida().getDadoTabelaEmpresaValida();
    if (dadosContrato != null &&
        dadosContrato.ip_servidor != null &&
        dadosContrato.licenca != null &&
        dadosContrato.cnpj != null &&
        dadosContrato.id_cliente != null) {
      ipSelected = dadosContrato.ip_servidor!;
      licence = dadosContrato.licenca!;
      cnpj = dadosContrato.cnpj!;
      idCliente = dadosContrato.id_cliente!;
      var success = await SearchEmpresaValida().isValidContract(context);
      if (!success) {
        Get.dialog(barrierDismissible: false, const EmpresaValidaPopupPage());
      }
    } else {
      Get.dialog(barrierDismissible: false, const EmpresaValidaPopupPage());
    }
  }
/* TODO => ver se é necessário para o funcionamento.
  // ATUALIZAR CAMPO DE TEXTO DO CONTRATO NAS CONFIGURAÇÕES
  Future<void> updateContractConfig() async {
    var textFieldController = Dependencies.textFieldController();

    var dadosContrato = await GetEmpresaValida().getDadoTabelaEmpresaValida();
    if (dadosContrato != null &&
        textFieldController.numContratoEmpresaController.text == '') {
      textFieldController.numContratoEmpresaController.text =
          dadosContrato.contrato!;
    } else {
      _logger.e('Erro ao buscar os dados da tabela empresa_valida');
    }
  }
*/
  //adiciona o valor no campo empresaContrato
  void updateEmpresaContrato(String value) {
    empresaContrato.value = value;
    update();
  }

  //atualiza o campo empresaContrato
  void updateIsButtonEnabled(bool value) {
    isButtonEnabled.value = value;
    update();
  }

  //limpa o campo empresaContrato
  void clear() {
    licencaContratoController.clear();
    cnpjController.clear();
    update();
  }
}
