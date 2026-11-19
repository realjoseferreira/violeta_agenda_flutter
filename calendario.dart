import 'package:flutter/material.dart';
import 'dados.dart';
import 'tarefas.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  DateTime diaSelecionado = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário'),
        backgroundColor: roxo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bem-vindo, $nomeCadastrado!',
                        style: const TextStyle(color: roxoEscuro,
                            fontSize: 23, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('RA: $raCadastrado',
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: roxo,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 7),
                    const Text('Escolha um dia',
                        style: TextStyle(color: Colors.white,
                            fontSize: 21, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 13),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: CalendarDatePicker(
                        initialDate: diaSelecionado,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2035),
                        onDateChanged: (data) {
                          setState(() { diaSelecionado = data; });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: amarelo,
                        foregroundColor: roxoEscuro,
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TarefasPage(dia: diaSelecionado),
                          ),
                        );
                      },
                      icon: const Icon(Icons.checklist),
                      label: const Text('Ver tarefas do dia'),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
