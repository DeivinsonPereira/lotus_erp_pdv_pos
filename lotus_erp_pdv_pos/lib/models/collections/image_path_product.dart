// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'dart:convert';

import 'package:isar/isar.dart';

part 'image_path_product.g.dart';

@Collection()
class image_path_product {
  Id id = Isar.autoIncrement;
  int? id_produto;
  int? id_grupo;
  int? favorite;
  String? descricao;
  String? gtin;
  String? path_image;
  String? file_image;
  
  image_path_product({
    this.id_produto,
    this.id_grupo,
    this.favorite,
    this.descricao,
    this.gtin,
    this.path_image,
    this.file_image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_produto': id_produto,
      'id_grupo': id_grupo,
      'favorite': favorite,
      'descricao': descricao,
      'gtin': gtin,
      'path_image': path_image,
      'file_image': file_image,
    };
  }

  factory image_path_product.fromMap(Map<String, dynamic> map) {
    return image_path_product(
      id_produto: map['id_produto'] != null ? map['id_produto'] as int : null,
      id_grupo: map['id_grupo'] != null ? map['id_grupo'] as int : null,
      favorite: map['favorite'] != null ? map['favorite'] as int : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      gtin: map['gtin'] != null ? map['gtin'] as String : null,
      path_image: map['path_image'] != null ? map['path_image'] as String : null,
      file_image: map['file_image'] != null ? map['file_image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory image_path_product.fromJson(String source) => image_path_product.fromMap(json.decode(source) as Map<String, dynamic>);
}
