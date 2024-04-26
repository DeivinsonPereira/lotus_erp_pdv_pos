// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../common/custom_cherry.dart';
import '../../../models/collections/empresa_valida.dart';
import '../../../services/dependencies.dart';
import '../../components/endpoints.dart';
import '../../components/header.dart';

class SearchEmpresaValida {
  final Logger _logger = Logger();
  var empresaValidaController = Dependencies.empresaValidaController();

  // Busca o id do cliente
  Future<empresa_valida?> searchIdClient() async {
    var uri = Uri.parse(Endpoints().endpointSearchClientId());

    var bodyRequest = {
      'cpf_cnpj': empresaValidaController.cnpjController.text,
    };

    try {
      var response = await http.post(uri,
          headers: Header.getBasicHeader(), body: jsonEncode(bodyRequest));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          var item = data['itens'][0];
          var dadoEmpresa = empresa_valida.fromMap(item);
          return dadoEmpresa;
        } else {
          _logger.e('Erro ao buscar dados da empresa: ${data['message']}');
          empresaValidaController.updateIsButtonEnabled(true);
          return null;
        }
      } else {
        _logger.e('Erro ao buscar dados da empresa: ${response.statusCode}');
        empresaValidaController.updateIsButtonEnabled(true);
        return null;
      }
    } catch (e) {
      _logger.e('Erro ao buscar dados da empresa: $e');
      empresaValidaController.updateIsButtonEnabled(true);
      return null;
    }
  }

  // Obtém a liberação do servidor
  Future<String?> searchLicenceFromServer(BuildContext context) async {
    var uri = Uri.parse(await Endpoints().endpointEmpresaValida());

    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          empresaValidaController.addIp(data['ip_servidor']);
          empresaValidaController.addLicence(
              empresaValidaController.licencaContratoController.text);
          empresaValidaController
              .addCnpj(empresaValidaController.cnpjController.text);
          var item = data['contrato'];
          return item;
        } else {
          _logger.e('Erro ao validar a licença da empresa: ${data['message']}');
          empresaValidaController.updateIsButtonEnabled(true);
          CustomCherryError(
            message: 'Erro ao validar a licença da empresa. ${data['message']}',
          ).show(context);
          return null;
        }
      } else {
        _logger
            .e('Erro ao validar a licença da empresa: ${response.statusCode}');
        empresaValidaController.updateIsButtonEnabled(true);
        return null;
      }
    } catch (e) {
      _logger.e('Erro ao validar a licença da empresa: $e');
      empresaValidaController.updateIsButtonEnabled(true);
      return null;
    }
  }

  // Verifica se o contrato ainda está válido
  Future<bool> isValidContract(BuildContext context) async {
    var uri = Uri.parse(Endpoints().endpointLicenceSituation());

    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          return true;
        } else {
          _logger.e('Erro ao validar o contrato: ${data['message']}');
          CustomCherryError(message: data['message']).show(context);
          return false;
        }
      } else {
        _logger.e('Erro ao validar o contrato: ${response.statusCode}');
        const CustomCherryError(message: 'Erro ao validar o contrato.')
            .show(context);
        return false;
      }
    } catch (e) {
      _logger.e('Erro ao validar o contrato: $e');
      const CustomCherryError(message: 'Erro ao validar o contrato.')
          .show(context);
      return false;
    }
  }
}
