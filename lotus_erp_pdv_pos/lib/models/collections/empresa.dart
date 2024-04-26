// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'dart:convert';

import 'package:isar/isar.dart';

part 'empresa.g.dart';

@Collection()
class empresa {
  Id id;
  String? name;
  String? fantasia;
  String? cnpj;
  String? fone1;
  String? cep;
  String? endereco;
  String? enderecoNumero;
  String? bairro;
  String? complemento;
  String? idMunicipio;
  String? municipio;
  String? email;
  int? status;
  String? logo_padrao;
  String? logo_branca;
  
  empresa({
    required this.id,
    this.name,
    this.fantasia,
    this.cnpj,
    this.fone1,
    this.cep,
    this.endereco,
    this.enderecoNumero,
    this.bairro,
    this.complemento,
    this.idMunicipio,
    this.municipio,
    this.email,
    this.status,
    this.logo_padrao,
    this.logo_branca,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'fantasia': fantasia,
      'cnpj': cnpj,
      'fone1': fone1,
      'cep': cep,
      'endereco': endereco,
      'enderecoNumero': enderecoNumero,
      'bairro': bairro,
      'complemento': complemento,
      'idMunicipio': idMunicipio,
      'municipio': municipio,
      'email': email,
      'status': status,
      'logo_padrao': logo_padrao,
      'logo_branca': logo_branca,
    };
  }

  factory empresa.fromMap(Map<String, dynamic> map) {
    return empresa(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      fantasia: map['fantasia'] != null ? map['fantasia'] as String : null,
      cnpj: map['cnpj'] != null ? map['cnpj'] as String : null,
      fone1: map['fone1'] != null ? map['fone1'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      endereco: map['endereco'] != null ? map['endereco'] as String : null,
      enderecoNumero: map['enderecoNumero'] != null ? map['enderecoNumero'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      complemento: map['complemento'] != null ? map['complemento'] as String : null,
      idMunicipio: map['idMunicipio'] != null ? map['idMunicipio'] as String : null,
      municipio: map['municipio'] != null ? map['municipio'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
      logo_padrao: map['logo_padrao'] != null ? map['logo_padrao'] as String : null,
      logo_branca: map['logo_branca'] != null ? map['logo_branca'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory empresa.fromJson(String source) => empresa.fromMap(json.decode(source) as Map<String, dynamic>);
}
