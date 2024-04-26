import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:lotus_erp_pdv_pos/models/collections/empresa.dart';

import '../../../services/dependencies.dart';
import '../../components/endpoints.dart';
import '../../components/header.dart';
import 'insert_empresa.dart';

class SearchEmpresa {
  final Logger _logger = Logger();
  var empresaValidaController = Dependencies.empresaValidaController();

  Future<empresa?> searchEmpresa() async {
    Uri uri = Uri.parse(Endpoints().endpointEmpresa());

    try {
      var bodyRequest = {"cnpj": empresaValidaController.cnpj};

      var response = await http.post(
        uri,
        headers: Header.getBasicHeader(),
        body: jsonEncode(bodyRequest),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          var item = data['itens'][0];
          var dadoEmpresa = empresa.fromMap(item);
          await InsertEmpresa().insert(dadoEmpresa);
          return dadoEmpresa;
        } else {
          _logger.e('Erro ao buscar dados da empresa: ${data['message']}');
          return null;
        }
      } else {
        _logger.e('Erro ao buscar dados da empresa: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      _logger.e('Erro ao buscar dados da empresa: $e');
      return null;
    }
  }
}
