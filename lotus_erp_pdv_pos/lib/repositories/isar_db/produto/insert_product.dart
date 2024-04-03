import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_erp_pdv_pos/models/collections/produto.dart';
import 'package:lotus_erp_pdv_pos/repositories/isar_db/isar_service.dart';

class InsertProduct {

    final Logger _logger = Logger();
  final IsarService _isarService = IsarService();


  Future<void> insert(BuildContext context, List<produto> products) async {
    final isar = await _isarService.db;
    
    try{

      var i = await isar.produtos.count();

      if (i > 0) {
        await isar.writeTxn(() async => 
        await isar.produtos.clear()
        );
      }

      await isar.writeTxn(() async => 
      await isar.produtos.putAll(products)
      );

    } catch (e) {
      _logger.e('Não foi possível inseririr os produtos no banco de dados. $e');
    }
  }
}