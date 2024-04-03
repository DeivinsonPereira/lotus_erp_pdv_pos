import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Login {

  String usuario;
  String senha;
  Login({
    required this.usuario,
    required this.senha,
  });
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'usuario': usuario,
      'senha': senha,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      usuario: map['usuario'] as String,
      senha: map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source) as Map<String, dynamic>);
}
