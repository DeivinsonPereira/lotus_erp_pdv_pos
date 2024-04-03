import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../models/collections/usuario.dart';
import '../isar_service.dart';

class InsertUsuario {
  final Logger _logger = Logger();
  final IsarService _isarService = IsarService();

  Future<void> insert(BuildContext context, List<usuario> users) async {
    final isar = await _isarService.db;

    try {
      var i = await isar.usuarios.count();

      if (i > 0) {
        await isar.writeTxn(() async => await isar.usuarios.clear());
      }

      await isar.writeTxn(() async => await isar.usuarios.putAll(users));
    } catch (e) {
      _logger.e('Não foi possível inseririr os usuários no banco de dados. $e');
    }
  }
}
