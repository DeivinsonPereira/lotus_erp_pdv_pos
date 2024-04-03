import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PositionContentContainer extends StatelessWidget {
  final Widget widget;
  const PositionContentContainer({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.size.height * 0.27 - 0.4,
      child: Container(
          width: Get.size.width,
          height: Get.size.height * 0.73,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            border: Border.all(width: 0, color: Colors.transparent),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
            ),
          ),
          child: widget),
    );
  }
}
