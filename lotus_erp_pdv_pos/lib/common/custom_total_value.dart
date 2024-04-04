import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/services/format_numbers.dart';

import '../services/dependencies.dart';
import 'constant/custom_text_style.dart';

class CustomTotalValue extends StatelessWidget {
  const CustomTotalValue({super.key});

  @override
  Widget build(BuildContext context) {
    var billController = Dependencies.billController();

    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.08,
      color: CustomColors.backSlider,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Total: ',
            style: CustomTextStyles.whiteBoldStyle(20),
          ),
          Obx(() => Text(
                'R\$ ${FormatNumbers.formatNumbertoString(billController.getTotal())}',
                style: CustomTextStyles.whiteBoldStyle(20),
              )),
        ]),
      ),
    );
  }
}
