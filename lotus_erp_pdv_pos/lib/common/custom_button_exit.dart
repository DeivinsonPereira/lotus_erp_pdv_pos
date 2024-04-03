import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/custom_text_style.dart';
import 'custom_dialog_exit.dart';
import 'custom_elevated_button.dart';

class CustomButtonExit extends StatelessWidget {
  const CustomButtonExit({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: CustomElevatedButton(
        onPressed: () => Get.dialog(const CustomDialogExit()),
        color: Colors.red,
        text: 'Sair',
        style: CustomTextStyles.blackBoldStyle(20),
      ),
    );
  }
}