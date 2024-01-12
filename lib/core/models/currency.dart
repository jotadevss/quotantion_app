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
}
