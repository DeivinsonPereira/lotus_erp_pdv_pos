import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/usuario_logado.dart';

import '../../../models/collections/usuario.dart';
import '../isar_service.dart';

class InsertUsuarioLogado {
  final Logger _logger = Logger();
  final IsarService _isarService = IsarService();

  Future<void> insert(BuildContext context, usuario user) async {
    final isar = await _isarService.db;

    usuario_logado userLogged = usuario_logado(
        id_user: user.id,
        login: user.login,
        id_colaborador: user.id_colaborador);

    try {
      await isar
          .writeTxn(() async => await isar.usuario_logados.put(userLogged));
    } catch (e) {
      _logger.e('Não foi possível inseririr os usuários no banco de dados. $e');
    }
  }
}
