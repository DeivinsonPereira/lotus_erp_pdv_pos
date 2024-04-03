// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/config_controller.dart';
import '../../../services/dependencies.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> options;
  final String value;
  final String text;
  bool? isBalance;
  bool? isTef;
  bool? isSizePrinter;

  CustomDropdownButton({
    Key? key,
    required this.options,
    required this.value,
    required this.text,
    this.isBalance = false,
    this.isTef = false,
    this.isSizePrinter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.configController();

    return GetBuilder<ConfigController>(builder: (_) {
      return DropdownButtonHideUnderline(
        child: SizedBox(
          width: Get.size.width * 0.23,
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            value: value,
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (newValue) {
              _.updateSizePrinter(newValue!);
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value),
                        const Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
