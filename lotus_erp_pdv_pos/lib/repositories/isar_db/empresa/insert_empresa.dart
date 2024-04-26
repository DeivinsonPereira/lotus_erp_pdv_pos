import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';
import '../../../models/collections/empresa.dart';

class InsertEmpresa {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<void> insert(empresa empresa) async {
    final isar = await _isarService.db;

    final i = await isar.empresas.count();

    try {
      if (i > 0) {
        isar.writeTxn(() async {
          await isar.empresas.clear();
        });
      }

      isar.writeTxn(() async {
        await isar.empresas.put(empresa);
      });
    } catch (e) {
      _logger.e('erro ao inserir dados da empresa: $e');
    }
  }
}
