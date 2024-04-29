// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';
import 'package:lotus_erp_pdv_pos/common/custom_elevated_button.dart';
import 'package:lotus_erp_pdv_pos/common/custom_header_popup.dart';
import 'package:lotus_erp_pdv_pos/common/custom_text_field.dart';
import 'package:lotus_erp_pdv_pos/common/custom_container_dialog.dart';
import 'package:lotus_erp_pdv_pos/services/datetime_formatter.dart';
import 'package:lotus_erp_pdv_pos/services/dependencies.dart';

import '../../services/format_txt.dart';
import 'service/logic_open_register.dart';

class OpenRegisterDialog extends StatelessWidget {
  const OpenRegisterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();
    var openRegisterController = Dependencies.openRegisterController();

    // Constrói os containers de informação
    Widget _buildInformations() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainerDialog(
              text: 'DATA MOVIMENTO',
              information: DatetimeFormatterWidget.formatDate(DateTime.now()),
              width: Get.size.width * 0.35,
            ),
            CustomContainerDialog(
              text: 'OPERADOR',
              information: configController.userLogin,
              width: Get.size.width * 0.35,
            ),
          ],
        ),
      );
    }

    // Constrói o texto da legenda
    Widget _buildTextLegend() {
      return Text(
        'Informe o valor de abertura \ndo caixa',
        style: CustomTextStyles.blackBoldStyle(20),
        textAlign: TextAlign.center,
      );
    }

    // Constrói o campo de valor
    Widget _buildTextField() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomTextField(
          textLabel: 'Valor Abertura',
          icon: FontAwesomeIcons.moneyBill1Wave,
          controller: openRegisterController.openController,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            ValueMoneyMask()
          ],
        ),
      );
    }

    // Constroi o botão de confirmação
    Widget _buildConfirmButton() {
      return SizedBox(
        height: Get.size.height * 0.07,
        width: Get.size.width,
        child: CustomElevatedButton(
          text: 'Confirmar',
          color: openRegisterController.buttonEnabled.value
              ? CustomColors.confirmButtonColor
              : CustomColors.informationBox,
          onPressed: () {
            if (openRegisterController.buttonEnabled.value &&
                openRegisterController.isRegisterOpen == false) {
              LogicOpenRegister().openRegister(context);
            }
          },
          style: openRegisterController.buttonEnabled.value
              ? CustomTextStyles.blackBoldStyle(20)
              : CustomTextStyles.whiteBoldStyle(20),
          radious: 0,
        ),
      );
    }

    // Constrói o corpo do dialog
    Widget _buildBody() {
      return Column(
        children: [
          CustomHeaderPopup(text: 'Abrir Caixa'),
          _buildInformations(),
          _buildTextLegend(),
          Expanded(child: _buildTextField()),
          _buildConfirmButton(),
        ],
      );
    }

    // Constrói o dialog
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        height: Get.size.height * 0.5,
        width: Get.size.width * 0.5,
        child: _buildBody(),
      ),
    );
  }
}
