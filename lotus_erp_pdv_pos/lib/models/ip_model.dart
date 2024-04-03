import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ip {
  String? numContrato;
  String? ip;

  Ip({
    this.numContrato,
    this.ip,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numContrato': numContrato,
      'ip': ip,
    };
  }

  factory Ip.fromMap(Map<String, dynamic> map) {
    return Ip(
      numContrato:
          map['nocontrato'] != null ? map['nocontrato'] as String : null,
      ip: map['link'] != null ? map['link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ip.fromJson(String source) =>
      Ip.fromMap(json.decode(source) as Map<String, dynamic>);
}
