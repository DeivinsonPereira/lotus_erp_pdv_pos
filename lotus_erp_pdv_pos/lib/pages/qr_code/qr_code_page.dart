import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/custom_header_popup.dart';
import 'package:lotus_erp_pdv_pos/services/print_xml.dart/print_nfce_xml.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../common/constant/custom_colors.dart';
import '../../controller/payment_controller.dart';
import '../../services/dependencies.dart';

class QrCodePage extends StatelessWidget {
  final String qrCode;
  const QrCodePage({super.key, required this.qrCode});

  @override
  Widget build(BuildContext context) {
    var paymentController = Dependencies.paymentController();
    var billController = Dependencies.billController();
    return Dialog(
      child: GetBuilder<PaymentController>(builder: (_) {
        return Container(
          color: Colors.white,
          height: 500,
          width: 400,
          child: Column(children: [
            //header
            CustomHeaderPopup(text: 'QR Code NFC-e', permitClose: false),

            //QR Code
            Expanded(
              child: Center(
                child: _.qrCode.isEmpty
                    ? Container()
                    : QrImageView(
                        data: qrCode,
                        version: QrVersions.auto,
                        size: Get.size.width * 0.8,
                      ),
              ),
            ),
            // botões

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    color: _.xml.value != '' && _.xml.value.isNotEmpty
                        ? CustomColors.confirmButtonColor
                        : Colors.grey[300],
                    child: TextButton(
                      onPressed: () async {
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
                      },
                      child: Text(
                        _.xml.value != '' && _.xml.value.isNotEmpty
                            ? 'IMPRIMIR'
                            : 'AGUARDE',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    color: CustomColors.informationBox,
                    child: TextButton(
                      onPressed: () {
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
                      },
                      child: const Text(
                        'FECHAR ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Botões
          ]),
        );
      }),
    );
  }
}
