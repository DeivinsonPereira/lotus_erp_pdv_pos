import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../components/endpoints.dart';
import '../components/header.dart';

class DownloadPersistServidorRepository {
  

  Future<void> downloadImageLogo() async {
  Logger logger = Logger();

  try {
    Directory dir = await getApplicationDocumentsDirectory();
    await deleteExistingFiles('${dir.path}/assets/logos/');

    String urlLogoPadrao =
        await Endpoints().endpointSearchImageDIV('PDV_Logo_Padrao.png');
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
        await Endpoints().endpointSearchImageDIV('PDV_Logo_Branca.png');
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