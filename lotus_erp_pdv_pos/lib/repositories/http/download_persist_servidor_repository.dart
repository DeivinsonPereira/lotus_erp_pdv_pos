import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../services/dependencies.dart';
import '../components/endpoints.dart';
import '../components/header.dart';

class DownloadImagesRepository {
  Logger logger = Logger();
  var pdvController = Dependencies.pdvController();

  Future<void> downloadImageGroups() async {
    try {
      var grupos = pdvController.groups;
      Directory dir = await getApplicationDocumentsDirectory();
      await deleteExistingFiles('${dir.path}/assets/grupos/');
      if (grupos.isEmpty) {
        return;
      }
      for (var grupo in grupos) {
        // BAIXAR A IMAGEM
        String? fileImage = grupo!.file_imagem;
        if (fileImage != null || fileImage != '') {
          String url = Endpoints().endpointSearchImageGroup(fileImage!);

          var response = await http.get(
              Uri.parse(
                url,
              ),
              headers: Header.header);

          if (response.statusCode == 200) {
            try {
              var jsonResponse = jsonDecode(response.body);

              if (jsonResponse['success'] == false ||
                  jsonResponse['success'] == null) {
                logger.e('Erro ao baixar imagem ${jsonResponse['message']}');
                continue;
              }
            } catch (e) {
              String pathName = '${dir.path}/assets/grupos/$fileImage';

              await Directory('${dir.path}/assets/grupos')
                  .create(recursive: true);
              File file = File(pathName);
              var result = await file.writeAsBytes(response.bodyBytes);

              logger.d('Imagem baixada com sucesso $result');
            }
          } else {
            logger.e('Erro ao baixar imagem ${response.statusCode}');
          }
        } else {
          logger.e('Erro ao baixar imagem${grupo.file_imagem}');
        }
      }
    } catch (e) {
      logger.e('Erro ao baixar imagem: $e');
    }
  }

  Future<void> downloadImageProducts() async {
    try {
      // OBTER OS PRODUTOS
      var produtos = pdvController.products;
      Directory dir = await getApplicationDocumentsDirectory();
      await deleteExistingFiles('${dir.path}/assets/produtos/');
      if (produtos.isEmpty) {
        return;
      }
      for (var produto in produtos) {
        // BAIXAR A IMAGEM
        String? fileImage = produto!.file_imagem;
        if (fileImage != null || fileImage != '') {
          String url = Endpoints().endpointSearchImageProduct(fileImage!);

          var response = await http.get(
              Uri.parse(
                url,
              ),
              headers: Header.header);

          if (response.statusCode == 200) {
            try {
              var jsonResponse = jsonDecode(response.body);

              if (jsonResponse['success'] == false ||
                  jsonResponse['success'] == null) {
                logger.e('Erro ao baixar imagem ${jsonResponse['message']}');
                continue;
              }
            } catch (e) {
              Directory dir = await getApplicationDocumentsDirectory();
              String pathName = '${dir.path}/assets/produtos/$fileImage';
              await Directory('${dir.path}/assets/produtos')
                  .create(recursive: true);
              File file = File(pathName);
              var result = await file.writeAsBytes(response.bodyBytes);

              logger.d('Imagem baixada com sucesso $result');
            }
          } else {
            logger.e('Erro ao baixar imagem ${response.statusCode}');
          }
        } else {
          logger.e('Erro ao baixar imagem:  $fileImage');
        }
      }
    } catch (e) {
      logger.e('Erro ao baixar imagem: $e');
    }
  }

  Future<void> downloadImageLogo() async {
    Logger logger = Logger();

    try {
      Directory dir = await getApplicationDocumentsDirectory();
      await deleteExistingFiles('${dir.path}/assets/logos/');

      String urlLogoPadrao =
          Endpoints().endpointSearchImageDIV('PDV_Logo_Padrao.png');
      try {
        var response = await http.get(
            Uri.parse(
              urlLogoPadrao,
            ),
            headers: Header.header);
        if (response.statusCode == 200) {
          try {
            var jsonResponse = jsonDecode(response.body);

            if (jsonResponse['success'] == false ||
                jsonResponse['success'] == null) {}
          } catch (e) {
            String pathName =
                '${dir.path}/assets/logos/${('PDV_Logo_Padrao.png')}';

            await Directory('${dir.path}/assets/logos').create(recursive: true);
            File file = File(pathName);
            var result = await file.writeAsBytes(response.bodyBytes);

            logger.d('Imagem baixada com sucesso $result');
          }
        } else {
          logger.e('Erro ao baixar imagem');
        }
      } catch (e) {
        logger.e('Erro ao baixar imagem: $e');
      }

      String urlLogoBranca =
          Endpoints().endpointSearchImageDIV('PDV_Logo_Branca.png');
      try {
        var response = await http.get(
            Uri.parse(
              urlLogoBranca,
            ),
            headers: Header.header);
        if (response.statusCode == 200) {
          try {
            var jsonResponse = jsonDecode(response.body);

            if (jsonResponse['success'] == false ||
                jsonResponse['success'] == null) {}
          } catch (e) {
            String pathName =
                '${dir.path}/assets/logos/${('PDV_Logo_Branca.png')}';

            await Directory('${dir.path}/assets/logos').create(recursive: true);
            File file = File(pathName);
            var result = await file.writeAsBytes(response.bodyBytes);

            logger.d('Imagem baixada com sucesso $result');
          }
        } else {
          logger.e('Erro ao baixar imagem');
        }
      } catch (e) {
        logger.e('Erro ao baixar imagem da Logo: $e');
      }
    } catch (e) {
      logger.e('Erro ao baixar imagem da Logo: $e');
    }
  }

  Future<void> deleteExistingFiles(String folderPath) async {
    final directory = Directory(folderPath);
    if (await directory.exists()) {
      // List all files and subdirectories in the directory
      final entities = directory.listSync();

      for (final entity in entities) {
        if (entity is File) {
          // Delete the file
          await entity.delete();
          if (kDebugMode) {
            print('Arquivo excluído: ${entity.path}');
          }
        } else if (entity is Directory) {
          // Recursively delete subdirectories
          await deleteExistingFiles(entity.path);
        }
      }
    } else {
      if (kDebugMode) {
        print('A pasta não existe: $folderPath');
      }
    }
  }
}
