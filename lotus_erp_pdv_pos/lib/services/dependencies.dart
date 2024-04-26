import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/controller/empresa_valida_controller.dart';
import 'package:lotus_erp_pdv_pos/controller/password_controller.dart';

import '../controller/bill_controller.dart';
import '../controller/config_controller.dart';
import '../controller/login_controller.dart';
import '../controller/open_register_controller.dart';
import '../controller/payment_controller.dart';
import '../controller/pdv_controller.dart';
import '../controller/weight_controller.dart';

class Dependencies {
  static ConfigController configController() {
    if (Get.isRegistered<ConfigController>()) {
      return Get.find<ConfigController>();
    } else {
      return Get.put(ConfigController(), permanent: true);
    }
  }

  static LoginController loginController() {
    if (Get.isRegistered<LoginController>()) {
      return Get.find<LoginController>();
    } else {
      return Get.put(LoginController());
    }
  }

  static PdvController pdvController() {
    if (Get.isRegistered<PdvController>()) {
      return Get.find<PdvController>();
    } else {
      return Get.put(PdvController());
    }
  }

  static BillController billController() {
    if (Get.isRegistered<BillController>()) {
      return Get.find<BillController>();
    } else {
      return Get.put(BillController());
    }
  }

  static PesageController weightController() {
    if (Get.isRegistered<PesageController>()) {
      return Get.find<PesageController>();
    } else {
      return Get.put(PesageController());
    }
  }

  static PaymentController paymentController() {
    if (Get.isRegistered<PaymentController>()) {
      return Get.find<PaymentController>();
    }else {
      return Get.put(PaymentController()); 
    }
  }

  static OpenRegisterController openRegisterController() {
    if (Get.isRegistered<OpenRegisterController>()) {
      return Get.find<OpenRegisterController>();
    } else {
      return Get.put(OpenRegisterController());
    }
  }

  static EmpresaValidaController empresaValidaController() {
    if (Get.isRegistered<EmpresaValidaController>()) {
      return Get.find<EmpresaValidaController>();
    }else {
      return Get.put(EmpresaValidaController());
    }
  }

  static PasswordController passwordController(BuildContext context) {
    if (Get.isRegistered<PasswordController>()) {
      return Get.find<PasswordController>();
    } else {
      return Get.put(PasswordController(context));
    }
  }

}
