abstract class nota {
  double valor;
  String descricao;

  nota(this.valor, this.descricao);

  double get peso;
  String get tipo;

  /// Serialização para Map
  Map<String, dynamic> toMap() {
    return {
      'valor': valor,
      'descricao': descricao,
      'peso': peso,
      'tipo': tipo,
    };
  }

  /// Serialização para JSON
  String toJson() {
    return '{"valor": $valor, "descricao": "$descricao", "peso": $peso, "tipo": "$tipo"}';
  }

  @override
  String toString() => '$tipo - Valor: $valor, Descrição: $descricao, Peso: $peso';
}
