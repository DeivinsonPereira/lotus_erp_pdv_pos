import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Login {

  String login;
  String password;
  Login({
    required this.login,
    required this.password,
  });
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'password': password,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      login: map['login'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source) as Map<String, dynamic>);
}
