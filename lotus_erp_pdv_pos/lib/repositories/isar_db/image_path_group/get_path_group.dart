import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

import '../../../models/collections/image_path_group.dart';

class GetPathGroup {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  Future<List<image_path_group>> getPathGroup() async {
    final isar = await _isarService.db;

    try {
      var result = await isar.image_path_groups.where().findAll();
      if (result.isNotEmpty) {
        return result;
      } else {
        _logger.e(
            'Falha ao buscar as imagens dos produtos no banco de dados local. $result');
        return [];
      }
    } catch (e) {
      _logger.e(
          'Falha ao buscar as imagens dos produtos no banco de dados local. $e');
      return [];
    }
  }
}
