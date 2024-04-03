import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/dado_empresa.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';


class GetDadoEmpresa {
  final Logger _logger;
  final IsarService _isarService;
  
  GetDadoEmpresa(this._logger, this._isarService);

  Future<dado_empresa?> getDadoEmpresa() async {
    final isar = await _isarService.db;

    try {
      var result = await isar.dado_empresas.get(1);
      if (result != null && result.ip_empresa!.isNotEmpty) {
        _logger.d('Ip retornado com sucesso: $result');
        return result;
      } else {
        _logger.e('Falha ao buscar o ip no banco de dados local. $result');
        return null;
      }
    } catch (e) {
      _logger.e('Falha ao buscar o ip no banco de dados local. $e');
      return null;
    }
  }
}
