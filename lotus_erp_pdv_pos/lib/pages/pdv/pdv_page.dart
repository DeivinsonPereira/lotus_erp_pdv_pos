// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/common/custom_elevated_button.dart';
import 'package:lotus_erp_pdv_pos/controller/bill_controller.dart';

import '../../common/constant/custom_text_style.dart';
import '../../common/custom_total_value.dart';
import '../../services/dependencies.dart';
import '../cart_shopping/cart_shopping_page.dart';
import '../../common/custom_header.dart';
import 'widgets/group_widget.dart';
import 'widgets/product_widget.dart';

class PdvPage extends StatelessWidget {
  const PdvPage({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.billController();

    // Constrói o campo de pesquisa
    Widget _buildSearchField() {
      return Container(
        width: Get.size.width,
        height: Get.size.height * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: 'Pesquisar',
          ),
        ),
      );
    }

    // Constrói o botão para limpar os produtos do carrinho
    Widget _buildCleanButton(BillController _) {
      return SizedBox(
        height: Get.size.height * 0.07,
        child: CustomElevatedButton(
            text: 'Limpar',
            color: CustomColors.informationBox,
            onPressed: () {
              _.clearProductsInCart();
              print(_.productsInCart.length);
            },
            style: CustomTextStyles.whiteBoldStyle(20),
            radious: 0),
      );
    }

    // Constrói o botão de continuar
    Widget _buildContinueButton() {
      return SizedBox(
        height: Get.size.height * 0.07,
        child: CustomElevatedButton(
            text: 'Continuar',
            color: CustomColors.confirmButtonColor,
            onPressed: () {
              Get.to(() => const CartShoppingPage());
            },
            style: CustomTextStyles.blackBoldStyle(20),
            radious: 0),
      );
    }

    // Constrói a linha dos botões de limpar carrinho e continuar
    Widget _buildButtonsCleanContinue(BillController _) {
      return Row(children: [
        Expanded(
          child: _buildCleanButton(_),
        ),
        Expanded(child: _buildContinueButton()),
      ]);
    }

    // Constrói o corpo da pagina
    Widget _buildBody() {
      return GetBuilder<BillController>(
        builder: (_) {
          return SizedBox(
            width: Get.size.width,
            height: Get.size.height,
            child: Column(
              children: [
                CustomHeader(isPdvPage: true, billController: _),
                SizedBox(
                  height: Get.size.height * 0.02,
                ),
                _buildSearchField(),
                SizedBox(height: Get.size.height * 0.005),
                const GroupWidget(),
                const Expanded(child: ProductWidget()),
                const CustomTotalValue(),
                _buildButtonsCleanContinue(_),
              ],
            ),
          );
        },
      );
    }

    // retorna o pdv
    return Scaffold(
      backgroundColor: CustomColors.backgroundPDV,
      body: SafeArea(top: false, child: _buildBody()),
    );
  }
}
