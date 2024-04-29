import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/caixa_item.dart';
import 'package:lotus_erp_pdv_pos/services/datetime_formatter.dart';
import 'package:lotus_erp_pdv_pos/services/format_numbers.dart';

import '../../../models/collections/caixa.dart';
import '../../../services/dependencies.dart';
import '../isar_service.dart';

class InsertCaixa {
  final IsarService _isarService = IsarService();
  final Logger _logger = Logger();
  var openRegisterController = Dependencies.openRegisterController();
  var configController = Dependencies.configController();

  Future<void> insertCaixa(caixa caixa) async {
    final isar = await _isarService.db;

    try {
      isar.writeTxn(() async => await isar.caixas.put(caixa));
    } catch (e) {
      _logger.e('Falha ao inserir o caixa. $e');
    }
  }

  Future<void> insertCaixaWithCaixaItem(caixa caixa) async {
    final isar = await _isarService.db;

    try {
      isar.writeTxn(() async => await isar.caixas.put(caixa));

      caixa_item caixaItem = caixa_item(
          id_caixa: caixa.id_caixa,
          descricao: 'ABERTURA DE CAIXA',
          id_venda: null,
          valor_cre: FormatNumbers.formatStringToDouble(
              openRegisterController.openController.text),
          valor_deb: 0,
          data: DateTime.now(),
          hora: DatetimeFormatterWidget.formatHour(DateTime.now()),
          id_tipo_recebimento: 1,
          enviado: openRegisterController.sent);

      isar.writeTxn(() async => await isar.caixa_items.put(caixaItem));

      configController.setCaixaSelected(caixa);
      openRegisterController.toggleIsRegisterOpen(
          true); //TODO => LEMBRAR DE TROCAR PARA FALSE NO FECHAMENTO
    } catch (e) {
      _logger.e('Falha ao inserir o caixa. $e');
    }
  }
}
