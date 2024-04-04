import '../../services/dependencies.dart';

class Endpoints {
  var configController = Dependencies.configController();

  String endpointSearchImageGroup(String file) {
    return '${configController.ipSelected.value}getimagem?categoria=GRU&file=$file&result=JSO';
  }

  String endpointSearchImageProduct(String file) {
    return '${configController.ipSelected.value}getimagem?categoria=PRO&file=$file&result=JSO';
  }

  String endpointSearchImageDIV(String file) {
    return '${configController.ipSelected.value}getimagem?categoria=DIV&file=$file&result=URL';
  }

  String endpointSearchImage(String contract) {
    return "http://siage.vistatecnologia.com.br/cgi-bin/siagenet/contrato_link_externo?pnocontrato=$contract&ptipo=0";
  }

  String endpointSearchUsuario() {
    return '${configController.ipSelected.value}pdvmobget02_usuarios?pidEmpresa=${configController.idCompany.value}';
  }

  String endpointSearchProduct() {
    return '${configController.ipSelected.value}pdvmobget05_produtos?pidEmpresa=${configController.idCompany.value}';
  }

  String endpointSearchGroup() {
    return '${configController.ipSelected.value}pdvmobget03_produtos_grupos?pidEmpresa=${configController.idCompany.value}';
  }

  String endpointSearchTypePayment() {
    return '${configController.ipSelected.value}pdvmobget06_tipos_recebimentos?pidEmpresa=${configController.idCompany.value}';
  }
}
