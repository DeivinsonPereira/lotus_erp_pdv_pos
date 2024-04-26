// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/constant/custom_colors.dart';
import '../../common/constant/custom_text_style.dart';
import '../../common/custom_background_container.dart';
import '../../common/custom_button_exit.dart';
import '../../common/custom_elevated_button.dart';
import '../../common/custom_position_content_container.dart';
import '../../common/custom_text_field.dart';
import '../../models/login_model.dart';
import '../../repositories/http/execute_login.dart';
import '../../services/dependencies.dart';
import '../home/home_page.dart';
import 'service/logic/logic_check_valid_login.dart';
import 'widget/button_config_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Dependencies.loginController();
    var configController = Dependencies.configController();
    Dependencies.empresaValidaController();
    Dependencies.passwordController(context);
    configController.updateVariables();

    // Título da página "Login"
    Widget _textTitle() {
      return Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: Get.size.width * 0.1,
              fontWeight: FontWeight.bold,
              color: CustomColors.backSlider),
        ),
      );
    }

    // Botão de confirmação
    Widget _buildButtonConfirm() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          text: 'Entrar',
          color: CustomColors.customContrastColor,
          onPressed: () async {
            var isValid = LogicCheckValidLogin.checkValidLogin(
              context,
              loginController.usernameController.text,
              loginController.passwordController.text,
            );
            if (isValid) {
              Login login = Login(
                login: loginController.usernameController.text,
                password: loginController.passwordController.text,
              );
              bool isLogged = await ExecuteLogin().login(login, context);

              if (isLogged) {
                Get.to(() => const HomePage());
              }
            }
          },
          style: CustomTextStyles.blackBoldStyle(20),
        ),
      );
    }

    // Corpo com chamadas de campos de texto e botões
    Widget _textFields() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.size.height * 0.68,
            child: Column(
              children: [
                _textTitle(),
                SizedBox(height: Get.size.height * 0.03),
                // Campo de texto para o usuário
                CustomTextField(
                  textLabel: 'Usuário',
                  icon: Icons.person_3_outlined,
                  controller: loginController.usernameController,
                ),
                SizedBox(
                  height: Get.size.height * 0.02,
                ),

                // Campo de texto para a senha
                Obx(
                  () => CustomTextField(
                    textLabel: 'Senha',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    isSecret: loginController.isObscure.value,
                    iconSecondary: Icons.lock_open_outlined,
                    controller: loginController.passwordController,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: Get.size.height * 0.01),
                    _buildButtonConfirm(),
                    SizedBox(height: Get.size.height * 0.01),
                    const CustomButtonExit(),
                    SizedBox(height: Get.size.height * 0.025),
                  ],
                ),

                // Botão para acessar a parte de configurações do sistema
                const Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ButtonConfigPage(),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    // Retorno do Scaffold
    return Scaffold(
      backgroundColor: CustomColors.backSlider,
      body: Stack(
        children: [
          //container de fundo
          const CustomBackgroundContainer(),

          // Posicionamento do container com conteúdo
          PositionContentContainer(widget: _textFields()),
        ],
      ),
    );
  }
}
