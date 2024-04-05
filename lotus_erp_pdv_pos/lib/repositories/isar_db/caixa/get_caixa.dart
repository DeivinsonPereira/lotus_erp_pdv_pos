import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

import '../../../models/collections/caixa.dart';

class GetCaixa {

  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<caixa?> getOpenCaixa() async {
    final isar = await _isarService.db;

    try {
      
      var result = await isar.caixas.filter().statusEqualTo(0).findFirst();
      
      if (result != null ) {
        return result;
      } else {
        _logger.e('Falha ao buscar o caixa aberto no banco de dados local. $result');
        return null;
      }
      
    } catch (e) {
      _logger.e('Falha ao buscar o caixa aberto no banco de dados local. $e');
      return null;
    }
  }
}