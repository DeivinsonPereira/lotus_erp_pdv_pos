import 'package:flutter/material.dart';
import 'package:lotus_erp_pdv_pos/services/dependencies.dart';
import 'package:lotus_erp_pdv_pos/services/format_txt.dart';

class CustomTextFieldMoviment extends StatelessWidget {
  const CustomTextFieldMoviment({super.key});

  @override
  Widget build(BuildContext context) {
    var openRegisterController = Dependencies.openRegisterController();

    return TextFormField(
      controller: openRegisterController.descriptionMovimentController,
      maxLines: 5,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        hintText: 'Escreva uma mensagem',
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.all(10),
      ),
      inputFormatters: [UpperCaseTxt()],
    );
  }
}
