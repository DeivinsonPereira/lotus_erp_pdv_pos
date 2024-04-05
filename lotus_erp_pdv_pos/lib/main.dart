import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'core/app_widget.dart';
//import 'package:device_info_plus/device_info_plus.dart';
import 'models/collections/caixa.dart';
import 'models/collections/caixa_fechamento.dart';
import 'models/collections/caixa_item.dart';
import 'models/collections/dado_empresa.dart';
import 'models/collections/empresa.dart';
import 'models/collections/empresa_valida.dart';
import 'models/collections/image_path_group.dart';
import 'models/collections/image_path_logo.dart';
import 'models/collections/image_path_product.dart';
import 'models/collections/nfce_resultado.dart';
import 'models/collections/produto.dart';
import 'models/collections/produto_grupo.dart';
import 'models/collections/tipo_recebimento.dart';
import 'models/collections/usuario.dart';
import 'models/collections/usuario_logado.dart';
import 'models/collections/venda.dart';
import 'models/collections/venda_item.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // só deixa inicializar o run depois dos comandos async abaixo estiverem rodando.
  final dir = await getApplicationSupportDirectory();
  //abre o banco de dados e as tabelas
  await Isar.open(
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
    inspector: true,
  );
/*
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print('Running on ${androidInfo.model}');
  print('Serial: ${androidInfo.serialNumber}');
  print('Device: ${androidInfo.device}');
  print('Brand: ${androidInfo.brand}');
  print('Display: ${androidInfo.display}');
*/
  runApp(
    const MyApp(),
  );
}
