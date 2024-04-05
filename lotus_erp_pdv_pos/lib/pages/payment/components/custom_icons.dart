import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/collections/tipo_recebimento.dart';

class CustomIcons {
  var color = Colors.black;
  Widget buildIcon(tipo_recebimento paymentSelected, double iconSize) {
    if (paymentSelected.descricao!.contains(('Dinheiro').toUpperCase())) {
      return Icon(FontAwesomeIcons.moneyBill1Wave,
          size: iconSize, color: color);
    } else if (paymentSelected.descricao!.contains(('credito').toUpperCase())) {
      return Icon(FontAwesomeIcons.solidCreditCard,
          size: iconSize, color: color);
    } else if (paymentSelected.descricao!.contains(('debito').toUpperCase())) {
      return Icon(FontAwesomeIcons.creditCard, size: iconSize, color: color);
    } else if (paymentSelected.descricao!.contains(('voucher').toUpperCase())) {
      return Icon(FontAwesomeIcons.addressCard, size: iconSize, color: color);
    } else if (paymentSelected.descricao!.contains(('pix').toUpperCase())) {
      return Icon(FontAwesomeIcons.pix, size: iconSize, color: color);
    } else if (paymentSelected.descricao!.contains(('ticket').toUpperCase())) {
      return Icon(FontAwesomeIcons.ticket, size: iconSize, color: color);
    }
    return Icon(Icons.attach_money, size: iconSize, color: color);
  }
}
