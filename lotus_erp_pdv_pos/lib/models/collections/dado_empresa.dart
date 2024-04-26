// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'dado_empresa.g.dart';

@Collection()
class dado_empresa {
  Id id = Isar.autoIncrement;
  int? id_empresa;
  int? id_nfce;
  int? num_caixa;
  String? tamanho_impressora;
  String cor_fundo;
  
  dado_empresa({
    this.id_empresa,
    this.id_nfce,
    this.num_caixa,
    this.tamanho_impressora,
    required this.cor_fundo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_empresa': id_empresa,
      'id_nfce': id_nfce,
      'num_caixa': num_caixa,
      'tamanho_impressora': tamanho_impressora,
      'cor_fundo': cor_fundo,
    };
  }

  factory dado_empresa.fromMap(Map<String, dynamic> map) {
    return dado_empresa(
      id_empresa: map['id_empresa'] != null ? map['id_empresa'] as int : null,
      id_nfce: map['id_nfce'] != null ? map['id_nfce'] as int : null,
      num_caixa: map['num_caixa'] != null ? map['num_caixa'] as int : null,
      tamanho_impressora: map['tamanho_impressora'] != null ? map['tamanho_impressora'] as String : null,
      cor_fundo: map['cor_fundo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory dado_empresa.fromJson(String source) => dado_empresa.fromMap(json.decode(source) as Map<String, dynamic>);
}
