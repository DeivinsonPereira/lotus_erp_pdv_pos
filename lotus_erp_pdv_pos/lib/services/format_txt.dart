// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/services.dart';

//transforma os textos em minusculo
class LowerCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue txtOld, TextEditingValue txtNew) {
    return txtNew.copyWith(text: txtNew.text.toLowerCase());
  }
}

//transforma os textos em maiusculo
class UpperCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue txtOld, TextEditingValue txtNew) {
    return txtNew.copyWith(text: txtNew.text.toUpperCase());
  }
}

//limita o número de caracteres um texto pode ter
class LimitTxt {
  String limitarTexto(String txt, int maxLength) {
    String txtFormatted =
        txt.length <= maxLength ? txt : '${txt.substring(0, maxLength)}...';
    return txtFormatted;
  }
}

// Cria a mascara para licenca
class LicenceTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue txtOld, TextEditingValue txtNew) {
    String text = '';
    String value = txtNew.text.replaceAll('.', '');
    for (int i = 0; i < value.length; i++) {
      text += value[i];
      if (i == 3 || i == 8) {
        text += '.';
      }
      if (text.length > 14) {
        text = text.substring(0, 14);
      }
    }

    if (txtOld.text.length > txtNew.text.length &&
        (txtOld.text[txtNew.text.length] == '.')) {
      text = text.substring(0, text.length - 2);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

// Cria a mascara para CNPJ
class CnpjTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue txtOld, TextEditingValue txtNew) {
    String text = '';
    String value = txtNew.text.replaceAll(RegExp(r'[^0-9]'), '');
    for (int i = 0; i < value.length; i++) {
      text += value[i];
      if (i == 1 || i == 4) {
        text += '.';
      } else if (i == 7) {
        text += '/';
      } else if (i == 11) {
        text += '-';
      }

      if (text.length > 18) {
        text = text.substring(0, 18);
      }
    }

    if (txtOld.text.length > txtNew.text.length &&
        (txtOld.text[txtNew.text.length] == '.' ||
            txtOld.text[txtNew.text.length] == '/' ||
            txtOld.text[txtNew.text.length] == '-')) {
      text = text.substring(0, text.length - 2);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
