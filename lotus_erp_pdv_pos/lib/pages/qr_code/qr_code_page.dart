// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/custom_header_popup.dart';
import 'package:lotus_erp_pdv_pos/pages/qr_code/service/logic/logic_buttons.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../common/constant/custom_colors.dart';
import '../../controller/payment_controller.dart';

class QrCodePage extends StatelessWidget {
  final String qrCode;
  const QrCodePage({super.key, required this.qrCode});

  @override
  Widget build(BuildContext context) {

    // Constrói o botão para imprimir a nfce
    Widget _buildButtonPrintNfce(PaymentController _) {
      return Container(
        height: 60,
        color: _.xml.value != '' && _.xml.value.isNotEmpty
            ? CustomColors.confirmButtonColor
            : Colors.grey[300],
        child: TextButton(
          onPressed: () async => LogicButtons().printNfceXmlButton(_),
          child: Text(
            _.xml.value != '' && _.xml.value.isNotEmpty
                ? 'IMPRIMIR'
                : 'AGUARDE',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      );
    }

    // Constrói o botão para voltar
    Widget _buildButtonBack(PaymentController _) {
      return Container(
        height: 60,
        color: CustomColors.informationBox,
        child: TextButton(
          onPressed: () => LogicButtons().backButton(),
          child: const Text(
            'FECHAR ',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      );
    }

    // Constrói o botão para imprimir a nfce ou voltar
    Widget _buildButtonsPrintAndBack(PaymentController _) {
      return Row(
        children: [
          Expanded(
            child: _buildButtonPrintNfce(_),
          ),
          Expanded(
            child: _buildButtonBack(_),
          ),
        ],
      );
    }

    // Constrói o cabeçalho
    Widget _buildHeader() {
      return CustomHeaderPopup(text: 'QR Code NFC-e', permitClose: false);
    }

    // Retorna a imagem do QrCode
    Widget _buildQrCode(PaymentController _) {
      return Expanded(
        child: Center(
          child: _.qrCode.isEmpty
              ? Container()
              : QrImageView(
                  data: qrCode,
                  version: QrVersions.auto,
                  size: Get.size.width * 0.8,
                ),
        ),
      );
    }

    // Constrói o corpo da página
    Widget _buildBody(PaymentController _) {
      return Column(
        children: [
          _buildHeader(),
          _buildQrCode(_),
          _buildButtonsPrintAndBack(_),
        ],
      );
    }

    // Retorna o dialog
    return Dialog(
      child: GetBuilder<PaymentController>(
        builder: (_) {
          return Container(
            color: Colors.white,
            height: 500,
            width: 400,
            child: _buildBody(_),
          );
        },
      ),
    );
  }
}
