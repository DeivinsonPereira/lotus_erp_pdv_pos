// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common/custom_text_field.dart';
import '../../../controller/config_controller.dart';
import '../../../repositories/http/get_ip.dart';
import '../../../services/dependencies.dart';
import 'custom_field_dropdown_color.dart';
import 'custom_field_dropdown_monitor.dart';
import 'list_dropdown_option.dart';

class FieldsCamp extends StatelessWidget {
  const FieldsCamp({super.key});

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();

    // Constrói o campo para numero do contrato/ip
    Widget _buildIpField() {
      return CustomTextField(
        textLabel: 'Ip Empresa',
        icon: FontAwesomeIcons.wifi,
        controller: configController.contractController,
        isConfig: true,
        function: () => GetIp().fetchIp(),
      );
    }

    // Constrói o campo para o id da empresa
    Widget _buildIdCompanyField() {
      return CustomTextField(
        textLabel: 'Id Empresa',
        icon: FontAwesomeIcons.solidBuilding,
        controller: configController.idCompanyController,
        isNumeric: true,
        isPreffixIcon: true,
      );
    }

    // Constrói o campo para a serie da nfce
    Widget _buildSerieNfceField() {
      return CustomTextField(
        textLabel: 'Serie NFCE',
        icon: FontAwesomeIcons.fileInvoiceDollar,
        controller: configController.serieNfceController,
        isNumeric: true,
        isPreffixIcon: true,
      );
    }

    // Constrói o campo para o n° do caixa
    Widget _buildNumCaixaField() {
      return CustomTextField(
        textLabel: 'N° Caixa',
        icon: FontAwesomeIcons.cashRegister,
        controller: configController.numCaixaController,
        isNumeric: true,
        isPreffixIcon: true,
      );
    }

    // Constrói o campo para o intervalo
    Widget _buildIntervalField() {
      return CustomTextField(
        textLabel: 'Intervalo',
        icon: FontAwesomeIcons.solidClock,
        controller: configController.intervalController,
        isNumeric: true,
        isPreffixIcon: true,
      );
    }

    // Constrói o campo para o tamanho da impressora
    Widget _buildSizePrinterField() {
      return GetBuilder<ConfigController>(
        builder: (_) {
          return CustomFieldDropdown(
            icon: FontAwesomeIcons.print,
            options: ListDropdownOption().listOptionsSizePrinter,
            value: _.sizePrinter.value,
            text: 'Tamanho da Impres...',
            isSizePrinter: true,
          );
        },
      );
    }

    // Constrói o campo para a cor de fundo
    Widget _buildBackgroundColorColorField() {
      return GetBuilder<ConfigController>(builder: (_) {
        return CustomFieldDropdownColor(
          options: List<String>.from(ListDropdownOption()
              .listColors
              .map((color) => color['name'] as String)),
          value: _.backgroundColor['name'] as String,
          text: 'Cor do Fundo',
        );
      });
    }

    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: _buildIpField(),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: SizedBox(
          width: Get.size.width * 0.9,
          child: Row(children: [
            Expanded(child: _buildIdCompanyField()),
            const SizedBox(
              width: 2.0,
            ),
            Expanded(child: _buildSerieNfceField()),
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: SizedBox(
          width: Get.size.width * 0.9,
          child: Row(
            children: [
              Expanded(child: _buildNumCaixaField()),
              const SizedBox(
                width: 2.0,
              ),
              Expanded(child: _buildIntervalField()),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
            width: Get.size.width * 0.9,
            child: Row(
              children: [
                Expanded(child: _buildSizePrinterField()),
                const SizedBox(
                  width: 2.0,
                ),
                Expanded(child: _buildBackgroundColorColorField()),
              ],
            )),
      ),
      SizedBox(height: Get.size.height * 0.03),
    ]);
  }
}
