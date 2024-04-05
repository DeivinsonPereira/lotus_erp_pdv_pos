// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';
import 'package:lotus_erp_pdv_pos/common/custom_elevated_button.dart';
import 'package:lotus_erp_pdv_pos/common/custom_header.dart';
import 'package:lotus_erp_pdv_pos/common/custom_total_value.dart';

import '../../services/dependencies.dart';

class CartShoppingPage extends StatelessWidget {
  const CartShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var billController = Dependencies.billController();

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

    Widget _buildCard(int index, dynamic itemSelected) {
      return Column(
        children: [
          Text(
              '${itemSelected['product'].id_produto.toString()} - ${itemSelected['product'].descricao}'),
          Text('Qtde: ${itemSelected['quantity'].toString()}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total: '),
              Text(
                  'R\$ ${(itemSelected['product'].pvenda * itemSelected['quantity']).toString()}'),
            ],
          ),
          Row(children: [
            IconButton(
              onPressed: () {
                billController.removeProductIncartShopping(
                    index, itemSelected['product']);
              },
              icon: const Icon(Icons.delete),
            )
          ])
        ],
      );
    }

    Widget _buildListCartShopping() {
      return SizedBox(
        width: Get.size.width,
        child: ListView.builder(
            itemCount: billController.cartShopping.length,
            itemBuilder: (context, index) {
              var itemSelected = billController.cartShopping[index];
              return _buildCard(index, itemSelected);
            }),
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
      body: SizedBox(
        width: Get.size.width,
        child: Column(
          children: [
            CustomHeader(),
            Expanded(child: _buildListCartShopping()),
            const CustomTotalValue(),
            _buildButtonsBackContinue(),
          ],
        ),
      ),
    );
  }
}
