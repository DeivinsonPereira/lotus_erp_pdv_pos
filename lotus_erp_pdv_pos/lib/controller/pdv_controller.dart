import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/produto_grupo.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/grupo/get_group.dart';

import '../models/collections/produto.dart';
import '../repositories/isar_db/produto/get_product.dart';

class PdvController extends GetxController {
  Logger logger = Logger();

  var groups = [].obs;
  var products = [].obs;

  Future<void> setGroups() async {
    List<produto_grupo?> group = await GetGroup().getGroup();

    if (group.isNotEmpty) {
      groups.assignAll(group);
    } else {
      logger.e('Nenhum grupo encontrado');
    }
  }

  Future<void> setProducts() async {
    List<produto?> product = await GetProduct().getProduct();

    if (product.isNotEmpty) {
      products.assignAll(product);
    }else {
      logger.e('Nenhum grupo encontrado');
    }
  }
}
