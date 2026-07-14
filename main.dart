import 'dart:io';
import 'notaProva.dart';
import 'notaTrabalho.dart';
import 'turma.dart';

void main() {
  final turma = Turma('Turma A - 2024');

  while (true) {
    print('''
╔════════════════════════════════════════════════════════════════════════════════════╗
║         SISTEMA DE GERENCIAMENTO DE TURMA - DART             ║
║                                                                ║
║ 1 - Cadastrar aluno                                           ║
║ 2 - Lançar nota de prova (peso 2)                             ║
║ 3 - Lançar nota de trabalho (peso 1)                          ║
║ 4 - Listar todos os alunos                                    ║
║ 5 - Exibir detalhes de um aluno                               ║
║ 6 - Exibir média geral da turma                               ║
║ 7 - Exportar turma em JSON                                    ║
║ 0 - Sair                                                       ║
╚════════════════════════════════════════════════════════════════════════════════════╝
''');

    final opcao = stdin.readLineSync() ?? '';

    switch (opcao) {
      case '1':
        stdout.write('\nNome do aluno: ');
        final nome = stdin.readLineSync() ?? '';
        if (nome.trim().isNotEmpty) {
          turma.cadastrarAluno(nome.trim());
        } else {
          print('❌ Nome inválido.');
        }
        break;

      case '2':
        _lancarNotaProva(turma);
        break;

      case '3':
        _lancarNotaTrabalho(turma);
        break;

      case '4':
        turma.listar();
        break;

      case '5':
        _exibirDetalhesAluno(turma);
        break;

      case '6':
        print(
            '\n📊 Média Geral da Turma: ${turma.mediaGeralTurma().toStringAsFixed(2)}\n');
        break;

      case '7':
        _exportarTurmaJSON(turma);
        break;

      case '0':
        print('\n👋 Saindo do sistema...');
        return;

      default:
        print('\n❌ Opção inválida.');
    }
  }
}

void _lancarNotaProva(Turma turma) {
  if (turma.totalAlunos == 0) {
    print('❌ Nenhum aluno cadastrado.');
    return;
  }

  turma.listar();
  stdout.write('\nÍndice do aluno: ');
  final idxStr = stdin.readLineSync() ?? '';
  final idx = int.tryParse(idxStr);

  if (idx == null || idx < 0 || idx >= turma.totalAlunos) {
    print('❌ Índice inválido.');
    return;
  }

  stdout.write('Nota da prova (ex: 8.5): ');
  final notaStr = stdin.readLineSync() ?? '';
  final valor = double.tryParse(notaStr);

  if (valor == null || valor < 0 || valor > 10) {
    print('❌ Valor de nota inválido (deve estar entre 0 e 10).');
    return;
  }

  stdout.write('Descrição da prova: ');
  final desc = stdin.readLineSync() ?? '';

  turma.lancarNota(idx, notaProva(valor, desc.trim()));
  print('✅ Nota de prova lançada com sucesso (peso: 2).\n');
}

void _lancarNotaTrabalho(Turma turma) {
  if (turma.totalAlunos == 0) {
    print('❌ Nenhum aluno cadastrado.');
    return;
  }

  turma.listar();
  stdout.write('\nÍndice do aluno: ');
  final idxStr = stdin.readLineSync() ?? '';
  final idx = int.tryParse(idxStr);

  if (idx == null || idx < 0 || idx >= turma.totalAlunos) {
    print('❌ Índice inválido.');
    return;
  }

  stdout.write('Nota do trabalho (ex: 8.5): ');
  final notaStr = stdin.readLineSync() ?? '';
  final valor = double.tryParse(notaStr);

  if (valor == null || valor < 0 || valor > 10) {
    print('❌ Valor de nota inválido (deve estar entre 0 e 10).');
    return;
  }

  stdout.write('Descrição do trabalho: ');
  final desc = stdin.readLineSync() ?? '';

  turma.lancarNota(idx, notaTrabalho(valor, desc.trim()));
  print('✅ Nota de trabalho lançada com sucesso (peso: 1).\n');
}

void _exibirDetalhesAluno(Turma turma) {
  if (turma.totalAlunos == 0) {
    print('❌ Nenhum aluno cadastrado.');
    return;
  }

  turma.listar();
  stdout.write('\nÍndice do aluno: ');
  final idxStr = stdin.readLineSync() ?? '';
  final idx = int.tryParse(idxStr);

  if (idx == null || idx < 0 || idx >= turma.totalAlunos) {
    print('❌ Índice inválido.');
    return;
  }

  turma.exibirAluno(idx);
}

void _exportarTurmaJSON(Turma turma) {
  final jsonString = turma.toJson();
  print('\n📄 JSON da Turma:');
  print(jsonString);
  print('');

  stdout.write('Deseja salvar em arquivo? (s/n): ');
  final resposta = stdin.readLineSync() ?? '';

  if (resposta.toLowerCase() == 's') {
    stdout.write('Nome do arquivo (sem extensão): ');
    final nomeArquivo = stdin.readLineSync() ?? '';

    if (nomeArquivo.trim().isNotEmpty) {
      try {
        final arquivo = File('${nomeArquivo.trim()}.json');
        arquivo.writeAsStringSync(jsonString);
        print('✅ Arquivo salvo com sucesso: ${arquivo.path}');
      } catch (e) {
        print('❌ Erro ao salvar arquivo: $e');
      }
    } else {
      print('❌ Nome de arquivo inválido.');
    }
  }
  print('');
}
