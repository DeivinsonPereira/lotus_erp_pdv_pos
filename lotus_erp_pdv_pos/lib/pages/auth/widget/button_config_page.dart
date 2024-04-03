import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constant/custom_colors.dart';
import '../../../services/dependencies.dart';
import '../../config/config_page.dart';

class ButtonConfigPage extends StatelessWidget {
  const ButtonConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Dependencies.loginController();

    return Container(
      width: Get.size.width * 0.15,
      height: Get.size.height * 0.08,
      decoration: BoxDecoration(
        color: CustomColors.backSlider,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          loginController.clearAll();
          Get.to(() => const ConfigPage());
        },
        icon: Icon(
          Icons.settings,
          color: CustomColors.customContrastColor,
          size: Get.size.width * 0.1,
        ),
      ),
    );
  }
}
