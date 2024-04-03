// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'dart:convert';

import 'package:isar/isar.dart';

part 'usuario.g.dart';

@Collection()
class usuario {
  Id id;
  String? login;
  int? id_colaborador;
  String? senha;
  int? status;
  int? mob_dashboard;
  int? trocar_senha;
  int? administrador;
  int? logar_empresas;
  int? caixa_abrir;
  int? caixa_movimentar;
  int? caixa_gerenciar;
  int? caixa_fechar;
  int? caixa_pdv;
  int? caixa_carga;
  int? caixa_parametros;  

  usuario(
    this.id,
    this.login,
    this.id_colaborador,
    this.senha,
    this.status,
    this.mob_dashboard,
    this.trocar_senha,
    this.administrador,
    this.logar_empresas,
    this.caixa_abrir,
    this.caixa_movimentar,
    this.caixa_gerenciar,
    this.caixa_fechar,
    this.caixa_pdv,
    this.caixa_carga,
    this.caixa_parametros,
  );
 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'login': login,
      'id_colaborador': id_colaborador,
      'senha': senha,
      'status': status,
      'mob_dashboard': mob_dashboard,
      'trocar_senha': trocar_senha,
      'administrador': administrador,
      'logar_empresas': logar_empresas,
      'caixa_abrir': caixa_abrir,
      'caixa_movimentar': caixa_movimentar,
      'caixa_gerenciar': caixa_gerenciar,
      'caixa_fechar': caixa_fechar,
      'caixa_pdv': caixa_pdv,
      'caixa_carga': caixa_carga,
      'caixa_parametros': caixa_parametros,
    };
  }

  factory usuario.fromMap(Map<String, dynamic> map) {
    return usuario(
      map['id'] as int,
      map['login'] != null ? map['login'] as String : null,
      map['id_colaborador'] != null ? map['id_colaborador'] as int : null,
      map['senha'] != null ? map['senha'] as String : null,
      map['status'] != null ? map['status'] as int : null,
      map['mob_dashboard'] != null ? map['mob_dashboard'] as int : null,
      map['trocar_senha'] != null ? map['trocar_senha'] as int : null,
      map['administrador'] != null ? map['administrador'] as int : null,
      map['logar_empresas'] != null ? map['logar_empresas'] as int : null,
      map['caixa_abrir'] != null ? map['caixa_abrir'] as int : null,
      map['caixa_movimentar'] != null ? map['caixa_movimentar'] as int : null,
      map['caixa_gerenciar'] != null ? map['caixa_gerenciar'] as int : null,
      map['caixa_fechar'] != null ? map['caixa_fechar'] as int : null,
      map['caixa_pdv'] != null ? map['caixa_pdv'] as int : null,
      map['caixa_carga'] != null ? map['caixa_carga'] as int : null,
      map['caixa_parametros'] != null ? map['caixa_parametros'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory usuario.fromJson(String source) => usuario.fromMap(json.decode(source) as Map<String, dynamic>);
}
