import 'nota.dart';

class notaProva extends nota {
  notaProva(super.valor, super.descricao);

  @override
  double get peso => 2;

  @override
  String get tipo => 'Prova';

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'tipo': 'Prova',
    };
  }
}
