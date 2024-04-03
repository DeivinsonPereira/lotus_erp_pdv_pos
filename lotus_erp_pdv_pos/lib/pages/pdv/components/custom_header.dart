import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/custom_image_logo.dart';

import '../../../services/dependencies.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();

    return Container(
      color: configController.backgroundColor['color'] as Color,
      height: Get.size.height * 0.1,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomImageLogo().getLogoBranca(width: Get.size.width * 0.5),
        ),
      ]),
    );
  }
}
