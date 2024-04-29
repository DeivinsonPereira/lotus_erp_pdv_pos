// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/common/custom_elevated_button.dart';
import 'package:lotus_erp_pdv_pos/common/custom_header_popup.dart';
import 'package:lotus_erp_pdv_pos/common/custom_text_field.dart';
import 'package:lotus_erp_pdv_pos/pages/moviment_register/components/custom_text_field_moviment.dart';
import 'package:lotus_erp_pdv_pos/services/custom_containers_dialog_prepared.dart';
import 'package:lotus_erp_pdv_pos/services/dependencies.dart';

import '../../common/constant/custom_text_style.dart';
import '../../services/format_txt.dart';
import 'components/custom_container_dropdown_moviment.dart';
import 'service/logic/logic_back_button_moviment.dart';
import 'service/logic/logic_confirm_button_moviment.dart';

class MovimentRegisterDialog extends StatelessWidget {
  const MovimentRegisterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var openRegisterController = Dependencies.openRegisterController();
    var containers = CustomContainersDialogPrepared();
    double sizeButtons = 50.0;

    // Constrói o header
    Widget _buildHeader() {
      return CustomHeaderPopup(
        text: 'Movimentar Caixa',
      );
    }

    // Constrói o botão de voltar
    Widget _buildBackButton() {
      return SizedBox(
        height: sizeButtons,
        child: CustomElevatedButton(
            text: 'Voltar',
            color: CustomColors.informationBox,
            onPressed: () => LogicBackButtonMoviment().back(),
            style: CustomTextStyles.whiteBoldStyle(20),
            radious: 0),
      );
    }

    // Constrói o botão de confirmar
    Widget _buildConfirmButton() {
      return SizedBox(
        height: sizeButtons,
        child: CustomElevatedButton(
            text: 'Confirmar',
            color: CustomColors.confirmButtonColor,
            onPressed: () => LogicConfirmButtonMoviment().confirm(context),
            style: CustomTextStyles.blackBoldStyle(20),
            radious: 0),
      );
    }

    // Constrói a linha dos botões de voltar e de confirmar
    Widget _buildButtonsBackAndConfirm() {
      return Row(children: [
        Expanded(
          child: _buildBackButton(),
        ),
        Expanded(
          child: _buildConfirmButton(),
        )
      ]);
    }

    // Constrói o campo de texto
    Widget _buildDescriptionField() {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: CustomTextFieldMoviment(),
      );
    }

    // Constrói o campo de valor
    Widget _buildValueTextField() {
      return Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: SizedBox(
          width: Get.size.width * 0.36,
          height: 52,
          child: CustomTextField(
            textLabel: 'Valor',
            icon: FontAwesomeIcons.moneyBill,
            controller: openRegisterController.movimentController,
            inputFormatters: [ValueMoneyMask()],
            isNumeric: true,
            isDense: true,
          ),
        ),
      );
    }

    // Constrói o tipo de movimentação
    Widget _buildTypeAndValueMovimentation() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomContainerDropdownMoviment(),
            _buildValueTextField(),
          ],
        ),
      );
    }

    // Constrói o corpo do dialog
    Widget _buildBody() {
      return Column(
        children: [
          Expanded(
            child: Column(children: [
              _buildHeader(),
              containers.buildLineIdAndUser(),
              containers.buildDate(),
              const SizedBox(
                height: 10,
              ),
              _buildDescriptionField(),
              _buildTypeAndValueMovimentation(),
            ]),
          ),
          _buildButtonsBackAndConfirm(),
        ],
      );
    }

    // Constrói o dialog
    return SingleChildScrollView(
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Container(
          color: Colors.white,
          height: Get.size.height * 0.7,
          width: Get.size.width * 0.4,
          child: _buildBody(),
        ),
      ),
    );
  }
}
