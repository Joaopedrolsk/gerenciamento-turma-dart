import 'nota.dart';

class Aluno {
  final String _nome;
  final List<nota> _notas = [];

  Aluno(this._nome);

  // Getters
  String get nome => _nome;
  List<nota> get notas => List.unmodifiable(_notas);
  int get totalNotas => _notas.length;

  /// Adiciona uma nota ao aluno
  void adicionarNota(nota n) {
    _notas.add(n);
  }

  /// Calcula a média aritmética simples
  double mediaSimples() {
    if (_notas.isEmpty) return 0.0;
    final sum = _notas.fold<double>(0.0, (s, n) => s + n.valor);
    return sum / _notas.length;
  }

  /// Calcula a média ponderada usando o atributo peso (POLIMORFISMO)
  double mediaPonderada() {
    if (_notas.isEmpty) return 0.0;
    
    // Soma dos valores multiplicados pelos pesos
    final sumPonderada = _notas.fold<double>(
      0.0,
      (s, n) => s + (n.valor * n.peso),
    );
    
    // Soma dos pesos
    final totalPeso = _notas.fold<double>(
      0.0,
      (s, n) => s + n.peso,
    );
    
    return sumPonderada / totalPeso;
  }

  /// Serialização para Map
  Map<String, dynamic> toMap() {
    return {
      'nome': _nome,
      'totalNotas': _notas.length,
      'mediaSimples': mediaSimples(),
      'mediaPonderada': mediaPonderada(),
      'notas': _notas.map((n) => n.toMap()).toList(),
    };
  }

  /// Serialização para JSON
  String toJson() {
    final notasJson = _notas.map((n) => n.toMap()).toList();
    return '''{
      "nome": "$_nome",
      "totalNotas": ${_notas.length},
      "mediaSimples": ${mediaSimples().toStringAsFixed(2)},
      "mediaPonderada": ${mediaPonderada().toStringAsFixed(2)},
      "notas": $notasJson
    }''';
  }

  @override
  String toString() =>
      '$_nome - Média Simples: ${mediaSimples().toStringAsFixed(2)}, Média Ponderada: ${mediaPonderada().toStringAsFixed(2)}';
}
