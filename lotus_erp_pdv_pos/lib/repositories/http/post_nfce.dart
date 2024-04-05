// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../../common/custom_cherry.dart';
import '../../services/datetime_formatter.dart';
import '../../services/dependencies.dart';
import '../components/endpoints.dart';
import '../components/header.dart';

class PostNfce {
  var pdvController = Dependencies.pdvController();
  var billController = Dependencies.billController();
  var paymentController = Dependencies.paymentController();
  var configController = Dependencies.configController();
  Logger logger = Logger();

  Future<String> postNfce(BuildContext context) async {
    Uri uri = Uri.parse(Endpoints().endpointPostNFCE());

    try {
      var item = [];
      var carrinho = billController.cartShopping;
      var pagamento = [
        {
          'tipo_movimento': paymentController.paymentSelected.id,
          'valor_cre': billController.getTotal()
        }
      ];
      int count = 1;

      for (var element in carrinho) {
        var product = {
          'item': count,
          'id_produto': element['product'].id_produto,
          'vlr_vendido': element['product'].pvenda,
          'qtde': element['quantity'],
          'tot_bruto': element['product'].pvenda,
          'vlr_desc_prc': 0.0,
          'vlr_desc_vlr': 0.0,
          'vlr_liquido': element['product'].pvenda * element['quantity'],
          'grade': element['product'].unidade
        };
        item.add(product);

        count++;
      }

      var bodyRequest = {
        "id_venda": 0, // --> SEMPRE ZERADO
        "id_venda_servidor": 0, // --> SEMPRE ZERADO
        "data_venda": DatetimeFormatterWidget.formatDate(DateTime.now()),
        "hora_venda": DatetimeFormatterWidget.formatHour(DateTime.now()),
        "id_empresa": configController.idCompany.value,
        "id_vendedor": configController.collaboratorId.value,
        "id_usuario": configController.userId.value,
        "tot_bruto": billController.getTotal(),
        "tot_desc_prc": 0.0,
        "tot_desc_vlr": 0.0,
        "tot_liquido": billController.getTotal(),
        "valor_troco": 0.0,
        "id_serie_nfce": configController.idNfce.value,
        "cpf_cnpj": '',
        "totem_id": 1,
        "totem_dinheiro": "",
        "totem_comanda": 1,
        "itens": item,
        "pagamentos": pagamento
      };

      var formattedBody = json.encode(bodyRequest);
      print(formattedBody);
      var response =
          await http.post(uri, body: formattedBody, headers: Header.header);
      if (response.statusCode == 200) {
        logger.i("Requisição enviada com sucesso");
        var jsonResponse = jsonDecode(response.body);
        if (kDebugMode) {
          print('id_venda: ${jsonResponse['id_venda']}');
          print('qr_code: ${jsonResponse['qr_code']}');
          print('xml: ${jsonResponse['xml']}');
        }
        if (jsonResponse['id_venda'] != null &&
            jsonResponse['qr_code'] != null &&
            jsonResponse['xml'] != null) {
          int idVenda = int.parse(jsonResponse['id_venda']);
          String qrCode = jsonResponse['qr_code'];
          String xml = jsonResponse['xml'];
          paymentController.updateVariaveisNfce(idVenda, qrCode, xml);
          return qrCode;
        } else {
          const CustomCherryError(message: 'Erro ao gerar nota fiscal.')
              .show(context);
          logger.e("Erro ao fazer a requisição: ${response.statusCode}");
          return '';
        }
      } else {
        logger.e("Erro ao fazer a requisição: ${response.statusCode}");
        return '';
      }
    } catch (e) {
      logger.e("Erro ao fazer a requisição: $e");
      const CustomCherryError(message: 'Erro ao gerar nota fiscal.')
          .show(context);
      return '';
    }
  }
}
