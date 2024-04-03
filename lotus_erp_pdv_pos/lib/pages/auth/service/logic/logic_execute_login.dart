// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lotus_erp_pdv_pos/common/custom_cherry.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/usuario/get_usuario.dart';

import '../../../../models/collections/usuario.dart';
import '../../../../models/login_model.dart';
import '../../../../repositories/isar_db/usuario_logado/insert_usuario_logado.dart';
import '../../../../services/dependencies.dart';

class LogicExecuteLogin {
  var loginController = Dependencies.loginController();

  Future<bool> login(Login login, BuildContext context) async {
    var hashedPassword = loginController.createHashedPassword();

    List<usuario?> usuarios = await GetUsuario().getUsuario();
    if (usuarios.isEmpty) {
      return false;
    }

    var user = usuarios
        .where((element) =>
            element!.login == loginController.usernameController.text &&
            element.senha == hashedPassword)
        .toList();

    if (user.isNotEmpty) {
      InsertUsuarioLogado().insert(context, user[0]!);
      return true;
    } else {
      const CustomCherryError(message: 'Usuário ou senha inválidos!')
          .show(context);
      return false;
    }
  }
}
