// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/controller/pdv_controller.dart';
import 'package:lotus_erp_pdv_pos/pages/pdv/components/custom_image.dart';
import 'package:lotus_erp_pdv_pos/services/format_numbers.dart';

import '../../../common/constant/custom_text_style.dart';
import '../../../models/collections/produto.dart';
import '../../../services/dependencies.dart';
import 'product_kg_dialog.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.pdvController();
    var billController = Dependencies.billController();

    // Constrói o preço do produto no card
    Widget _buildPriceCard(produto product) {
      return Text(
        'R\$ ${FormatNumbers.formatNumbertoString(product.pvenda)}',
        style: CustomTextStyles.blackBoldStyle(14),
      );
    }

    // Constrói a unidade do produto no card
    Widget _buildUnityCard(dynamic product) {
      return Text(
        product.unidade!,
        style: CustomTextStyles.blackBoldStyle(14),
      );
    }

    // Constrói o título do produto no card
    Widget _buildTitleCard(dynamic product) {
      return SizedBox(
        height: 40,
        child: Text(
          product.descricao!,
          style: CustomTextStyles.blackBoldStyle(14),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    // Constrói a imagem do produto no card
    Widget _buildImageCard(dynamic product, int index, PdvController _) {
      return Stack(
        children: [
          CustomImage().getImageProduct(
              index < _.pathImageProductsFiltered.length
                  ? _.pathImageProductsFiltered[index].path_image ?? ''
                  : ''),
          Obx(() => Positioned(
                top: 0,
                right: 0,
                child: billController.getQuantity(product) > 0
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColors.customSwatchColor,
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          billController.getQuantity(product).toString(),
                          style: CustomTextStyles.whiteBoldStyle(12),
                        ),
                      )
                    : const SizedBox(),
              )),
        ],
      );
    }

    // Constrói o card dos produtos
    Widget _buildCardProduct(dynamic product, int index, PdvController _) {
      return InkWell(
        onTap: () {
          if (product.venda_kg == 1) {
            Get.dialog(
                barrierDismissible: false,
                ProductKgDialog(
                  product: product,
                ));
          } else {
            billController.addProductInCart(product);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.solid,
                color: const Color.fromARGB(125, 0, 0, 0),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              _buildImageCard(product, index, _),
              _buildTitleCard(product),
              _buildUnityCard(product),
              _buildPriceCard(product)
            ]),
          ),
        ),
      );
    }

    // constrói o corpo dos produtos
    Widget _buildGridViewBody() {
      return GetBuilder<PdvController>(
        builder: (_) {
          return SizedBox(
            height: Get.size.height * 0.5,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                itemCount: _.productsFiltered.length,
                itemBuilder: (context, index) {
                  var productSelected = _.productsFiltered[index];
                  return _buildCardProduct(productSelected, index, _);
                }),
          );
        },
      );
    }

    // Retorna o container dos produtos
    return Container(
      height: Get.size.height * 0.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: _buildGridViewBody(),
    );
  }
}
