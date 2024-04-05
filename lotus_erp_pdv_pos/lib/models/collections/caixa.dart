// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import "package:isar/isar.dart";

part 'caixa.g.dart';

@Collection()
class caixa {
  Id id_caixa = Isar.autoIncrement;

  int id_empresa;
  int abertura_id_user;
  DateTime abertura_data;
  String abertura_hora;
  double abertura_valor;
  int status;
  int? fechou_id_user;
  DateTime? fechou_data;
  String? fechou_hora;
  int? enviado;
  int? id_caixa_servidor;

  caixa({
    required this.id_empresa,
    required this.abertura_id_user,
    required this.abertura_data,
    required this.abertura_hora,
    required this.abertura_valor,
    required this.status,
    this.fechou_id_user,
    this.fechou_data,
    this.fechou_hora,
    this.enviado,
    this.id_caixa_servidor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_empresa': id_empresa,
      'abertura_id_user': abertura_id_user,
      'abertura_data': abertura_data.millisecondsSinceEpoch,
      'abertura_hora': abertura_hora,
      'abertura_valor': abertura_valor,
      'status': status,
      'fechou_id_user': fechou_id_user,
      'fechou_data': fechou_data?.millisecondsSinceEpoch,
      'fechou_hora': fechou_hora,
      'enviado': enviado,
      'id_caixa_servidor': id_caixa_servidor,
    };
  }

  factory caixa.fromMap(Map<String, dynamic> map) {
    return caixa(
      id_empresa: map['id_empresa'] as int,
      abertura_id_user: map['abertura_id_user'] as int,
      abertura_data:
          DateTime.fromMillisecondsSinceEpoch(map['abertura_data'] as int),
      abertura_hora: map['abertura_hora'] as String,
      abertura_valor: map['abertura_valor'] is int
          ? (map['abertura_valor'] as int).toDouble()
          : map['abertura_valor'] as double,
      status: map['status'] as int,
      fechou_id_user:
          map['fechou_id_user'] != null ? map['fechou_id_user'] as int : null,
      fechou_data: map['fechou_data'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['fechou_data'] as int)
          : null,
      fechou_hora:
          map['fechou_hora'] != null ? map['fechou_hora'] as String : null,
      enviado: map['enviado'] != null ? map['enviado'] as int : null,
      id_caixa_servidor: map['id_caixa_servidor'] != null
          ? map['id_caixa_servidor'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory caixa.fromJson(String source) =>
      caixa.fromMap(json.decode(source) as Map<String, dynamic>);
}
