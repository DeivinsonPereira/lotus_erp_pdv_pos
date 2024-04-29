// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/repositories/components/endpoints.dart';

import '../../common/custom_cherry.dart';
import '../../models/login_model.dart';
import '../../services/dependencies.dart';

import 'package:http/http.dart' as http;

import '../components/header.dart';

class ExecuteLogin {
  var loginController = Dependencies.loginController();
  var configController = Dependencies.configController();
  final Logger _logger = Logger();

  Future<bool> login(Login login, BuildContext context) async {
    Uri uri = Uri.parse(Endpoints().endpointLogin());

    try {
      var response = await http.post(uri,
          headers: Header.getBasicHeader(), body: login.toJson());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          var user = data['itens']['user'];
          configController.updateUserId(user['id']);
          configController.updateUserLogin(user['name']);
          return true;
        } else {
          CustomCherryError(message: data['message']).show(context);
          _logger.e('Erro ao realizar o login: ${data['message']}');
          return false;
        }
      } else {
        const CustomCherryError(message: 'Erro ao realizar o login.')
            .show(context);
        _logger.e('Erro ao realizar o login: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      const CustomCherryError(message: 'Erro ao realizar o login.')
          .show(context);
      _logger.e('Erro ao realizar o login: $e');
      return false;
    }
  }
}
