// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'dart:convert';

import 'package:isar/isar.dart';

part 'produto_grupo.g.dart';

@Collection()
class produto_grupo {
  Id id_grupo;
  String? grupo_descricao;
  int? status;
  String? file_imagem;

  produto_grupo(
    this.id_grupo,
    this.grupo_descricao,
    this.status,
    this.file_imagem,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_grupo': id_grupo,
      'grupo_descricao': grupo_descricao,
      'status': status,
      'file_imagem': file_imagem,
    };
  }

  factory produto_grupo.fromMap(Map<String, dynamic> map) {
    return produto_grupo(
      map['id_grupo'] as int,
      map['grupo_descricao'] != null ? map['grupo_descricao'] as String : null,
      map['status'] != null ? map['status'] as int : null,
      map['file_imagem'] != null ? map['file_imagem'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory produto_grupo.fromJson(String source) => produto_grupo.fromMap(json.decode(source) as Map<String, dynamic>);
}
