import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isObscure = true.obs;

  var passwordHashed = ''.obs;
  var username = ''.obs;

  // Troca a visibilidade da senha
  void toggleObscure() {
    isObscure.value = !isObscure.value;
    update();
  }

  String createHashedPassword() {
    var bytes = utf8.encode(passwordController.text);
    var hashedPassword = md5.convert(bytes);

    var passwordformatted =
        passwordHashed.value = hashedPassword.toString().toUpperCase();
    return passwordformatted;
  }

  // limpa o campo usernameController
  void clearUsername() {
    usernameController.clear();
  }

  // limpa o campo passwordController
  void clearPassword() {
    passwordController.clear();
  }

  // limpa todos os campos
  void clearAll() {
    clearUsername();
    clearPassword();
  }
}
