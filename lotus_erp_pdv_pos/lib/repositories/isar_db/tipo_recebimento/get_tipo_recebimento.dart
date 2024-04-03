import 'package:isar/isar.dart';
import 'package:logger/web.dart';
import 'package:lotus_erp_pdv_pos/models/collections/tipo_recebimento.dart';

import '../isar_service.dart';

class GetTipoRecebimento {
  final Logger _logger = Logger();
  final IsarService _isarService = IsarService();

  Future<List<tipo_recebimento?>> getTipoRecebimento() async {
    final isar = await _isarService.db;

    try {
      var result = await isar.tipo_recebimentos.where().findAll();

      if (result.isNotEmpty) {
        return result;
      } else {
        _logger.e('Falha ao buscar os tipos de recebimentos no banco de dados local. $result');
        return [];
      }
    } catch (e) {
      _logger.e('Falha ao buscar os tipos de recebimentos no banco de dados local. $e');
      return [];
    }
  }
}
