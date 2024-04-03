// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'dart:convert';

import "package:isar/isar.dart";

part 'venda.g.dart';

@Collection()
class venda {
  Id id_venda = Isar.autoIncrement;
  DateTime data;
  String hora;
  int id_empresa;
  int id_usuario;
  int id_colaborador;
  double tot_bruto;
  double tot_desc_prc;
  double tot_desc_vlr;
  double tot_liquido;
  double valor_troco;
  int status;
  int id_serie_nfce;
  int enviado;
  String cpf_cnpj;
  int id_caixa;
  int id_venda_servidor;

  venda({
    required this.data,
    required this.hora,
    required this.id_empresa,
    required this.id_usuario,
    required this.id_colaborador,
    required this.tot_bruto,
    required this.tot_desc_prc,
    required this.tot_desc_vlr,
    required this.tot_liquido,
    required this.valor_troco,
    required this.status,
    required this.id_serie_nfce,
    required this.enviado,
    required this.cpf_cnpj,
    required this.id_caixa,
    required this.id_venda_servidor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.millisecondsSinceEpoch,
      'hora': hora,
      'id_empresa': id_empresa,
      'id_usuario': id_usuario,
      'id_colaborador': id_colaborador,
      'tot_bruto': tot_bruto,
      'tot_desc_prc': tot_desc_prc,
      'tot_desc_vlr': tot_desc_vlr,
      'tot_liquido': tot_liquido,
      'valor_troco': valor_troco,
      'status': status,
      'id_serie_nfce': id_serie_nfce,
      'enviado': enviado,
      'cpf_cnpj': cpf_cnpj,
      'id_caixa': id_caixa,
      'id_venda_servidor': id_venda_servidor,
    };
  }

  factory venda.fromMap(Map<String, dynamic> map) {
    return venda(
      data: DateTime.fromMillisecondsSinceEpoch(map['data'] as int),
      hora: map['hora'] as String,
      id_empresa: map['id_empresa'] as int,
      id_usuario: map['id_usuario'] as int,
      id_colaborador: map['id_colaborador'] as int,
      tot_bruto: map['tot_bruto'] is int ? (map['tot_bruto'] as int).toDouble() : map['tot_bruto'] as double,
      tot_desc_prc: map['tot_desc_prc'] is int ? (map['tot_desc_prc'] as int).toDouble() : map['tot_desc_prc'] as double,
      tot_desc_vlr: map['tot_desc_vlr'] is int ? (map['tot_desc_vlr'] as int).toDouble() : map['tot_desc_vlr'] as double,
      tot_liquido: map['tot_liquido'] is int ? (map['tot_liquido'] as int).toDouble() : map['tot_liquido'] as double,
      valor_troco: map['valor_troco'] is int ? (map['valor_troco'] as int).toDouble() : map['valor_troco'] as double,
      status: map['status'] as int,
      id_serie_nfce: map['id_serie_nfce'] as int,
      enviado: map['enviado'] as int,
      cpf_cnpj: map['cpf_cnpj'] as String,
      id_caixa: map['id_caixa'] as int,
      id_venda_servidor: map['id_venda_servidor'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory venda.fromJson(String source) => venda.fromMap(json.decode(source) as Map<String, dynamic>);
}
