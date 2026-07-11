// ...existing code...
import 'nota.dart';

class Aluno {
  final String nome;
  final List<nota> notas = [];

  Aluno(this.nome);

  double media() {
    if (notas.isEmpty) return 0.0;
    final sum = notas.fold<double>(0.0, (s, n) => s + n.valor);
    return sum / notas.length;
  }

  @override
  String toString() => '$nome - Média: ${media().toStringAsFixed(2)}';
}

class Turma {
  final List<Aluno> alunos = [];

  void cadastrarAluno(String nome) => alunos.add(Aluno(nome));

  void listar() {
    if (alunos.isEmpty) {
      print('Nenhum aluno cadastrado.');
      return;
    }
    for (var i = 0; i < alunos.length; i++) {
      final a = alunos[i];
      print('[$i] ${a.nome} - Média: ${a.media().toStringAsFixed(2)}');
      for (var j = 0; j < a.notas.length; j++) {
        print('   (${j}) ${a.notas[j]}');
      }
    }
  }

  void lancarNota(int idx, nota nota) {
    if (idx < 0 || idx >= alunos.length) {
      print('Índice inválido.');
      return;
    }
    alunos[idx].notas.add(nota);
  }
}
// ...existing code...