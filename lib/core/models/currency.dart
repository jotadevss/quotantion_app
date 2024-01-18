// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Currency {
  final String code;
  final String name;

  Currency({
    required this.code,
    required this.name,
  });

  @override
  bool operator ==(covariant Currency other) {
    if (identical(this, other)) return true;

    return other.code == code && other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      code: map['code'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) => Currency.fromMap(json.decode(source) as Map<String, dynamic>);
}
