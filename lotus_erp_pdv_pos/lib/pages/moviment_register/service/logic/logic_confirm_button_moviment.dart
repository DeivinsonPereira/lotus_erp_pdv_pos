import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotus_erp_pdv_pos/pages/loading/loading_page.dart';

import '../../../../repositories/http/moviment_register_to_server.dart';
import '../../../../repositories/isar_db/caixa_item/insert_caixa_item.dart';
import '../../../../services/back_operations.dart';
import '../../../../services/dependencies.dart';

class LogicConfirmButtonMoviment {
  var openRegisterController = Dependencies.openRegisterController();

  void confirm(BuildContext context) async {
    Get.dialog(const LoadingPage());

    var result = await MovimentRegisterToServer().send(context);

    await InsertCaixaItem().insert(result);
    Future.delayed(const Duration(milliseconds: 100), () {
      openRegisterController.clearAllMoviment();
      BackOperations().executeBackOperations(2);
    });
  }
}
