import 'package:flutter/foundation.dart';

import '../../services/dependencies.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Endpoints {
  static var empresaValidaController = Dependencies.empresaValidaController();
  var ip = empresaValidaController.ipSelected;
  var idCliente = empresaValidaController.idCliente;
  var ipSiagenet = 'http://siage.vistatecnologia.com.br/cgi-bin/siagenet/';

  Future<String> endpointEmpresaValida() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (kDebugMode) {
      print(androidInfo.serialNumber);
    }
    return '${ipSiagenet}licenca_ativar?ptipo=0&pchave=${empresaValidaController.licencaContratoController.text}&pnserie=${androidInfo.serialNumber}&pcnpj=${empresaValidaController.cnpjController.text}';
  }

  String endpointLicenceSituation() {
    return '${ipSiagenet}licenca_situacao?pchave=${empresaValidaController.licence}&pcnpj=${empresaValidaController.cnpj}';
  }

  String endpointSearchClientId() {
    return '${ip}partner-clientes?method=retornaId';
  }

  String endpointLogin() {
    return '${ip}auth/user/pass';
  }

  String endpointEmpresa() {
    return '${ip}empresa?method=obterPeloCnpj';
  }

  String endpointGrupo() {
    return '${ip}produto-grupos/?method=obterTodos&id_partner_cliente=$idCliente';
  }

  String endpointProdutos() {
    return '${ip}produto?method=obterTodos&id_partner_cliente=$idCliente';
  }

  String endpointTipoRecebimento() {
    return '${ip}tipo-recebimento?method=obterTodos&id_partner_cliente=$idCliente';
  }

  String endpointAbrirCaixa() {
    return '${ip}caixa?method=abrir';
  }

  String endpointFecharCaixa() {
    return '${ip}caixa?method=fechar';
  }

  String endpointCaixaItem() {
    return '${ip}caixa-itens?method=movimentar';
  }

  String endpointSearchImageGroup(String file) {
    return '${ip}produto-grupos?method=retornarImagem&id_partner_cliente=$idCliente&img=$file';
  }

  String endpointSearchImageProduct(String file) {
    return '${ip}produto?method=retornarImagem&id_partner_cliente=$idCliente&img=$file';
  }

  String endpointSearchDefaultLogo(String? file) {
    return '${ip}empresa?method=retornarImagem&id_partner_cliente=$idCliente&img=$file';
  }

  String endpointSearchWhiteLogo(String? file) {
    return '${ip}empresa?method=retornarImagem&id_partner_cliente=$idCliente&img=$file';
  }

  String endpointVenda() {
    return '${ip}venda';
  }

  String endpointNfceEmitir() {
    return '${ip}nfce/emitir';
  }
}
