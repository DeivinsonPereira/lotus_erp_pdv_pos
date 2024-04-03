import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/collections/caixa.dart';
import '../../models/collections/caixa_fechamento.dart';
import '../../models/collections/caixa_item.dart';
import '../../models/collections/dado_empresa.dart';
import '../../models/collections/empresa.dart';
import '../../models/collections/empresa_valida.dart';
import '../../models/collections/image_path_group.dart';
import '../../models/collections/image_path_logo.dart';
import '../../models/collections/image_path_product.dart';
import '../../models/collections/nfce_resultado.dart';
import '../../models/collections/produto.dart';
import '../../models/collections/produto_grupo.dart';
import '../../models/collections/tipo_recebimento.dart';
import '../../models/collections/usuario.dart';
import '../../models/collections/usuario_logado.dart';
import '../../models/collections/venda.dart';
import '../../models/collections/venda_item.dart';

class IsarService {

   late Future<Isar> db;
  Logger logger = Logger();

  IsarService() {
    db = openDB();
  }


  Future<Isar> openDB() async {
    final dir = await getApplicationSupportDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          Caixa_fechamentoSchema,
          Caixa_itemSchema,
          CaixaSchema,
          Dado_empresaSchema,
          Empresa_validaSchema,
          EmpresaSchema,
          Image_path_groupSchema,
          Image_path_logoSchema,
          Image_path_productSchema,
          Nfce_resultadoSchema,
          Produto_grupoSchema,
          ProdutoSchema,
          Tipo_recebimentoSchema,
          Usuario_logadoSchema,
          UsuarioSchema,
          Venda_itemSchema,
          VendaSchema,
        ],
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}