// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:lotus_erp_pdv_pos/models/collections/tipo_recebimento.dart';

import '../../components/endpoints.dart';
import '../../components/header.dart';

class SearchPaymentType {
  final Logger _logger = Logger();

  Future<List<tipo_recebimento>> search(BuildContext context) async {
    Uri uri = Uri.parse(Endpoints().endpointSearchTypePayment());

    try {
      var response = await http.get(uri, headers: Header.header);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          List<tipo_recebimento> paymentType = [];
          for (var receb in data['itens']) {
            paymentType.add(tipo_recebimento.fromMap(receb));
          }
          
          return paymentType;
        } else {
          _logger.e('Erro ao buscar os tipos de pagamento. message: ${data['message']}');
          return [];
        }
      } else {
        _logger.e('Erro ao buscar os tipos de pagamento. statusCode: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      _logger.e('Erro ao buscar os tipos de pagamento. $e');
      return [];
    }
  }
}
