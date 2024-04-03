import 'dart:io';

import 'package:flutter/material.dart';

import '../services/dependencies.dart';

class CustomImageLogo {
  var configController = Dependencies.configController();

  Widget getLogoPadrao({double? width, double? height}) {
    if (configController.imageLogoPadrao.isEmpty) {
      return Image.asset(
        'assets/images/Logo_Nova_Transparente.png',
        width: width,
        height: height,
      );
    } else {
      return Image.file(
        File(configController.imageLogoPadrao),
        width: width,
        height: height,
      );
    }
  }

  Widget getLogoBranca({double? width, double? height}) {
    if (configController.imageLogoBranca.isEmpty) {
      return Image.asset(
        'assets/images/Logo Nova Branco Vertical.png',
        width: width,
        height: height,
      );
    } else {
      return Image.file(
        File(configController.imageLogoBranca),
        width: width,
        height: height,
      );
    }
  }
}
