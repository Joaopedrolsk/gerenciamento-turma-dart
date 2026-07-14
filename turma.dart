import 'aluno.dart';
import 'nota.dart';

class Turma {
  final String _nome;
  final List<Aluno> _alunos = [];

  Turma(this._nome);

  // Getters
  String get nome => _nome;
  List<Aluno> get alunos => List.unmodifiable(_alunos);
  int get totalAlunos => _alunos.length;

  /// Cadastra um novo aluno na turma
  void cadastrarAluno(String nome) {
    _alunos.add(Aluno(nome));
    print('Aluno "$nome" cadastrado com sucesso.');
  }

  /// Lança uma nota para um aluno específico
  void lancarNota(int idx, nota nota) {
    if (idx < 0 || idx >= _alunos.length) {
      print('Índice inválido.');
      return;
    }
    _alunos[idx].adicionarNota(nota);
  }

  /// Lista todos os alunos e suas médias (simples e ponderada)
  void listar() {
    if (_alunos.isEmpty) {
      print('Nenhum aluno cadastrado.');
      return;
    }

    print('\n╔════════════════════════════════════════════════════════════════╗');
    print('║ Turma: $_nome');
    print('╚════════════════════════════════════════════════════════════════╝\n');

    for (var i = 0; i < _alunos.length; i++) {
      final a = _alunos[i];
      print('[$i] ${a.nome}');
      print('    Média Simples: ${a.mediaSimples().toStringAsFixed(2)}');
      print('    Média Ponderada: ${a.mediaPonderada().toStringAsFixed(2)}');

      if (a.totalNotas > 0) {
        print('    Notas:');
        for (var j = 0; j < a.notas.length; j++) {
          final n = a.notas[j];
          print(
              '      ($j) ${n.tipo} - Valor: ${n.valor}, Peso: ${n.peso}, Descrição: ${n.descricao}');
        }
      } else {
        print('    Nenhuma nota lançada.');
      }
      print('');
    }
  }

  /// Exibe detalhes de um aluno específico
  void exibirAluno(int idx) {
    if (idx < 0 || idx >= _alunos.length) {
      print('Índice inválido.');
      return;
    }

    final aluno = _alunos[idx];
    print('\n╔════════════════════════════════════════════════════════════════╗');
    print('║ ${aluno.nome}');
    print('╚════════════════════════════════════════════════════════════════╝');
    print('Média Simples: ${aluno.mediaSimples().toStringAsFixed(2)}');
    print('Média Ponderada: ${aluno.mediaPonderada().toStringAsFixed(2)}');
    print('Total de Notas: ${aluno.totalNotas}');

    if (aluno.totalNotas > 0) {
      print('\nNotas:');
      for (var i = 0; i < aluno.notas.length; i++) {
        final n = aluno.notas[i];
        print(
            '  ${i + 1}. ${n.tipo} - Valor: ${n.valor}, Peso: ${n.peso}, Descrição: ${n.descricao}');
      }
    }
    print('');
  }

  /// Calcula a média geral da turma (média das médias ponderadas)
  double mediaGeralTurma() {
    if (_alunos.isEmpty) return 0.0;
    final sumMedias = _alunos.fold<double>(
      0.0,
      (s, a) => s + a.mediaPonderada(),
    );
    return sumMedias / _alunos.length;
  }

  /// Serialização para Map
  Map<String, dynamic> toMap() {
    return {
      'nome': _nome,
      'totalAlunos': _alunos.length,
      'mediaGeralTurma': mediaGeralTurma(),
      'alunos': _alunos.map((a) => a.toMap()).toList(),
    };
  }

  /// Serialização para JSON
  String toJson() {
    final alunosJson = _alunos.map((a) => a.toMap()).toList();
    return '''{
      "nome": "$_nome",
      "totalAlunos": ${_alunos.length},
      "mediaGeralTurma": ${mediaGeralTurma().toStringAsFixed(2)},
      "alunos": $alunosJson
    }''';
  }
}
