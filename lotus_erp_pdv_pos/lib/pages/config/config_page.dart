// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constant/custom_colors.dart';
import '../../common/constant/custom_text_style.dart';
import '../../common/custom_background_container.dart';
import '../../common/custom_elevated_button.dart';
import '../../common/custom_position_content_container.dart';
import 'components/fields_camp.dart';
import 'service/logic/logic_confirm_button.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {

    //Botão de confirmação
    Widget _buildButtonConfirm() {
      return SizedBox(
        height: 60,
        width: Get.size.width,
        child: CustomElevatedButton(
          text: 'Confirmar',
          style: CustomTextStyles.blackBoldStyle(20),
          color: CustomColors.customContrastColor,
          onPressed: () async => LogicConfirmButton().isValid(context),
        ),
      );
    }

    //Botão para voltar
    Widget _buildButtonBack() {
      return SizedBox(
        height: 60,
        width: Get.size.width,
        child: CustomElevatedButton(
          text: 'Voltar',
          style: CustomTextStyles.whiteBoldStyle(20),
          color: CustomColors.backSlider,
          onPressed: () => Get.back(),
        ),
      );
    }

    // Campo de texto
    Widget _buildTextFields() {
      return SizedBox(
        height: Get.size.height * 0.29,
        child: const SingleChildScrollView(child: FieldsCamp()),
      );
    }

    // Título da página "Configuração"
    Widget _titleText() {
      return Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Configuração',
          style: CustomTextStyles.blackBoldStyle(Get.size.width * 0.1),
        ),
      );
    }

    // Corpo do container de conteúdo
    Widget _buildBody() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(height: Get.size.height * 0.05),
            _titleText(),
            SizedBox(height: Get.size.height * 0.03),
            _buildTextFields(),
            SizedBox(height: Get.size.height * 0.03),
            _buildButtonConfirm(),
            SizedBox(height: Get.size.height * 0.02),
            _buildButtonBack(),
          ],
        ),
      );
    }

    // Retorno do Scaffold
    return Scaffold(
      backgroundColor: CustomColors.backSlider,
      body: Stack(
        children: [
          const CustomBackgroundContainer(),
          PositionContentContainer(widget: _buildBody()),
        ],
      ),
    );
  }
}
