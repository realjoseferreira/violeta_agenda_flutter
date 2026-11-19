// Informacoes usadas pelas telas.
// Ficam salvas somente enquanto o app esta aberto.
import 'package:flutter/material.dart';

const roxo = Color(0xFF9524E9);
const roxoEscuro = Color(0xFF4B087B);
const fundo = Color(0xFFF2EAF9);
const amarelo = Color(0xFFFFD45A);

String nomeCadastrado = '';
String raCadastrado = '';
String emailCadastrado = '';
String senhaCadastrada = '';

class Tarefa {
  String nome;
  DateTime data;
  bool concluida;

  Tarefa(this.nome, this.data, this.concluida);
}

List<Tarefa> tarefas = [];
