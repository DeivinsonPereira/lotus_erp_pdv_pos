// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_text_style.dart';
import 'package:lotus_erp_pdv_pos/common/custom_image_logo.dart';
import 'package:lotus_erp_pdv_pos/pages/home/components/custom_build_drawer.dart';

import '../../services/dependencies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();
    var openRegisterController = Dependencies.openRegisterController();
    openRegisterController.verifyIsRegisterOpen();

    // Constrói o Drawer
    Widget _buildDrawer() {
      return const CustomBuildDrawer();
    }

    // Constrói o corpo da página
    Widget _buildBody() {
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomImageLogo().getLogoPadrao(),
      ));
    }

    // Retorna o AppBar
    PreferredSizeWidget _buildAppBar() {
      return AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: configController.backgroundColor['color'] as Color,
        title: Text(
          'Home Page',
          style: CustomTextStyles.whiteBoldStyle(20),
        ),
      );
    }

    // Retona a home page
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
