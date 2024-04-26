// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'empresa_valida.g.dart';

@Collection()
class empresa_valida {
  Id id = Isar.autoIncrement;
  String? contrato;
  int? id_cliente;
  String? ip_servidor;
  String? licenca;
  String? cnpj;

  empresa_valida({
    this.contrato,
    this.id_cliente,
    this.ip_servidor,
    this.licenca,
    this.cnpj,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contrato': contrato,
      'id_cliente': id_cliente,
      'ip_servidor': ip_servidor,
      'licenca': licenca,
      'cnpj': cnpj,
    };
  }

  factory empresa_valida.fromMap(Map<String, dynamic> map) {
    return empresa_valida(
      contrato: map['contrato'] != null ? map['contrato'] as String : null,
      id_cliente: map['id'] != null ? map['id'] as int : null,
      ip_servidor: map['ip_servidor'] != null ? map['ip_servidor'] as String : null,
      licenca: map['licenca'] != null ? map['licenca'] as String : null,
      cnpj: map['cnpj'] != null ? map['cnpj'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory empresa_valida.fromJson(String source) => empresa_valida.fromMap(json.decode(source) as Map<String, dynamic>);
}
