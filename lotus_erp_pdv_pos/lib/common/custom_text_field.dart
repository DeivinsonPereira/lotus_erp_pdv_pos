// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import '../controller/login_controller.dart';
import '../services/dependencies.dart';
import '../services/format_txt.dart';
import 'constant/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final String textLabel;
  final IconData icon;
  final TextEditingController controller;
  IconData? iconSecondary;
  bool? isSecret;
  bool? isPassword;
  bool? isConfig;
  bool? isPreffixIcon;
  bool? isNumeric;
  Function()? function;

  CustomTextField({
    Key? key,
    required this.textLabel,
    required this.icon,
    required this.controller,
    this.isSecret = false,
    this.isPassword = false,
    this.iconSecondary = Icons.lock_outline,
    this.isConfig = false,
    this.isPreffixIcon = false,
    this.isNumeric = false,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Dependencies.loginController();

    return TextFormField(
      inputFormatters: [UpperCaseTxt()],
      keyboardType:
          isNumeric == true ? TextInputType.number : TextInputType.text,
      controller: controller,
      obscureText: isPassword! ? isSecret! : false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: CustomColors.backSlider, width: 2)),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: CustomColors.backSlider, width: 2),
        ),
        label: Text(textLabel),
        prefixIcon: isConfig! || isPreffixIcon!
            ? IconButton(
                onPressed: function,
                icon: Icon(
                  icon,
                  color: Colors.black,
                ))
            : null,
        suffixIcon: !isConfig! && !isPreffixIcon!
            ? (isPassword!
                ? IconButton(
                    onPressed: () => loginController.toggleObscure(),
                    icon: loginController.isObscure.value
                        ? Icon(icon)
                        : Icon(iconSecondary),
                    color: CustomColors.customContrastColor,
                  )
                : Icon(
                    icon,
                    color: CustomColors.customContrastColor,
                  ))
            : null,
      ),
    );
  }
}
