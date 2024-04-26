// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/produto.dart';
import 'package:http/http.dart' as http;

import '../../components/endpoints.dart';
import '../../components/header.dart';
class SearchProduct {
  final Logger _logger = Logger();


  Future<List<produto>> search(BuildContext context) async {
    Uri uri = Uri.parse(Endpoints().endpointProdutos());

    try {
      var response = await http.get(uri, headers: Header.getBasicHeader());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          List<produto> products = [];
          for (var product in data['itens']) {
            products.add(produto.fromMap(product));
          }
          return products;
        } else {
          _logger.e('Erro ao buscar produtos. message: ${data['message']}');
          return [];
        }
      } else {
        _logger
            .e('Erro ao buscar produtos. statusCode: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar produtos. $e');
      return [];
    }
  }
}
