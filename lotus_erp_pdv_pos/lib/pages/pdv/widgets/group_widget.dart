// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/constant/custom_colors.dart';
import 'package:lotus_erp_pdv_pos/controller/pdv_controller.dart';

import '../../../common/constant/custom_text_style.dart';
import '../../../services/dependencies.dart';
import '../components/custom_image.dart';

class GroupWidget extends StatelessWidget {
  const GroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var pdvController = Dependencies.pdvController();

    // Constrói as imagens do grupo
    Widget _buildImageCard(String group, int index, PdvController _) {
      return Container(
          height: Get.size.height * 0.1,
          width: Get.size.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: group == 'FAVORITOS'
              ? CustomImage().getImageGroup('assets/images/favorito.png')
              : CustomImage().getImageGroup(
                  index <= pdvController.pathImageGroup.length
                      ? pdvController.pathImageGroup[index - 1].path_image ?? ''
                      : ''));
    }

    // Constrói os titulos do grupo
    Widget _buildTitleCard(String group, int index, PdvController _) {
      return Container(
        height: Get.size.height * 0.06,
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        decoration: BoxDecoration(
          color: _.groupSelected.value == index
              ? CustomColors.customSwatchColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          group,
          style: _.groupSelected.value == index
              ? CustomTextStyles.whiteStyle(13)
              : CustomTextStyles.blackStyle(13),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    // Constrói o card do grupo
    Widget _buildCardGroup(String group, int index, PdvController _) {
      return InkWell(
        onTap: () {
          _.updateGroupSelected(index);
          _.filterProducts();
          _.filterPathImageProducts();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: SizedBox(
            width: Get.size.width * 0.32,
            height: Get.size.height * 0.1,
            child: Column(
              children: [
                _buildImageCard(group, index, _),
                _buildTitleCard(group, index, _),
              ],
            ),
          ),
        ),
      );
    }

    // Constrói  o listView do grupo
    Widget _buildListGroup() {
      return GetBuilder<PdvController>(
        builder: (_) {
          return SizedBox(
            height: Get.size.height * 0.17,
            width: Get.size.width * 0.9,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pdvController.groupsDescription.length,
                itemBuilder: (context, index) {
                  var groupSelected = pdvController.groupsDescription[index];
                  return _buildCardGroup(groupSelected, index, _);
                }),
          );
        },
      );
    }

    // retorna o widget do grupo
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
      ),
      child: Container(
        height: Get.size.height * 0.18,
        width: Get.size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 5),
          _buildListGroup(),
        ]),
      ),
    );
  }
}
