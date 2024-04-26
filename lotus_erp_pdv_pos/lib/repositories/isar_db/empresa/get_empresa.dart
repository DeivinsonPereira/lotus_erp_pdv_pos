import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

import '../../../models/collections/empresa.dart';
import '../../../services/dependencies.dart';
import '../isar_service.dart';

class GetEmpresa {
  var configController = Dependencies.configController();
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<empresa?> get() async {
    final isar = await _isarService.db;

    try {
      empresa? empresaSelected = await isar.empresas.where().findFirst();

      if (empresaSelected != null) {
        configController.setEmpresa(empresaSelected);
        return empresaSelected;
      } else {
        _logger.e("Erro ao buscar dados da empresa: $empresaSelected");
        return null;
      }
    } catch (e) {
      _logger.e("Erro ao buscar dados da empresa: $e");
      return null;
    }
  }
}
