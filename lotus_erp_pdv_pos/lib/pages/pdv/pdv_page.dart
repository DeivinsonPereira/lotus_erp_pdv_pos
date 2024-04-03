// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/pages/pdv/components/group_widget.dart';

import '../../common/constant/custom_text_style.dart';
import '../../services/dependencies.dart';
import 'components/custom_header.dart';

class PdvPage extends StatelessWidget {
  const PdvPage({super.key});

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();
    var pdvController = Dependencies.pdvController();
    // Constrói o campo de pesquisa
    Widget _buildSearchField() {
      return Container(
        width: Get.size.width * 0.9,
        height: Get.size.height * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: 'Pesquisar',
          ),
        ),
      );
    }

    // Constrói o corpo da pagina
    Widget _buildBody() {
      return SizedBox(
        width: Get.size.width,
        height: Get.size.height,
        child: Column(
          children: [
            const CustomHeader(),
            SizedBox(
              height: Get.size.height * 0.07,
            ),
            _buildSearchField(),
            SizedBox(height: Get.size.height * 0.03),
            const GroupWidget(),
            //    _buildProducts(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: configController.backgroundColor['color'] as Color,
      body: SafeArea(child: _buildBody()),
    );
  }
}
