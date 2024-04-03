import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/tipo_recebimento.dart';

import '../isar_service.dart';

class InsertTipoRecebimento {
  final Logger _logger = Logger();
  final IsarService _isarService = IsarService();

  Future<bool> insert(
      BuildContext context, List<tipo_recebimento> paymentType) async {
    final isar = await _isarService.db;

    try {
      var i = await isar.tipo_recebimentos.count();

      if (i > 0) {
        await isar.writeTxn(() async => await isar.tipo_recebimentos.clear());
      }

      await isar.writeTxn(
          () async => await isar.tipo_recebimentos.putAll(paymentType));
      return true;
    } catch (e) {
      _logger.e(
          'Não foi possível inseririr os tipos de pagamento no banco de dados. $e');
      return false;
    }
  }
}
