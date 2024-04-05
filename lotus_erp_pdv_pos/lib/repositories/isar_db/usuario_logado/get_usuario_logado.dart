import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

import '../../../models/collections/usuario_logado.dart';

class GetUsuarioLogado {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<usuario_logado?> getUsuarioLogado() async {
    final isar = await _isarService.db;

    try {
      var result = await isar
          .usuario_logados
          .where()
          .findFirst();
      if (result != null) {
        return result;
      } else {
        _logger.e('Falha ao buscar os usuários no banco de dados local. $result');
        return null;
      }
    } catch (e) {
      _logger.e('Falha ao buscar os usuários no banco de dados local. $e');
      return null;
    }

  }
}
