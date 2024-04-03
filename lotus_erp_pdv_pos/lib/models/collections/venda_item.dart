// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'dart:convert';

import "package:isar/isar.dart";

part 'venda_item.g.dart';

@Collection()
class venda_item {

  Id id = Isar.autoIncrement;
  
  int id_venda;
  int id_produto;
  int item;
  double? vlr_vendido;
  double? qtde;
  double? tot_bruto;
  String? grade;

  venda_item({
    required this.id_venda,
    required this.id_produto,
    required this.item,
    this.vlr_vendido,
    this.qtde,
    this.tot_bruto,
    this.grade,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_venda': id_venda,
      'id_produto': id_produto,
      'item': item,
      'vlr_vendido': vlr_vendido,
      'qtde': qtde,
      'tot_bruto': tot_bruto,
      'grade': grade,
    };
  }

  factory venda_item.fromMap(Map<String, dynamic> map) {
    return venda_item(
      id_venda: map['id_venda'] as int,
      id_produto: map['id_produto'] as int,
      item: map['item'] as int,
      vlr_vendido: map['vlr_vendido'] != null ? map['vlr_vendido'] is int ? (map['vlr_vendido'] as int).toDouble() : map['vlr_vendido'] as double : null,
      qtde: map['qtde'] != null ? map['qtde'] is int ? (map['qtde'] as int).toDouble() : map['qtde'] as double : null,
      tot_bruto: map['tot_bruto'] != null ? map['tot_bruto'] is int ? (map['tot_bruto'] as int).toDouble() : map['tot_bruto'] as double : null,
      grade: map['grade'] != null ? map['grade'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory venda_item.fromJson(String source) => venda_item.fromMap(json.decode(source) as Map<String, dynamic>);
}
