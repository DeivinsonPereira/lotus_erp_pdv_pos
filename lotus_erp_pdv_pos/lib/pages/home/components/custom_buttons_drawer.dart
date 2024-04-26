import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';

class CustomButtonsDrawer {
  // retorna os botões de navegação do drawer
  List<Widget> buildButtonsNavigation() {
    List<Widget> rowButtons = [];

    rowButtons.add(
      _buildRows(FontAwesomeIcons.handHoldingDollar, 'Abrir Caixa'),
    );
    rowButtons.add(
      _buildRows(FontAwesomeIcons.moneyBillTransfer, 'Movimentar Caixa'),
    );
    rowButtons.add(
      _buildRows(FontAwesomeIcons.cashRegister, 'Fechar Caixa'),
    );
    rowButtons.add(
      _buildRows(FontAwesomeIcons.bottleWater, 'Pesquisar Produtos'),
    );
    rowButtons.add(
      _buildRows(FontAwesomeIcons.moneyBill1Wave, 'Entrar PDV'),
    );
    rowButtons.add(
      _buildRows(FontAwesomeIcons.download, 'Carga de Dados'),
    );

    return rowButtons;
  }
  
  // retorna os botões de logout e saída
  List<Widget> buildLogoutAndExit() {
    List<Widget> rowButtons = [];

    rowButtons.add(
      _buildRows(FontAwesomeIcons.solidUser, 'Trocar Usuário'),
    );
    rowButtons.add(_buildRows(FontAwesomeIcons.rightFromBracket, 'Sair'),);

    return rowButtons;
  }

  // Constrói o corpo dos botões
  Widget _buildRows(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 35,
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
    );
  }
}
