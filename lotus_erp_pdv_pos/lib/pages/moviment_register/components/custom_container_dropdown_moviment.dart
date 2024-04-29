import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/pages/moviment_register/components/custom_dropdown_moviment.dart';
import 'package:lotus_erp_pdv_pos/pages/moviment_register/components/list_moviment_type.dart';

class CustomContainerDropdownMoviment extends StatelessWidget {
  const CustomContainerDropdownMoviment({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: Get.size.width * 0.36,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: 30,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: const Icon(
                        Icons.attach_money_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  CustomDropdownMoviment(
                    options: ListMovimentType().movimentType,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            color: Colors.white,
            child: const Text(
              'Tipo mov...',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ),
        )
      ],
    );
  }
}
