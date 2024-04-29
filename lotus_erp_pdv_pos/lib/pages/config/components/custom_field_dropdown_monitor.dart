// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/config_controller.dart';
import '../../../services/dependencies.dart';
import '../../../common/custom_dropdown_button.dart';

class CustomFieldDropdown extends StatelessWidget {
  final List<String> options;
  final String text;
  final IconData icon;
  final String value;
  bool? isBalance;
  bool? isTef;
  bool? isSizePrinter;

  CustomFieldDropdown({
    Key? key,
    required this.options,
    required this.text,
    required this.icon,
    required this.value,
    this.isBalance = false,
    this.isTef = false,
    this.isSizePrinter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.configController();

    return GetBuilder<ConfigController>(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.7,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: 52,
                            height: 46,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Icon(
                              icon,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        CustomDropdownButton(
                          options: options,
                          value: value,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.white,
                    child: Text(
                      text,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
