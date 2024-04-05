// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constant/custom_colors.dart';
import '../../../common/constant/custom_text_style.dart';

class ContainerDate extends StatelessWidget {
  final String text;
  final String information;
  final double width;
  const ContainerDate({
    Key? key,
    required this.text,
    required this.information,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Constrói a informação
    Widget _buildDate() {
      return SizedBox(
        width: Get.size.width * 0.35,
        height: Get.size.height * 0.04,
        child: Text(
          information,
          style: CustomTextStyles.blackBoldStyle(18),
          textAlign: TextAlign.center,
        ),
      );
    }

    // Constrói o container da legenda
    Widget _buildTextLegend() {
      return Container(
        width: Get.size.width * 0.35,
        height: Get.size.height * 0.03,
        color: CustomColors.backSlider,
        child: Align(
          alignment: Alignment.center,
          child: Text(text,
              style: CustomTextStyles.whiteStyle(14),
              textAlign: TextAlign.center),
        ),
      );
    }

    // Retorna o container de data
    return Container(
      color: Colors.grey[300],
      width: width,
      child: Column(
        children: [
          _buildTextLegend(),
          _buildDate(),
        ],
      ),
    );
  }
}
