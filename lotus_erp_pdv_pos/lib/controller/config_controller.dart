import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/empresa_valida.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/dado_empresa/get_dado_empresa.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/empresa_valida/get_empresa_valida.dart';
import 'package:lotus_erp_pdv_pos/services/datetime_formatter.dart';

import '../models/collections/dado_empresa.dart';
import '../models/collections/empresa.dart';
import '../pages/config/components/list_dropdown_option.dart';

class ConfigController extends GetxController {
  TextEditingController serieNfceController = TextEditingController();
  TextEditingController numCaixaController = TextEditingController();
  TextEditingController sizePrinterController = TextEditingController();
  TextEditingController backgroundColorController = TextEditingController();

  Logger logger = Logger();

  var ipSelected = '';
  var clienteId = 0;
  var idCompany = 0;
  var serieNfce = 0;
  var numCaixa = 0;
  var sizePrinter = 'SEM IMPRESSORA'.obs;
  var backgroundColor =
      {'name': 'AZUL ESCURO', 'color': const Color(0xFF2B305B)}.obs;

  empresa? empresaSelected = empresa(id: 0);

  var imageLogoPadrao = '';
  var imageLogoBranca = '';

  var userId = 0.obs;
  var userLogin = '';
  var collaboratorId = 0.obs;

  var idCaixaServidor = 0.obs;

  var currentTime = '00:00:00'.obs;

  @override
  void onInit() {
    super.onInit();
    updateCurrentTime();
  }

  // adiciona empresa na variável
  void setEmpresa(empresa data) => empresaSelected = data;

  // Atualiza o id do caixa vindo do servidor
  void setIdCaixaServidor(String value) =>
      idCaixaServidor.value = int.parse(value);

  // Atualiza o tamanho da impressora
  void updateSizePrinter(String value) {
    sizePrinter.value = value;
    update();
  }

  // Atualiza as variaveis
  void updateVariables() async {
    if (serieNfceController.text.isEmpty || numCaixaController.text.isEmpty) {
      dado_empresa? result = await GetDadoEmpresa().getDadoEmpresa();
      empresa_valida? valida =
          await GetEmpresaValida().getDadoTabelaEmpresaValida();
      if (result != null && valida != null) {
        //TODO => ajustar aqui
        clienteId = valida.id_cliente!;
        ipSelected = valida.ip_servidor!;
        serieNfceController.text = result.id_nfce.toString();
        numCaixaController.text = result.num_caixa.toString();

        serieNfce = int.parse(serieNfceController.text);
        numCaixa = int.parse(numCaixaController.text);
        sizePrinter.value = result.tamanho_impressora!;
        updateColorBackground(result.cor_fundo);
      }
      return;
    } else {
      serieNfce = int.parse(serieNfceController.text);
      numCaixa = int.parse(numCaixaController.text);
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

  //BUSCAR A HORA ATUAL DO DISPOSITIVO E FICA ATUALIZANDO A CADA SEGUNDO
  void updateCurrentTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime.value = DatetimeFormatterWidget.formatHour(DateTime.now());
    });
  }

  // Atualiza a variavel userId do usuario logado
  void updateUserId(int value) => userId.value = value;

  // Atualiza a variavel collaboratorId do usuario logado
  void updateCollaboratorId(int value) => collaboratorId.value = value;

  // Atualiza a variavel userLogin do usuario logado
  void updateUserLogin(String value) => userLogin = value;
}
