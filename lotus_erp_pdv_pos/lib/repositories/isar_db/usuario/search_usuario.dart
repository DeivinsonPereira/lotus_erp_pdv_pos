// ignore_for_file: use_build_context_synchronously
/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/repositories/components/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:lotus_erp_pdv_pos/repositories/components/header.dart';

import '../../../models/collections/usuario.dart';

class SearchUsuario {
  final Logger _logger = Logger();

  Future<List<usuario>> search(BuildContext context) async {
    Uri uri = Uri.parse(Endpoints().endpointuSearchUsuario());

    try {
      var response = await http.get(uri, headers: Header.getBasicHeader());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          List<usuario> users = [];
          for (var user in data['itens']) {
            users.add(usuario.fromMap(user));
          }
          return users;
        } else {
          _logger.e('Erro ao buscar usuários. message: ${data['message']}');
          return [];
        }
      } else {
        _logger
            .e('Erro ao buscar usuários. statusCode: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar usuários. $e');
      return [];
    }
  }
}
*/