# Gerenciamento de Turma (Dart)

Sistema de linha de comando (CLI) simples para gerenciar turmas, alunos e atividades, escrito em Dart. Ideal para fins educacionais e como exemplo didático de orientação a objetos em Dart.

---

## Índice

- [Sobre](#sobre)
- [Stack](#stack)
- [Como rodar](#como-rodar)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Testes](#testes)
- [Contribuição](#contribuição)
- [Licença](#licença)
- [Declaração de uso de Inteligência Artificial](#declaração-de-uso-de-inteligência-artificial)
- [Segurança e privacidade](#segurança-e-privacidade)
- [Contato](#contato)

---

## Sobre

Este repositório contém uma aplicação CLI em Dart para cadastrar alunos, lançar notas (provas e trabalhos), listar informações e exportar os dados da turma em JSON. O código é organizado como um exemplo educativo que demonstra conceitos como classes, encapsulamento e polimorfismo.

### Stack
- Linguagem: Dart (100% do código)
- Runtime: Dart VM (CLI)
- Notáveis: nenhum pacote externo obrigatório — o projeto usa apenas Dart puro. Recomenda-se adicionar `package:test` se quiser escrever testes automatizados.

## Como rodar

Pré-requisitos:
- Dart SDK instalado: https://dart.dev/get-dart

Opções:

1) Executar diretamente (recomendado se NÃO houver `pubspec.yaml`):

```bash
# do diretório do projeto
dart run main.dart
```

2) Se você adicionar um `pubspec.yaml` (recomendado para gerenciar dependências e testes):

```bash
dart pub get
dart run main.dart
```

Observações:
- O ponto de entrada atual é `main.dart` na raiz do repositório. Se preferir estrutura padrão de packages, mova `main.dart` para `bin/` e mantenha o código de biblioteca em `lib/`.
- O menu interativo oferece as opções principais (exemplos):
  - 1 - Cadastrar aluno
  - 2 - Lançar nota de prova (peso 2)
  - 3 - Lançar nota de trabalho (peso 1)
  - 4 - Listar todos os alunos
  - 5 - Exibir detalhes de um aluno
  - 6 - Exibir média geral da turma
  - 7 - Exportar turma em JSON
  - 0 - Sair

## Estrutura do projeto

- `main.dart`         — ponto de entrada CLI (menu interativo)
- `aluno.dart`        — modelo Aluno (métodos de média, serialização)
- `turma.dart`        — lógica da Turma (cadastro, listagem, export)
- `nota.dart`         — classe abstrata `nota`
- `notaProva.dart`    — implementação `notaProva` (peso 2)
- `notaTrabalho.dart` — implementação `notaTrabalho` (peso 1)

> Observação: o README anterior mencionava diretórios (`lib/`, `bin/`, `test/`, `example/`) — atualmente o código está no nível raiz. Se desejar reorganizar para um package Dart, mova os arquivos para `lib/`/`bin/` e adicione `pubspec.yaml`.

## Testes

Atualmente não há testes automatizados incluídos neste repositório.

Para adicionar testes:
1. Crie um arquivo `pubspec.yaml` (exemplo abaixo).
2. Adicione `dev_dependencies:
   test: ^1.0.0`
3. Crie a pasta `test/` e escreva testes com `package:test`.
4. Rode:

```bash
dart pub get
dart test
```

Exemplo mínimo de `pubspec.yaml` (adicione este arquivo na raiz se quiser gerenciar dependências):

```yaml
name: gerenciamento_turma_dart
description: Sistema simples de gerenciamento de turmas em Dart (CLI).
version: 0.1.0
environment:
  sdk: ">=2.12.0 <4.0.0"

dependencies: {}

dev_dependencies:
  test: ^1.0.0
```

## Contribuição

Contribuições são bem-vindas. Sugestão de fluxo:

1. Abra uma issue descrevendo a sugestão ou bug.
2. Crie uma branch: `git checkout -b feat/minha-mudanca`.
3. Faça commits pequenos e descritivos.
4. Abra um Pull Request explicando as mudanças.

## Licença

Este projeto declara uso da licença MIT. Se desejar que eu adicione um arquivo `LICENSE` com o texto da MIT, posso gerar para você.

## Declaração de uso de Inteligência Artificial

Partes da documentação podem ter sido escritas ou auxiliadas por ferramentas automatizadas. As decisões de design e a lógica de negócio foram revisadas por humanos. Se algo parecer incorreto, por favor abra uma issue.

## Segurança e privacidade

- Não coloque chaves secretas, senhas ou dados pessoais em commits.
- Use variáveis de ambiente para segredos em integrações/CI.

## Contato

Desenvolvedor: João Pedro
GitHub: https://github.com/Joaopedrolsk

---

Obrigado por conferir o projeto! Contribuições e feedbacks são muito bem-vindos.
