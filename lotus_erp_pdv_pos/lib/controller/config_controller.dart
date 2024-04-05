import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/dado_empresa/get_dado_empresa.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

import '../models/collections/dado_empresa.dart';
import '../pages/config/components/list_dropdown_option.dart';

class ConfigController extends GetxController {
  TextEditingController contractController = TextEditingController();
  TextEditingController idCompanyController = TextEditingController();
  TextEditingController serieNfceController = TextEditingController();
  TextEditingController numCaixaController = TextEditingController();
  TextEditingController intervalController = TextEditingController();
  TextEditingController sizePrinterController = TextEditingController();
  TextEditingController backgroundColorController = TextEditingController();

  Logger logger = Logger();

  var ipSelected = ''.obs;
  var idCompany = 0.obs;
  var idNfce = 0.obs;
  var numCaixa = 0.obs;
  var interval = 0.obs;
  var sizePrinter = 'SEM IMPRESSORA'.obs;
  var backgroundColor =
      {'name': 'AZUL ESCURO', 'color': const Color(0xFF2B305B)}.obs;

  var imageLogoPadrao = '';
  var imageLogoBranca = '';

  var userId = 0.obs;
  var collaboratorId = 0.obs;
  var userLogin = '';

  var idCaixaServidor = 0.obs;

  @override
  void onInit() {
    super.onInit();
    addContratoController();
  }

  // Atualiza o id do caixa vindo do servidor
  void setIdCaixaServidor(String value) =>
      idCaixaServidor.value = int.parse(value);

  // Adiciona o ip
  void addIpController(String value) => contractController.text = value;

  // Atualiza o tamanho da impressora
  void updateSizePrinter(String value) {
    sizePrinter.value = value;
    update();
  }

  // Atualiza as variaveis
  void updateVariables() async {
    if (contractController.text.isEmpty ||
        idCompanyController.text.isEmpty ||
        serieNfceController.text.isEmpty ||
        numCaixaController.text.isEmpty ||
        intervalController.text.isEmpty) {
      var instance = GetDadoEmpresa(Logger(), IsarService());
      dado_empresa? result = await instance.getDadoEmpresa();
      if (result != null) {
        contractController.text = result.ip_empresa!;
        idCompanyController.text = result.id_empresa.toString();
        serieNfceController.text = result.id_nfce.toString();
        numCaixaController.text = result.num_caixa.toString();
        intervalController.text = result.intervalo_envio!.toString();

        ipSelected.value = contractController.text;
        idCompany.value = int.parse(idCompanyController.text);
        idNfce.value = int.parse(serieNfceController.text);
        numCaixa.value = int.parse(numCaixaController.text);
        interval.value = int.parse(intervalController.text);
        sizePrinter.value = result.tamanho_impressora!;
        updateColorBackground(result.cor_fundo);
      }
      return;
    } else {
      ipSelected.value = contractController.text;
      idCompany.value = int.parse(idCompanyController.text);
      idNfce.value = int.parse(serieNfceController.text);
      numCaixa.value = int.parse(numCaixaController.text);
      interval.value = int.parse(intervalController.text);
    }
  }

  //ESCOLHE UMA COR PARA O BACKGROUND
  Future<void> updateColorBackground(String? name) async {
    if (name == null) {
      backgroundColor['name'] = 'AZUL ESCURO';
      backgroundColor['color'] = const Color(0xFF2B305B);
    } else {
      var colorSelectedByName = ListDropdownOption().listColors.firstWhere(
            (element) => element['name'] == name,
          );
      backgroundColor['name'] = colorSelectedByName['name'];
      backgroundColor['color'] = colorSelectedByName['color'];
    }
    update();
  }

  // Atualiza a variavel ipSelected
  Future<void> addContratoController() async {
    late String ip;

    ip = contractController.text;
    if (ip.isEmpty || ip.isBlank == true) {
      var instance = GetDadoEmpresa(Logger(), IsarService());
      dado_empresa? result = await instance.getDadoEmpresa();
      if (result != null && result.ip_empresa!.isNotEmpty) {
        ip = result.ip_empresa!;
        ipSelected.value = ip;
      } else {
        ip = '';
        logger.e('Nenhum ip encontrado.');
      }
    }
    contractController.text = ip;
  }

  // Atualiza a variavel userId do usuario logado
  void updateUserId(int value) => userId.value = value;

  // Atualiza a variavel collaboratorId do usuario logado
  void updateCollaboratorId(int value) => collaboratorId.value = value;

  // Atualiza a variavel userLogin do usuario logado
  void updateUserLogin(String value) => userLogin = value;
}
