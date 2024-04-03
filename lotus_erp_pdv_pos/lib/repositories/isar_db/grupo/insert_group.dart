import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/produto_grupo.dart';

import '../isar_service.dart';

class InsertGroup {
  final Logger _logger = Logger();
  final IsarService _isarService = IsarService();

  Future<void> insert(BuildContext context, List<produto_grupo> groups) async {
    final isar = await _isarService.db;

    try {
      var i = await isar.produto_grupos.count();

      if (i > 0) {
        await isar.writeTxn(() async => await isar.produto_grupos.clear());
      }

      await isar.writeTxn(() async => await isar.produto_grupos.putAll(groups));
    } catch (e) {
      _logger.e('Não foi possível inseririr os grupos no banco de dados. $e');
    }
  }
}
