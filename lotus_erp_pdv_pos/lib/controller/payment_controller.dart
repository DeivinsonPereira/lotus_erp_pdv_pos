import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/models/collections/tipo_recebimento.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/tipo_recebimento/get_tipo_recebimento.dart';

class PaymentController extends GetxController {
  var paymentForms = [].obs;

  late tipo_recebimento paymentSelected;

  var idVenda = 0.obs;
  var xml = ''.obs;
  var qrCode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getPaymentForms();
  }

  // retorna as formas de pagamento
  Future<void> getPaymentForms() async {
    var result = await GetTipoRecebimento().getTipoRecebimento();

    if (result.isNotEmpty) {
      paymentForms.assignAll(result);
    }
  }

  void setPaymentSelected(tipo_recebimento value) {
    paymentSelected = value;
  }

  void updateVariaveisNfce(int idVenda, String qrCode, String xml) {
    this.idVenda.value = idVenda;
    this.qrCode.value = qrCode;
    this.xml.value = xml;
  }

  void updateXmlNfce(String value) {
    xml.value = value;
  }

  void updateQrCodeNfce(String value) {
    qrCode.value = value;
  }

  void setIdVenda(int value) {
    idVenda.value = value;
  }
}
