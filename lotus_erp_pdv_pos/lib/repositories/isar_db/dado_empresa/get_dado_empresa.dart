import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/dado_empresa.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

class GetDadoEmpresa {
  final Logger _logger = Logger();
  final IsarService _isarService = IsarService();

  Future<dado_empresa?> getDadoEmpresa() async {
    final isar = await _isarService.db;

    try {
      var result = await isar.dado_empresas.get(1);
      if (result != null) {
        return result;
      } else {
        _logger.e('Falha ao buscar os dados no banco de dados local. $result');
        return null;
      }
    } catch (e) {
      _logger.e('Falha ao buscar os dados no banco de dados local. $e');
      return null;
    }
  }
}
