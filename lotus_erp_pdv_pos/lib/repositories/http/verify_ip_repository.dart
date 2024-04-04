import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/services/dependencies.dart';

import '../components/header.dart';
import 'package:http/http.dart' as http;

class VerifyIp {
  var configController = Dependencies.configController();
  Logger logger = Logger();

  Future<bool> verify() async {
    if (configController.contractController.text.isNotEmpty) {
      var uri = Uri.parse(configController.contractController.text);
      try {
        var response = await http.get(uri, headers: Header.header);

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['success'] == true) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } catch (e) {
        logger.e('Erro ao buscar Ip: $e');
        return false;
      }
    } else {
      return false;
    }
  }
}
