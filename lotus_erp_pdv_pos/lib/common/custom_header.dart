// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';

import 'package:lotus_erp_pdv_pos/common/custom_image_logo.dart';

import '../controller/bill_controller.dart';
import '../services/dependencies.dart';
import '../pages/cart_shopping/cart_shopping_page.dart';

class CustomHeader extends StatelessWidget {
  bool? isPdvPage;
  BillController? billController;
  CustomHeader({
    Key? key,
    this.isPdvPage = false,
    this.billController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();

    Widget _buildCartShoppingIcon() {
      return Stack(
        children: [
          IconButton(
            onPressed: () => Get.to(() => const CartShoppingPage()),
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 151, 37, 29),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 20,
              height: 20,
              child: Center(
                child: Obx(() => Text(
                      billController!.total.value.toString(),
                      style: CustomTextStyles.whiteBoldStyle(10),
                    )),
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      color: configController.backgroundColor['color'] as Color,
      child: Column(
        children: [
          SizedBox(
            height: Get.size.height * 0.03,
          ),
          SizedBox(
            height: Get.size.height * 0.08,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isPdvPage!
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomImageLogo().getLogoBranca(),
                  ),
                  isPdvPage! ? _buildCartShoppingIcon() : const SizedBox(),
                ]),
          ),
        ],
      ),
    );
  }
}
