// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'caixa_fechamento.g.dart';

@Collection()
class caixa_fechamento {
  Id id = Isar.autoIncrement;
   int id_caixa;
   int id_tipo_recebimento;
   double? valor_informado;
  
  caixa_fechamento({
    required this.id_caixa,
    required this.id_tipo_recebimento,
    this.valor_informado,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_caixa': id_caixa,
      'id_tipo_recebimento': id_tipo_recebimento,
      'valor_informado': valor_informado,
    };
  }

  factory caixa_fechamento.fromMap(Map<String, dynamic> map) {
    return caixa_fechamento(
      id_caixa: map['id_caixa'] as int,
      id_tipo_recebimento: map['id_tipo_recebimento'] as int,
      valor_informado: map['valor_informado'] != null ? map['valor_informado'] is int ? (map['valor_informado'] as int).toDouble() : map['valor_informado'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory caixa_fechamento.fromJson(String source) => caixa_fechamento.fromMap(json.decode(source) as Map<String, dynamic>);
}
