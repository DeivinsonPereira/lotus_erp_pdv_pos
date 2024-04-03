// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'image_path_logo.g.dart';

@Collection()
class image_path_logo {
  Id id = Isar.autoIncrement;
  String? file_image;
  String? path_image;

  image_path_logo(
    this.file_image,
    this.path_image,
  );

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'file_image': file_image,
      'path_image': path_image,
    };
  }

  factory image_path_logo.fromMap(Map<String, dynamic> map) {
    return image_path_logo(
      map['file_image'] != null ? map['file_image'] as String : null,
      map['path_image'] != null ? map['path_image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory image_path_logo.fromJson(String source) => image_path_logo.fromMap(json.decode(source) as Map<String, dynamic>);
}
