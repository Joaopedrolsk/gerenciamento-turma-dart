// ...existing code...
import 'dart:io';
import 'notaComum.dart';
import 'turma.dart';

void main() {
  final agenda = Turma();

  while (true) {
    print('''Escolha uma opção:
 =========================
1 - Cadastrar aluno
2 - Lançar nota
3 - Listar aluno (com média)
0 - Sair
 =========================''');

    final opcao = stdin.readLineSync() ?? '';

    switch (opcao) {
      case '1':
        stdout.write('Nome do aluno: ');
        final nome = stdin.readLineSync() ?? '';
        if (nome.trim().isNotEmpty) {
          agenda.cadastrarAluno(nome.trim());
          print('Aluno cadastrado.');
        } else {
          print('Nome inválido.');
        }
        break;

      case '2':
        agenda.listar();
        stdout.write('Índice do aluno: ');
        final idxStr = stdin.readLineSync() ?? '';
        final idx = int.tryParse(idxStr);
        if (idx == null) {
          print('Índice inválido.');
          break;
        }
        stdout.write('Nota (ex: 8.5): ');
        final notaStr = stdin.readLineSync() ?? '';
        final valor = double.tryParse(notaStr);
        if (valor == null) {
          print('Valor de nota inválido.');
          break;
        }
        stdout.write('Descrição da avaliação: ');
        final desc = stdin.readLineSync() ?? '';
        agenda.lancarNota(idx, NotaComum(valor, desc));
        print('Nota lançada.');
        break;

      case '3':
        agenda.listar();
        break;

      case '0':
        print('Saindo...');
        return;

      default:
        print('Opção inválida.');
    }
  }
}
