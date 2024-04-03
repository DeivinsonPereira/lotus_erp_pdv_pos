// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constant/custom_text_style.dart';
import '../../../services/dependencies.dart';

class GroupWidget extends StatelessWidget {
  const GroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var pdvController = Dependencies.pdvController();

    // Constrói o titulo do widget
    Widget _buildTitle() {
      return Text(
        'Grupos',
        style: CustomTextStyles.whiteBoldStyle(20),
      );
    }

    // Constrói  o listView do grupo
    Widget _buildListGroup() {
      return SizedBox(
        height: Get.size.height * 0.05,
        width: Get.size.width * 0.9,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pdvController.groups.length,
            itemBuilder: (context, index) {
              return Container();
            }),
      );
    }

    return Container(
      height: Get.size.height * 0.17,
      width: Get.size.width * 0.9,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildTitle(), _buildListGroup()]),
    );
  }
}
