// ignore_for_file: no_leading_underscores_for_local_identifiers


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'constant/custom_colors.dart';
import 'constant/custom_text_style.dart';
import 'custom_elevated_button.dart';
import 'custom_header_popup.dart';

class CustomDialogExit extends StatelessWidget {
  const CustomDialogExit({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildExitButton() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          text: 'Sair',
          color: Colors.red,
          onPressed: () => SystemNavigator.pop(),
          style: CustomTextStyles.blackBoldStyle(20),
          radious: 0,
        ),
      );
    }

    Widget _buildBackButton() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          text: 'Voltar',
          color: CustomColors.informationBox,
          onPressed: () => Get.back(),
          style: CustomTextStyles.blackBoldStyle(20),
          radious: 0,
        ),
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        width: Get.size.width * 0.8,
        height: Get.size.height * 0.4,
        child: Column(children: [
          CustomHeaderPopup(text: 'Sair', permitClose: true),
          Expanded(
            child: Center(
              child: Text('Deseja mesmo sair do aplicativo?',
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.blackBoldStyle(20)),
            ),
          ),
          Row(children: [
            Expanded(child: _buildBackButton()),
            Expanded(child: _buildExitButton()),
          ])
        ]),
      ),
    );
  }
}