import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/services/custom_containers_dialog_prepared.dart';

class CloseRegisterDialog extends StatelessWidget {
  const CloseRegisterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    //Retorna o corpo do dialog
    Widget _buildBody() {
      return Column(
        children: [
          CustomContainersDialogPrepared().buildLineIdAndUser(),
          CustomContainersDialogPrepared().buildDate(),
        ],
      );
    }

    // Retorna o dialog
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        color: Colors.white,
        height: Get.size.height * 0.7,
        width: Get.size.width * 0.8,
        child: _buildBody(),
      ),
    );
  }
}
