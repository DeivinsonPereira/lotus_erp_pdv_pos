// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'nfce_resultado.g.dart';

@Collection()
class nfce_resultado {
  Id id = Isar.autoIncrement;
  int id_caixa;
  int? id_venda;
  String? qr_code;
  String? xml;
  
  nfce_resultado({
    required this.id_caixa,
    this.id_venda,
    this.qr_code,
    this.xml,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_caixa': id_caixa,
      'id_venda': id_venda,
      'qr_code': qr_code,
      'xml': xml,
    };
  }

  factory nfce_resultado.fromMap(Map<String, dynamic> map) {
    return nfce_resultado(
      id_caixa: map['id_caixa'] as int,
      id_venda: map['id_venda'] != null ? map['id_venda'] as int : null,
      qr_code: map['qr_code'] != null ? map['qr_code'] as String : null,
      xml: map['xml'] != null ? map['xml'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory nfce_resultado.fromJson(String source) => nfce_resultado.fromMap(json.decode(source) as Map<String, dynamic>);
}
