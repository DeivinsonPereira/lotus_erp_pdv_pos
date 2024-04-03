// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'dart:convert';

import "package:isar/isar.dart";

part 'caixa_item.g.dart';

@Collection()
class caixa_item {

  Id id = Isar.autoIncrement;
  int id_caixa; //id do caixa que vem da tabela Caixa
  String? descricao;
  DateTime data;
  String hora;
  int id_tipo_recebimento;
  double? valor_cre;
  double? valor_deb;
  int? id_venda;
  int enviado;
  
  caixa_item({
    required this.id_caixa,
    this.descricao,
    required this.data,
    required this.hora,
    required this.id_tipo_recebimento,
    this.valor_cre,
    this.valor_deb,
    this.id_venda,
    required this.enviado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_caixa': id_caixa,
      'descricao': descricao,
      'data': data.millisecondsSinceEpoch,
      'hora': hora,
      'id_tipo_recebimento': id_tipo_recebimento,
      'valor_cre': valor_cre,
      'valor_deb': valor_deb,
      'id_venda': id_venda,
      'enviado': enviado,
    };
  }

  factory caixa_item.fromMap(Map<String, dynamic> map) {
    return caixa_item(
      id_caixa: map['id_caixa'] as int,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      data: DateTime.fromMillisecondsSinceEpoch(map['data'] as int),
      hora: map['hora'] as String,
      id_tipo_recebimento: map['id_tipo_recebimento'] as int,
      valor_cre: map['valor_cre'] != null ? map['valor_cre'] is int ? (map['valor_cre'] as int).toDouble() :map['valor_cre'] as double : null,
      valor_deb: map['valor_deb'] != null ? map['valor_deb'] is int ? (map['valor_deb'] as int).toDouble() :map['valor_deb'] as double : null,
      id_venda: map['id_venda'] != null ? map['id_venda'] as int : null,
      enviado: map['enviado'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory caixa_item.fromJson(String source) => caixa_item.fromMap(json.decode(source) as Map<String, dynamic>);
}
