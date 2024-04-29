import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';
import 'package:lotus_erp_pdv_pos/services/datetime_formatter.dart';

import '../../../models/collections/caixa_item.dart';
import '../../../services/dependencies.dart';
import '../../../services/format_numbers.dart';

class InsertCaixaItem {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();
  var configController = Dependencies.configController();
  var openRegisterController = Dependencies.openRegisterController();

  Future<void> insert(bool enviado) async {
    final isar = await _isarService.db;

    try {
      double value = FormatNumbers.formatStringToDouble(
          openRegisterController.movimentController.text);

      caixa_item caixaItem = caixa_item(
          data: DateTime.now(),
          descricao: openRegisterController.descriptionMovimentController.text,
          enviado: enviado ? 1 : 0,
          hora: DatetimeFormatterWidget.formatHour(DateTime.now()),
          id_caixa: configController.caixaSelected!.id_caixa,
          id_tipo_recebimento: 1,
          id_venda: null,
          valor_cre: value,
          valor_deb: 0);

      await isar.writeTxn(() async => await isar.caixa_items.put(caixaItem));
    } catch (e) {
      _logger.e('Falha ao inserir o caixa. $e');
    }
  }
}
