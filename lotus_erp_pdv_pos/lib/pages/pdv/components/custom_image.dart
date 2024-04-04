import 'dart:io';

import 'package:flutter/material.dart';

class CustomImage {
  Widget semImagem = ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        'assets/images/semimagem.png',
        width: 60.0,
        height: 60.0,
        fit: BoxFit.cover,
      ));

  Widget getImageGroup(String file) {
    if (file.startsWith('assets/images/')) {
      return Image.asset('assets/images/favorito.png',
          width: 60.0, height: 60.0, fit: BoxFit.cover);
    }
    if (file.isEmpty) {
      return semImagem;
    } else {
      return ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.file(File(file), width: 60.0, height: 60.0));
    }
  }

  Widget getImageProduct(String file) {
    if (file.isEmpty) {
      return semImagem;
    } else {
      return ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.file(File(file), width: 60.0, height: 60.0));
    }
  }
}
