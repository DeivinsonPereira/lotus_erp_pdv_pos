// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';
import 'package:lotus_erp_pdv_pos/common/custom_elevated_button.dart';
import 'package:lotus_erp_pdv_pos/common/custom_header.dart';
import 'package:lotus_erp_pdv_pos/common/custom_total_value.dart';

class CartShoppingPage extends StatelessWidget {
  const CartShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO => implementar o carrinho de compras
    Widget _buildListCards() {
      return ListView.builder(itemCount: 5, itemBuilder: (context, index) {});
    }

    // Constrói o botão de voltar
    Widget _buildBackButton() {
      return SizedBox(
        height: Get.size.height * 0.07,
        child: CustomElevatedButton(
          text: 'Voltar',
          color: CustomColors.informationBox,
          onPressed: () => Get.back(),
          style: CustomTextStyles.whiteBoldStyle(20),
          radious: 0,
        ),
      );
    }

    Widget _buildContinueButton() {
      return SizedBox(
        height: Get.size.height * 0.07,
        child: CustomElevatedButton(
          text: 'Seguir',
          color: CustomColors.confirmButtonColor,
          onPressed: () {},
          style: CustomTextStyles.blackBoldStyle(20),
          radious: 0,
        ),
      );
    }

    Widget _buildButtonsBackContinue() {
      return Row(children: [
        Expanded(
          child: _buildBackButton(),
        ),
        Expanded(child: _buildContinueButton()),
      ]);
    }

    return Scaffold(
      body: Column(
        children: [
          CustomHeader(),
          Expanded(child: _buildListCards()),
          const CustomTotalValue(),
          _buildButtonsBackContinue(),
        ],
      ),
    );
  }
}
