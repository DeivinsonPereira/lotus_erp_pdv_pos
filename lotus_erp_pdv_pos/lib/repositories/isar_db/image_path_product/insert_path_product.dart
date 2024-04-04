import 'dart:io';

import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/image_path_product.dart';
import 'package:lotus_erp_pdv_pos/services/dependencies.dart';
import 'package:path_provider/path_provider.dart';

import '../isar_service.dart';

class InsertPathProduct {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();
  var pdvController = Dependencies.pdvController();

  //salva as imagens dos produtos no diretório do aplicativo
  Future<Isar> saveImagemProdutos() async {
    final isar = await _isarService.db;

    int i = await isar.image_path_products.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.image_path_products.clear();
        },
      );
    }
    try {
      isar.writeTxn(() async {
        // OBTER OS PRODUTOS
        var produtos = pdvController.products;

        Directory dir = await getApplicationDocumentsDirectory();
        String pathNameProducts = '${dir.path}/assets/produtos/';
        Directory directoryProducts = Directory(pathNameProducts);
        List<String> files = [];
        List<FileSystemEntity> filesPath = [];

        if (await directoryProducts.exists()) {
          filesPath = directoryProducts.listSync();
          for (var i = 0; i < filesPath.length; i++) {
            files.add(filesPath[i].path.split('/').last);
          }
        }

        List<image_path_product> images = [];

        var produtosSelected = produtos
            .where((element) => files.contains(element!.file_imagem))
            .toList();

        List<String> saveFile = [];

        for (var i = 0; i < produtosSelected.length; i++) {
          saveFile.add(produtosSelected[i]!.file_imagem!);
        }

        for (var i = 0; i < saveFile.length; i++) {
          // BAIXAR A IMAGEM
          image_path_product image = image_path_product()
            ..id_grupo = produtosSelected[i]!.id_grupo
            ..id_produto = produtosSelected[i]!.id_produto
            ..favorite = produtosSelected[i]!.favorito
            ..descricao = produtosSelected[i]!.descricao
            ..gtin = produtosSelected[i]!.gtin
            ..file_image = produtosSelected[i]!.file_imagem
            ..path_image = filesPath[i].path;

          images.add(image);
        }
        // saveImagePathController.addImagePathSimple(pathName);
        await isar.image_path_products.putAll(images);
      });
    } catch (e) {
      _logger.e('Erro ao salvar imagem dos grupos: $e');
    }
    return isar;
  }
}
