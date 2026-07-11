// ...existing code...
import 'aluno.dart';
import 'nota.dart';

class Turma {
  final List<Aluno> _alunos = [];

  void cadastrarAluno(String nome) {
    _alunos.add(Aluno(nome));
  }

  void lancarNota(int i, nota n) {
    if (i >= 0 && i < _alunos.length) {
      _alunos[i].notas.add(n);
    }
  }

  void listar() {
    if (_alunos.isEmpty) {
      print('Nenhum aluno cadastrado.');
      return;
    }
    for (var idx = 0; idx < _alunos.length; idx++) {
      final a = _alunos[idx];
      final media = a.notas.isEmpty
          ? 0.0
          : a.notas.map((n) => n.valor).reduce((x, y) => x + y) / a.notas.length;
      print('[$idx] ${a.nome} - média: ${media.toStringAsFixed(2)}');
    }
  }
}
// ...existing code...