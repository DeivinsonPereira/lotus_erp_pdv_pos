// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/custom_colors.dart';
import 'constant/custom_text_style.dart';

class CustomHeaderPopup extends StatelessWidget {
  final String text;
  bool? permitClose;

  CustomHeaderPopup({
    Key? key,
    required this.text,
    this.permitClose = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.backSlider,
      height: Get.size.height * 0.08,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    text,
                    style: CustomTextStyles.blackBoldStyle(20),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              permitClose!
                  ? IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
