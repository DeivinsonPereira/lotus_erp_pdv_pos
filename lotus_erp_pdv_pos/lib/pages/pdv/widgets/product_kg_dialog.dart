// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';
import 'package:lotus_erp_pdv_pos/common/custom_elevated_button.dart';
import 'package:lotus_erp_pdv_pos/common/custom_text_field.dart';

import '../../../common/custom_header_popup.dart';
import '../../../models/collections/produto.dart';
import '../../../services/dependencies.dart';

class ProductKgDialog extends StatelessWidget {
  final produto product;
  const ProductKgDialog({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var billController = Dependencies.billController();
    var weightController = Dependencies.weightController();
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: Get.size.height * 0.5,
        width: Get.size.width * 0.5,
        child: Column(
          children: [
            SizedBox(
                width: Get.size.width * 0.8,
                height: Get.size.height * 0.1,
                child: CustomHeaderPopup(text: 'Quantidade (KG)')),
            Expanded(
              child: SizedBox(
                height: Get.size.height * 0.4,
                width: Get.size.width * 0.5,
                child: Column(
                  children: [
                    SizedBox(
                        height: Get.size.height * 0.13,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Digite o peso',
                              style: CustomTextStyles.blackBoldStyle(20)),
                        )),
                    SizedBox(
                      height: Get.size.height * 0.1,
                      width: Get.size.width * 0.5,
                      child: CustomTextField(
                          isNumeric: true,
                          textLabel: 'Pesagem',
                          icon: FontAwesomeIcons.weightScale,
                          controller: weightController.weighingController),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.size.width * 0.8,
              height: Get.size.height * 0.07,
              child: CustomElevatedButton(
                  text: 'Confirmar',
                  color: CustomColors.confirmButtonColor,
                  onPressed: () {
                    if (weightController.weighingController.text == '0.000') {
                      Get.back();
                      weightController.cleanWeightController();
                    } else {
                      billController.addProductInCart(product);
                      Get.back();
                      weightController.cleanWeightController();
                    }
                  },
                  style: CustomTextStyles.blackBoldStyle(20),
                  radious: 0),
            ),
          ],
        ),
      ),
    );
  }
}
