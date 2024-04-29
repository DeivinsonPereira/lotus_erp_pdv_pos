import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';
import 'package:lotus_erp_pdv_pos/common/custom_dialog_exit.dart';
import 'package:lotus_erp_pdv_pos/pages/home/service/logic_open_register_navigation.dart';

import '../../auth/login_page.dart';
import '../service/logic_moviment_register_navigation.dart';

class CustomButtonsDrawer {
  // retorna os botões de navegação do drawer
  List<Widget> buildButtonsNavigation(BuildContext context) {
    List<Widget> rowButtons = [];

    rowButtons.add(
      _buildRows(
        FontAwesomeIcons.handHoldingDollar,
        'Abrir Caixa',
        () => LogicOpenRegisterNavigation().openRegisterNavigation(context),
      ),
    );
    rowButtons.add(
      _buildRows(FontAwesomeIcons.moneyBillTransfer, 'Movimentar Caixa',
          () => LogicMovimentRegisterNavigation().movimentRegisterNavigation(context)),
    );
    rowButtons.add(
      _buildRows(
          FontAwesomeIcons.cashRegister, 'Fechar Caixa', () => SizedBox()),
    );
    rowButtons.add(
      _buildRows(
          FontAwesomeIcons.bottleWater, 'Pesquisar Produtos', () => SizedBox()),
    );
    rowButtons.add(
      _buildRows(
          FontAwesomeIcons.moneyBill1Wave, 'Entrar PDV', () => SizedBox()),
    );
    rowButtons.add(
      _buildRows(FontAwesomeIcons.download, 'Carga de Dados', () => SizedBox()),
    );

    return rowButtons;
  }

  // retorna os botões de logout e saída
  List<Widget> buildLogoutAndExit(BuildContext context) {
    List<Widget> rowButtons = [];

    rowButtons.add(
      _buildRows(
        FontAwesomeIcons.solidUser,
        'Trocar Usuário',
        () => Get.offAll(
          () => const LoginPage(),
        ),
      ),
    );
    rowButtons.add(
      _buildRows(
        FontAwesomeIcons.rightFromBracket,
        'Sair',
        () => Get.to(
          const CustomDialogExit(),
        ),
      ),
    );

    return rowButtons;
  }

  // Constrói o corpo dos botões
  Widget _buildRows(IconData icon, String title, Function() function) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              title,
              style: CustomTextStyles.whiteBoldStyle(18),
            )
          ],
        ),
      ),
    );
  }
}
