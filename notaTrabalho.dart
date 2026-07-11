import 'nota.dart';

class notaTrabalho extends nota {
  notaTrabalho(super.valor, super.descricao);

  @override
  double get peso => 1;

  @override
  String get tipo => 'trabalho';
}
