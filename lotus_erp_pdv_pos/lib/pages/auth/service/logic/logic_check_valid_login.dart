import 'package:flutter/material.dart';

import '../../../../common/custom_cherry.dart';

abstract class LogicCheckValidLogin {

  static bool checkValidLogin(BuildContext context, String? login, String? password) {
    if(login != null && login.isNotEmpty && password != null && password.isNotEmpty){
      return true;
    } else{
      if(login == null || login.isEmpty){
        const CustomCherryError(message: 'Preencha o campo de login corretamente!').show(context);
      }else if( password == null || password.isEmpty) {
        const CustomCherryError(message: 'Preencha o campo de senha corretamente!').show(context);
      }else {
        const CustomCherryError(message: 'Preencha todos os campos corretamente!').show(context);
      }
      return false;
    }

  }
}