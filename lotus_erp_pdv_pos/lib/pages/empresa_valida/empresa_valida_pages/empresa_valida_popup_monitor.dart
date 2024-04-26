// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/custom_header_popup.dart';
import 'package:lotus_erp_pdv_pos/services/dependencies.dart';

import '../../../common/constant/custom_colors.dart';
import '../../../common/constant/custom_text_style.dart';
import '../../../common/custom_text_field.dart';
import '../../../services/format_txt.dart';
import '../service/logic/logic_valid_contract.dart';

//Popup para informar o contrato da empresa caso o mesmo esteja vazio no banco de dados
class EmpresaValidaPopupMonitor extends StatelessWidget {
  const EmpresaValidaPopupMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    var empresaValidaController = Dependencies.empresaValidaController();

    // Botão para sair do aplicativo
    Widget _backButton() {
      return Container(
        height: 60,
        color: CustomColors.informationBox,
        child: TextButton(
          onPressed: () {
            if (empresaValidaController.isButtonEnabled.value == true) {
              SystemNavigator.pop();
            }
          },
          child: Text(
            'Sair',
            style: CustomTextStyles.whiteBoldStyle(18),
          ),
        ),
      );
    }

    // Botão para confirmar o contrato
    Widget _confirmButton() {
      return Obx(
        () => Container(
          height: 60,
          color: empresaValidaController.isButtonEnabled.value
              ? CustomColors.confirmButtonColor
              : Colors.grey[300],
          child: TextButton(
            onPressed: () async => LogicValidContract().valid(context),
            child: empresaValidaController.isButtonEnabled.value
                ? Text(
                    'Liberar \nOn-line',
                    style: CustomTextStyles.blackBoldStyle(18),
                  )
                : Text(
                    'AGUARDE',
                    style: CustomTextStyles.blackStyle(18),
                  ),
          ),
        ),
      );
    }

    // Botoes para voltar e confirmar
    Widget _buttonsBackAndConfirm() {
      return Row(children: [
        Expanded(child: _backButton()),
        Expanded(child: _confirmButton()),
      ]);
    }

    // Constrói o cabecalho do popup
    Widget _buildHeader() {
      return CustomHeaderPopup(
        text: 'Liberar Licença',
        permitClose: false,
      );
    }

    // Constrói o campo para a licença
    Widget _buildLicencaField() {
      return CustomTextField(
          controller: empresaValidaController.licencaContratoController,
          icon: Icons.app_settings_alt_outlined,
          textLabel: 'Licença',
          inputFormatters: [LicenceTxt(), UpperCaseTxt()]);
    }

    // Constrói o campo para o cnpj
    Widget _buildCnpjField() {
      return CustomTextField(
        controller: empresaValidaController.cnpjController,
        icon: Icons.factory,
        textLabel: 'CNPJ',
        inputFormatters: [CnpjTxt()],
      );
    }

    // Constrói o corpo do popup
    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          // corpo
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLicencaField(),
                  const SizedBox(height: 20),
                  _buildCnpjField()
                ],
              ),
            ),
          ),

          // botões
          _buttonsBackAndConfirm(),
        ],
      );
    }

    // Conteiner do conteúdo
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        height: 400,
        width: 400,
        child: _buildBody(),
      ),
    );
  }
}
