// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';
import 'package:lotus_erp_pdv_pos/common/custom_elevated_button.dart';
import 'package:lotus_erp_pdv_pos/common/custom_header.dart';
import 'package:lotus_erp_pdv_pos/common/custom_total_value.dart';
import 'package:lotus_erp_pdv_pos/services/format_strings.dart';

import '../../controller/bill_controller.dart';
import '../../services/dependencies.dart';
import '../../services/format_numbers.dart';
import '../payment/payment_page.dart';

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

    // Constrói o botão de continuar
    Widget _buildContinueButton() {
      return SizedBox(
        height: Get.size.height * 0.07,
        child: CustomElevatedButton(
          text: 'Seguir',
          color: CustomColors.confirmButtonColor,
          onPressed: () => Get.to(() => const PaymentPage()),
          style: CustomTextStyles.blackBoldStyle(20),
          radious: 0,
        ),
      );
    }

    // Constrói a linha de id - nome do item e botão remover
    Widget _buildLineDescription(dynamic itemSelected) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${FormatStrings.maxLength('${itemSelected['product'].id_produto.toString()} - ${itemSelected['product'].descricao}', 27)} ',
            style: CustomTextStyles.blackBoldStyle(18),
          ),
          IconButton(
            onPressed: () {
              billController
                  .removeProductIncartShopping(itemSelected['product']);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      );
    }

    // Constrói a linha de quantidade
    Widget _buildQuantity(dynamic itemSelected) {
      return Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Qtde: ${itemSelected['quantity'].toString()}',
            style: CustomTextStyles.blackStyle(18),
          ));
    }

    // Constrói a linha de total
    Widget _buildTotalValue(dynamic itemSelected) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total: ', style: CustomTextStyles.blackStyle(18)),
          Text(
            'R\$ ${(FormatNumbers.formatNumbertoString(itemSelected['product'].pvenda * itemSelected['quantity']).toString())}',
            style: CustomTextStyles.blackBoldStyle(18),
          ),
        ],
      );
    }

    // Costrói o card do carrinho
    Widget _buildCard(int index, dynamic itemSelected, BillController _) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildLineDescription(itemSelected),
            _buildQuantity(itemSelected),
            _buildTotalValue(itemSelected),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Divider(),
            )
          ],
        ),
      );
    }

    // Constrói a lista de itens no carrinho
    Widget _buildListCartShopping() {
      return GetBuilder<BillController>(
        builder: (_) => SizedBox(
          width: Get.size.width,
          child: ListView.builder(
              itemCount: _.cartShopping.length,
              itemBuilder: (context, index) {
                var itemSelected = _.cartShopping[index];
                return _buildCard(index, itemSelected, _);
              }),
        ),
      );
    }

    // Constrói os botões de voltar e continuar
    Widget _buildButtonsBackContinue() {
      return Row(children: [
        Expanded(
          child: _buildBackButton(),
        ),
        Expanded(child: _buildContinueButton()),
      ]);
    }

    // Constrói a tela do carrinho
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
