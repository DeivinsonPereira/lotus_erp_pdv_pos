import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../models/collections/empresa_valida.dart';
import '../isar_service.dart';

class InsertEmpresaValida {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  // insere os dados o contrato e data limite na tabela
  Future<void> insertEmpresaValida(
      empresa_valida valida, BuildContext context) async {
    final isar = await _isarService.db;

    var i = await isar.empresa_validas.count();

    try {
      if (i >= 0) {
        isar.writeTxn(
          () async {
            await isar.empresa_validas.clear();
          },
        );
      }

      await isar.writeTxn(() async {
        await isar.empresa_validas.put(valida);
      });
    } catch (e) {
      _logger.e("Erro ao inserir dados do contrato: $e");
    }
  }
}
