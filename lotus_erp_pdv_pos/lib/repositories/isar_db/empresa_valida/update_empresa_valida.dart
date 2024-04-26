import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/empresa_valida.dart';

import '../isar_service.dart';

class UpdateEmpresaValida {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  // deleta a data da tabela empresa_valida
  Future<void> updateDadoTabelaContrato() async {
    final isar = await _isarService.db;

    try {
      isar.writeTxn(() async {
        var empresa = await isar.empresa_validas.where().findFirst();
        if (empresa != null) {
          await isar.empresa_validas.put(empresa);
        }
      });

    } catch (e) {
      _logger.e("Erro ao alterar dados do contrato: $e");
    }
  }
}
