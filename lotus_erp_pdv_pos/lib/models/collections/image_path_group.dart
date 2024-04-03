// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'dart:convert';

import 'package:isar/isar.dart';

part 'image_path_group.g.dart';

@Collection()
class image_path_group {

  Id id = Isar.autoIncrement;
  String? path_image;
  String? nome_grupo;
  String? file_image;
   
  image_path_group({
    this.path_image,
    this.nome_grupo,
    this.file_image,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path_image': path_image,
      'nome_grupo': nome_grupo,
      'file_image': file_image,
    };
  }

  factory image_path_group.fromMap(Map<String, dynamic> map) {
    return image_path_group(
      path_image: map['path_image'] != null ? map['path_image'] as String : null,
      nome_grupo: map['nome_grupo'] != null ? map['nome_grupo'] as String : null,
      file_image: map['file_image'] != null ? map['file_image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory image_path_group.fromJson(String source) => image_path_group.fromMap(json.decode(source) as Map<String, dynamic>);
}
