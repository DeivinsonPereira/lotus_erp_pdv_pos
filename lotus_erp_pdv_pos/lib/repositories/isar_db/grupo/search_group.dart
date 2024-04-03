// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/produto_grupo.dart';
import 'package:lotus_erp_pdv_pos/repositories/components/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:lotus_erp_pdv_pos/repositories/components/header.dart';

class SearchGroup {
  final Logger _logger = Logger();

  Future<List<produto_grupo>> search(BuildContext context) async {
    Uri uri = Uri.parse(Endpoints().endpointSearchGroup());

    try {
      var response = await http.get(uri, headers: Header.header);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          List<produto_grupo> groups = [];
          for (var group in data['itens']) {
            groups.add(produto_grupo.fromMap(group));
          }
          return groups;
        } else {
          _logger.e('Erro ao buscar grupos. message: ${data['message']}');
          return [];
        }
      } else {
        _logger
            .e('Erro ao buscar grupos. statusCode: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar grupos. $e');
      return [];
    }
  }
}
