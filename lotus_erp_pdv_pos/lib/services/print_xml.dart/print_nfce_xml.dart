import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../dependencies.dart';

class PrintNfceXml {
  var configController = Dependencies.configController();
  var paymentController = Dependencies.paymentController();

  Logger logger = Logger();

  String? xml;
  String? tamanhoImpressora;

  var platform = const MethodChannel('com.lotuserp_pdv/tef');

  Future<bool> printNfceXml({String? xmlArgs}) async {
    try {
      if (xmlArgs != null) {
        xml = xmlArgs;
      }
      tamanhoImpressora = 'Q4';

      if (xml == null || tamanhoImpressora == null) {
        return false;
      }
      await platform.invokeMethod(
          'imprimirNFCE', {'xml': xml, 'tamanhoImpressora': tamanhoImpressora});
      return true;
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
      return false;
    }
  }
}
