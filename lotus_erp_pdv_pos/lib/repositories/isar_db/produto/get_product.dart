import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/produto.dart';

import '../isar_service.dart';

class GetProduct {
  
  final Logger _logger = Logger();
  final IsarService _isarService = IsarService();

  Future<List<produto?>> getProduct() async {
    final isar = await _isarService.db;

    try {
      var result = await isar.produtos.where().findAll();

      if (result.isNotEmpty) {
        return result;
      } else {
        _logger.e('Falha ao buscar os produtos no banco de dados local. $result');
        return [];
      }
    } catch (e) {
      _logger.e('Falha ao buscar os produtos no banco de dados local. $e');
      return [];
    }
  }
}