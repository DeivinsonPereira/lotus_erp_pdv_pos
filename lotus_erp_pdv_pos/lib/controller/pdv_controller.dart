import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/image_path_group.dart';
import 'package:lotus_erp_pdv_pos/models/collections/image_path_product.dart';
import 'package:lotus_erp_pdv_pos/models/collections/produto_grupo.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/grupo/get_group.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/image_path_group/get_path_group.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/image_path_product/get_path_product.dart';

import '../models/collections/produto.dart';
import '../repositories/isar_db/produto/get_product.dart';

class PdvController extends GetxController {
  Logger logger = Logger();

  var groupSelected = 0.obs;

  List<produto_grupo?> groups = [];
  List<String> groupsDescription = [];
  List<image_path_group> pathImageGroup = [];

  List<produto?> products = [];
  List<produto?> favoriteProducts = [];
  List<image_path_product> pathImageProducts = [];
  var productsFiltered = [].obs;
  var pathImageProductsFiltered = [].obs;

  // atualiza o grupo selecionado
  void updateGroupSelected(int value) {
    groupSelected.value = value;
    update();
  }

  // adiciona os grupos na variável groups
  Future<void> setGroups() async {
    List<produto_grupo?> group = await GetGroup().getGroup();

    if (group.isNotEmpty) {
      groups.assignAll(group);
    } else {
      logger.e('Nenhum grupo encontrado');
    }
  }

  // adiciona a descrição dos grupos no GroupsDescription
  void addGroupDescription() {
    groupsDescription.clear();
    groupsDescription.add('FAVORITOS');
    if (groups.isNotEmpty) {
      groupsDescription.addAll(groups.map((e) => e!.grupo_descricao!));
    }
  }

  // adiciona os produtos na variável products
  Future<void> setProducts() async {
    List<produto?> product = await GetProduct().getProduct();

    if (product.isNotEmpty) {
      products.assignAll(product);
    } else {
      logger.e('Nenhum grupo encontrado');
    }
  }

  // busca as imagens do grupo
  Future<void> setPathImageGroup() async {
    List<image_path_group> group = await GetPathGroup().getPathGroup();
    if (group.isNotEmpty) {
      pathImageGroup.assignAll(group);
    } else {
      logger.e('Nenhum grupo encontrado');
    }
  }

  // busca as imagens dos produtos
  Future<void> setPathImageProducts() async {
    List<image_path_product> product = await GetPathProduct().getPathProduct();
    if (product.isNotEmpty) {
      pathImageProducts.assignAll(product);
    } else {
      logger.e('Nenhum grupo encontrado');
    }
  }

  // atualiza a variavel idgroup
  int updateIdGroup() {
    if (groupSelected.value != 0) {
      var description = groupsDescription[groupSelected.value];
      var group = groups.firstWhere(
          (element) => element!.grupo_descricao == description,
          orElse: () => null);
      if (group != null) {
        return group.id_grupo;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }

  // filtra os produtos de acordo com o id do grupo selecionado
  Future<void> filterProducts() async {
    var id = updateIdGroup();

    if (products.isNotEmpty) {
      if (groupSelected.value == 0) {
        productsFiltered.assignAll(
            products.where((element) => element!.favorito == 1).toList());
      } else {
        productsFiltered.assignAll(
            products.where((element) => element!.id_grupo == id).toList());
      }
    } else {
      logger.e('Nenhum grupo encontrado');
    }
    update();
  }

  // filtra os paths das imagens dos produtos de acordo com o id do grupo selecionado
  Future<void> filterPathImageProducts() async {
    var id = updateIdGroup();

    if (pathImageProducts.isNotEmpty) {
      if (groupSelected.value == 0) {
        pathImageProductsFiltered.assignAll(
            pathImageProducts.where((element) => element.favorite == 1));
      } else {
        pathImageProductsFiltered.assignAll(
            pathImageProducts.where((element) => element.id_grupo == id));
      }
    }
    update();
  }
}
