import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/pages/open_register/components/sent.dart';
import 'package:lotus_erp_pdv_pos/repositories/components/endpoints.dart';
import 'package:lotus_erp_pdv_pos/services/datetime_formatter.dart';
import 'package:lotus_erp_pdv_pos/services/format_numbers.dart';
import 'package:http/http.dart' as http;

import '../../services/dependencies.dart';
import '../components/header.dart';

class OpenRegisterServidorRepository {
  var configController = Dependencies.configController();
  var openRegisterController = Dependencies.openRegisterController();

  final Logger _logger = Logger();

  Future<bool> openRegister() async {
    var uri = Uri.parse(Endpoints().endpointOpenRegister());
    int idEmpresa = configController.idCompany.value;
    int idUsuario = configController.userId.value;
    String caixaDataHora = DatetimeFormatterWidget.formatDate(DateTime.now());
    String horaAbertura = DatetimeFormatterWidget.formatHour(DateTime.now());
    double valorAbertura = FormatNumbers.formatStringToDouble(
        openRegisterController.openController.text);

    try {
      var responseBody = {
        'id_empresa': idEmpresa,
        'id_usuario': idUsuario,
        'caixa_data_hora': caixaDataHora,
        'hora_abertura': horaAbertura,
        'valor_abertura': valorAbertura,
      };

      var body = jsonEncode(responseBody);

      final response = await http.post(
        uri,
        headers: Header.header,
        body: body,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          configController.setIdCaixaServidor(data['message']);
          openRegisterController.updateSent(Sent.SENT.index);
          return true;
        } else {
          _logger.e('Erro ao abrir o caixa. message: ${data['message']}');
          openRegisterController.updateSent(Sent.NOT_SENT.index);
          return false;
        }
      } else {
        _logger.e('Erro ao abrir o caixa. statusCode: ${response.statusCode}');
        openRegisterController.updateSent(Sent.NOT_SENT.index);
        return false;
      }
    } catch (e) {
      _logger.e('Erro ao abrir o caixa. $e');
      openRegisterController.updateSent(Sent.NOT_SENT.index);
      return false;
    }
  }
}