/*import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/usuario.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

class GetUsuario {
  final Logger _logger = Logger();
  final IsarService _isarService = IsarService();

  Future<List<usuario?>> getUsuario() async {
    final isar = await _isarService.db;

    try {
      var result = await isar.usuarios.where().findAll();

      if (result.isNotEmpty) {
        return result;
      } else {
        _logger.e('Falha ao buscar os usuários no banco de dados local. $result');
        return [];
      }
    } catch (e) {
      _logger.e('Falha ao buscar os usuários no banco de dados local. $e');
      return [];
    }
  }
}
*/