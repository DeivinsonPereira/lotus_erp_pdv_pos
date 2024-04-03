// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'empresa_valida.g.dart';

@Collection()
class empresa_valida {
  Id id = Isar.autoIncrement;
  String nocontrato;
  DateTime? data_limite;
  
  empresa_valida({
    required this.nocontrato,
    this.data_limite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nocontrato': nocontrato,
      'data_limite': data_limite?.millisecondsSinceEpoch,
    };
  }

  factory empresa_valida.fromMap(Map<String, dynamic> map) {
    return empresa_valida(
      nocontrato: map['nocontrato'] as String,
      data_limite: map['data_limite'] != null ? DateTime.fromMillisecondsSinceEpoch(map['data_limite'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory empresa_valida.fromJson(String source) => empresa_valida.fromMap(json.decode(source) as Map<String, dynamic>);
}
