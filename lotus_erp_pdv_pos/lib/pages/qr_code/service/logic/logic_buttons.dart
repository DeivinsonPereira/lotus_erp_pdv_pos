import 'package:get/get.dart';

import '../../../../controller/payment_controller.dart';
import '../../../../services/dependencies.dart';
import '../../../../services/print_xml.dart/print_nfce_xml.dart';

class LogicButtons {
  var billController = Dependencies.billController();
  var paymentController = Dependencies.paymentController();

  // Executa a lógica do botão de imprimir nfce
  void printNfceXmlButton(PaymentController _) {
    if (_.xml.value != '' && _.xml.value.isNotEmpty) {
      for (var i = 0; i < 3; i++) {
        PrintNfceXml().printNfceXml(xmlArgs: _.xml.value);
        Get.back();
        billController.cartShopping.clear();
        billController.productsInCart.clear();
        billController.productsWeight.clear();
        billController.total.value = 0;
        paymentController.xml.value = '';
        paymentController.qrCode.value = '';
        paymentController.idVenda.value = 0;
      }
    }
  }

  void backButton() {
    billController.cartShopping.clear();
    billController.productsInCart.clear();
    billController.productsWeight.clear();
    billController.total.value = 0;
    paymentController.xml.value = '';
    paymentController.qrCode.value = '';
    paymentController.idVenda.value = 0;

    for (var i = 0; i < 3; i++) {
      Get.back();
    }
  }
}
