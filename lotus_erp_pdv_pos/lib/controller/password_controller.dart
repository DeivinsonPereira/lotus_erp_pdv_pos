import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/dependencies.dart';

class PasswordController extends GetxController {
  final passwordController = TextEditingController();
  final userController = TextEditingController();
  var empresaValidaController = Dependencies.empresaValidaController();
  var user = ''.obs;

  final BuildContext context;

  PasswordController(this.context);

  @override
  void onInit() async {
    super.onInit();
    await empresaValidaController.loadContrato(context);
  }

  void clear() {
    userController.clear();
    passwordController.clear();
  }

  void updateUsername(String value) => user.value = value;
}
