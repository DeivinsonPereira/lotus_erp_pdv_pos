// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/repositories/components/endpoints.dart';
import 'package:lotus_erp_pdv_pos/services/datetime_formatter.dart';
import 'package:lotus_erp_pdv_pos/services/format_numbers.dart';

import '../../services/dependencies.dart';
import '../components/header.dart';

class MovimentRegisterToServer {
  var configController = Dependencies.configController();
  var openRegisterController = Dependencies.openRegisterController();

  final Logger _logger = Logger();

  Future<bool> send(BuildContext context) async {
    Uri uri = Uri.parse(Endpoints().endpointCaixaItem());

    try {
      double value = FormatNumbers.formatStringToDouble(
          openRegisterController.movimentController.text);

      var bodyRequest = {
        "id_caixa_servidor": configController.idCaixaServidor,
        "descricao": openRegisterController.descriptionMovimentController.text,
        "data": DatetimeFormatterWidget.formatDate(DateTime.now()),
        "id_tipo_recebimento": 1,
        "valor_cre": value,
        "valor_deb": 0,
        "id_usuario": configController.userId.value,
        "id_partner_cliente": configController.clienteId
      };

      var body = jsonEncode(bodyRequest);

      var response =
          await http.post(uri, headers: Header.getBasicHeader(), body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          _logger.i('Movimentação registrada com sucesso');
          return true;
        } else {
          _logger.e('Erro ao registrar movimentação: ${data['message']}');
          return false;
        }
      } else {
        _logger.e('Erro ao registrar movimentação: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      _logger.e('Erro ao registrar movimentação: $e');
      return false;
    }
  }
}
