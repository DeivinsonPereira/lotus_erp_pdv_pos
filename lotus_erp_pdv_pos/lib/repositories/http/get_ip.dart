import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../controller/config_controller.dart';
import '../../models/ip_model.dart';
import '../../services/dependencies.dart';
import '../components/endpoints.dart';
import '../isar_db/isar_service.dart';

class GetIp {
  Logger logger = Logger();
  IsarService service = IsarService();

  Future<Ip> fetchIp() async {
    ConfigController configController = Dependencies.configController();

    Uri uri = Uri.parse(await Endpoints().endpointSearchImage(configController.contractController.text));
    try {
      dynamic response = await http.get(uri);

      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
        if (data['success'] == true) {
          logger.d('Ip retornado com sucesso: ${data['itens'][0]}');
          var ip = Ip.fromMap(data['itens'][0]);
          configController.addIpController(ip.ip!);
          return ip;
        } else {
          logger.d('Ip não encontrado');
          return Ip.fromMap({});
        }
      } else {
        logger.e('Erro ao buscar Ip: ${response.statusCode}');
        return Ip.fromMap({});
      }
    } catch (e) {
      logger.e('Falha ao buscar Ip: $e');
      return Ip.fromMap({});
    }
  }
}
