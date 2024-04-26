import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import '../../../models/collections/empresa_valida.dart';
import '../isar_service.dart';

class GetEmpresaValida {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();

  //busca os dados da tabela empresa_valida
  Future<empresa_valida?> getDadoTabelaEmpresaValida() async {
    final isar = await _isarService.db;

    try {
      var empresa = await isar.empresa_validas.where().findFirst();
      return empresa;
    } catch (e) {
      _logger.e("Erro ao buscar dados da tabela empresa_valida: $e");
      return null;
    }
  }

  
}
