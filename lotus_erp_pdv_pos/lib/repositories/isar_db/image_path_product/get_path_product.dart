import 'package:isar/isar.dart';
import 'package:logger/web.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

import '../../../models/collections/image_path_product.dart';

class GetPathProduct {
  final IsarService service = IsarService();
  final Logger _logger = Logger();

  Future<List<image_path_product>> getPathProduct() async {
    final isar = await service.db;

    try {
      var result = await isar.image_path_products.where().findAll();

      if (result.isNotEmpty) {
        return result;
      } else {
        _logger.e('Falha ao buscar as imagens do grupo no banco de dados local. $result');
        return [];
      } 
    }catch (e) {
        _logger.e('Falha ao buscar as imagens do grupo no banco de dados local. $e');
        return [];
      }
  }
}
