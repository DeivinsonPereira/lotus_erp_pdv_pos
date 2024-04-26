// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:lotus_erp_pdv_pos/pages/home/components/custom_buttons_drawer.dart';

import '../../../common/constant/custom_colors.dart';
import '../../../common/custom_image_logo.dart';
import '../../../services/dependencies.dart';

class CustomBuildDrawer extends StatelessWidget {
  const CustomBuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();

    // Constrói a logo no drawer
    Widget _buildLogo() {
      return Align(
          alignment: Alignment.centerLeft,
          child: CustomImageLogo().getLogoBranca(width: 150));
    }

    // Constrói o corpo do drawer
    Widget _buildBodyDrawer() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(
          child: Column(children: [
            _buildLogo(),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: CustomColors.informationBox,
              thickness: 1.5,
            ),
            // Constrói os botões
            ...CustomButtonsDrawer().buildButtonsNavigation(),
            const Divider(
              color: CustomColors.informationBox,
              thickness: 1.5,
            ),
            const Expanded(child: SizedBox()),
            ...CustomButtonsDrawer().buildLogoutAndExit(),
          ]),
        ),
      );
    }

    // Retorna o drawer
    return Drawer(
      backgroundColor: configController.backgroundColor['color'] as Color,
      child: _buildBodyDrawer(),
    );
  }
}
