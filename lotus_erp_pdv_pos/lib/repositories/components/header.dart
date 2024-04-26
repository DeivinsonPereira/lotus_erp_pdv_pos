import '../../services/dependencies.dart';

abstract class Header {
  static var loginController = Dependencies.loginController();

  static Map<String, String> getBasicHeader() {
    return {
      'Content-Type': 'application/json',
      'Authorization':
          'Basic 1acd8d38e940181402f851cc77dcfa42c4c32f246d9c4ea388faea8fb8bf'
    };
  }
/*
  static Map<String, String> getBearerHeader() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginController.bearerToken}'
    };
  }*/
}
