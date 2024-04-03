// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/config_controller.dart';
import '../../../services/dependencies.dart';
import 'custom_dropdown_button_color.dart';
import 'list_dropdown_option.dart';

class CustomFieldDropdownColor extends StatelessWidget {
  final String text;
  final List<String> options;
  final String value;
  const CustomFieldDropdownColor({
    Key? key,
    required this.text,
    required this.options,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.configController();
    ListDropdownOption().sortListColors();

    // Cronstrói o textLabel do dropdown
    Widget _buildTextLabel() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        color: Colors.white,
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      );
    }

    // Constrói o container de cores
    Widget _buildContainerColor(ConfigController _) {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 8.0),
        child: Container(
          width: 25,
          height: 25,
          color: _.backgroundColor['color'] as Color,
        ),
      );
    }

    // Constrói o corpo do dropdown
    Widget _buildContainer(ConfigController _) {
      return Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              _buildContainerColor(_),
              CustomDropdownButtonColor(
                value: value,
                options: options,
              ),
            ],
          ),
        ),
      );
    }

    return GetBuilder<ConfigController>(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _buildContainer(_),
                Positioned(
                  bottom: 40,
                  left: 10,
                  child: _buildTextLabel(),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}