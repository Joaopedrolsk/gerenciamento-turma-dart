import 'nota.dart';

class NotaComum extends nota {
  NotaComum(double valor, String descricao)
      : super(valor, descricao);
      
        @override
        double get peso => throw UnimplementedError();
      
        @override
        String get tipo => throw UnimplementedError();
}