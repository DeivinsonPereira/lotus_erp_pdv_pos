// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/controller/open_register_controller.dart';

import '../../../services/dependencies.dart';

class CustomDropdownMoviment extends StatelessWidget {
  final List<String> options;

  const CustomDropdownMoviment({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.openRegisterController();

    return GetBuilder<OpenRegisterController>(builder: (_) {
      return DropdownButtonHideUnderline(
        child: SizedBox(
          width: Get.size.width * 0.25,
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            value: _.valueDropdown.value,
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (newValue) {
              _.updateValueDropdown(newValue!);
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
