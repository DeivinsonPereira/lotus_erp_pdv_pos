// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';
import 'package:lotus_erp_pdv_pos/common/custom_elevated_button.dart';
import 'package:lotus_erp_pdv_pos/common/custom_header.dart';
import 'package:lotus_erp_pdv_pos/models/collections/tipo_recebimento.dart';
import 'package:lotus_erp_pdv_pos/pages/qr_code/qr_code_page.dart';

import '../../repositories/http/post_nfce.dart';
import '../../services/dependencies.dart';
import 'components/custom_icons.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentController = Dependencies.paymentController();

    // Constrói o conteúdo do card
    Widget _buildCardContent(tipo_recebimento paymentSelected) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: Get.size.height * 0.08,
              child: CustomIcons()
                  .buildIcon(paymentSelected, Get.size.height * 0.08)),
          SizedBox(
            height: Get.size.height * 0.01,
          ),
          SizedBox(
            height: Get.size.height * 0.08,
            child: Text(
              paymentSelected.descricao!,
              style: CustomTextStyles.blackBoldStyle(20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    // Constrói o card das formas de pagamento
    Widget _buildCardPayment(tipo_recebimento paymentSelected) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () async {
            paymentController.setPaymentSelected(paymentSelected);
            var qrCode = await PostNfce().postNfce(context);
            Get.dialog( barrierDismissible: false ,  QrCodePage(qrCode: qrCode,));
          },
          child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _buildCardContent(paymentSelected),
              )),
        ),
      );
    }

    // Constrói o grid de pagamentos
    Widget _buildGridPayments() {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.1),
        itemCount: paymentController.paymentForms.length,
        itemBuilder: (context, index) {
          tipo_recebimento paymentSelected =
              paymentController.paymentForms[index];
          return _buildCardPayment(paymentSelected);
        },
      );
    }

    // Constrói o botão de voltar
    Widget _buildButtonBack() {
      return SizedBox(
        height: Get.size.height * 0.07,
        width: Get.size.width,
        child: CustomElevatedButton(
          text: 'Voltar',
          color: CustomColors.informationBox,
          onPressed: () => Get.back(),
          style: CustomTextStyles.whiteStyle(20),
          radious: 0,
        ),
      );
    }

    // Constrói a pagina de pagamento
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomHeader(),
          Text(
            'PAGAMENTOS',
            style: CustomTextStyles.blackBoldStyle(35),
          ),
          Expanded(child: _buildGridPayments()),
          _buildButtonBack(),
        ],
      ),
    );
  }
}
