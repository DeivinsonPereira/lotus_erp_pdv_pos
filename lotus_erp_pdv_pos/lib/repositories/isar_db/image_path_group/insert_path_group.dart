import 'dart:io';

import 'package:isar/isar.dart';
import 'package:logger/web.dart';
import 'package:lotus_erp_pdv_pos/models/collections/image_path_group.dart';
import 'package:lotus_erp_pdv_pos/services/dependencies.dart';
import 'package:path_provider/path_provider.dart';

import '../isar_service.dart';

class InsertPathGroup {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();
  var pdvController = Dependencies.pdvController();
  //Salvar imagens dos grupos
  Future<Isar> saveImagemGrupos() async {
    final isar = await _isarService.db;

    int i = await isar.image_path_groups.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.image_path_groups.clear();
        },
      );
    }
    try {
      isar.writeTxn(() async {
        // OBTER OS GRUPOS
        var grupos = pdvController.groups;

        Directory dir = await getApplicationDocumentsDirectory();
        String pathNameGrupos = '${dir.path}/assets/grupos/';
        Directory directoryGrupos = Directory(pathNameGrupos);
        List<String> files = [];
        List<FileSystemEntity> filesPath = [];

        if (await directoryGrupos.exists()) {
          filesPath = directoryGrupos.listSync();
          for (var i = 0; i < filesPath.length; i++) {
            files.add(filesPath[i].path.split('/').last);
          }
        }

        List<image_path_group> images = [];

        var gruposSelected = grupos
            .where((element) => files.contains(element!.file_imagem))
            .toList();

        List<String> saveFile = [];

        for (var i = 0; i < gruposSelected.length; i++) {
          saveFile.add(gruposSelected[i]!.file_imagem!);
        }

        //SALVA IMAGENS NO BANCO DE DADOS
        for (var i = 0; i < saveFile.length; i++) {
          image_path_group image = image_path_group()
            ..file_image = gruposSelected[i]!.file_imagem
            ..nome_grupo = gruposSelected[i]!.grupo_descricao
            ..path_image = filesPath[i].path;

          images.add(image);
          // saveImagePathController.addImagePathSimple(pathName);
        }
        await isar.image_path_groups.putAll(images);
      });
    } catch (e) {
      _logger.e('Erro ao salvar imagem dos grupos: $e');
    }
    return isar;
  }
}
