// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/common/custom_image_logo.dart';
import 'constant/custom_colors.dart';

class CustomBackgroundContainer extends StatelessWidget {
  const CustomBackgroundContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.transparent),
                color: Colors.white,
              ),
              margin: EdgeInsets.zero,
              width: double.infinity,
              height: Get.size.height * 0.27 - 0.4,
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                margin: EdgeInsets.zero,
                width: Get.size.width,
                height: Get.size.height * 0.27,
                decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.transparent),
                    color: CustomColors.backSlider,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    )),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: Get.size.height * 0.3,
                    width: Get.size.width * 0.7,
                    child: CustomImageLogo().getLogoBranca(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
