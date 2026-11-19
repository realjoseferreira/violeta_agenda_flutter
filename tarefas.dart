import 'package:flutter/material.dart';
import 'dados.dart';

class TarefasPage extends StatefulWidget {
  final DateTime dia;

  const TarefasPage({super.key, required this.dia});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  void adicionarTarefa() {
    String texto = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar tarefa'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Nome da tarefa'),
            onChanged: (valor) { texto = valor; },
          ),
          actions: [
            TextButton(
              onPressed: () { Navigator.pop(context); },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (texto.trim().isNotEmpty) {
                  setState(() {
                    tarefas.add(Tarefa(texto.trim(), widget.dia, false));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Tarefa> tarefasDoDia = [];

    for (Tarefa tarefa in tarefas) {
      if (tarefa.data.day == widget.dia.day &&
          tarefa.data.month == widget.dia.month &&
          tarefa.data.year == widget.dia.year) {
        tarefasDoDia.add(tarefa);
      }
    }

    // Primeiro as pendentes. Dentro de cada grupo, ordem alfabetica.
    tarefasDoDia.sort((a, b) {
      if (a.concluida != b.concluida) {
        if (a.concluida) { return 1; }
        return -1;
      }
      return a.nome.toLowerCase().compareTo(b.nome.toLowerCase());
    });

    String dataTexto = '${widget.dia.day}/${widget.dia.month}/${widget.dia.year}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas tarefas'),
        backgroundColor: roxo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: roxo,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Icon(Icons.fact_check, size: 37, color: amarelo),
                  const SizedBox(height: 5),
                  Text('Dia $dataTexto',
                      style: const TextStyle(color: Colors.white,
                          fontSize: 23, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 7),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.blue, size: 14),
                      SizedBox(width: 8),
                      Text('Tarefa em andamento'),
                    ],
                  ),
                  SizedBox(height: 9),
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 17),
                      SizedBox(width: 5),
                      Text('Tarefa concluída'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: tarefasDoDia.isEmpty
                  ? const Center(child: Text('Nenhuma tarefa neste dia.'))
                  : ListView.builder(
                      itemCount: tarefasDoDia.length,
                      itemBuilder: (context, indice) {
                        Tarefa tarefa = tarefasDoDia[indice];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: Checkbox(
                              value: tarefa.concluida,
                              onChanged: (valor) {
                                setState(() {
                                  tarefa.concluida = valor ?? false;
                                });
                              },
                            ),
                            title: Text(
                              tarefa.nome,
                              style: TextStyle(
                                color: roxoEscuro,
                                decoration: tarefa.concluida
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            subtitle: Text(
                              tarefa.concluida
                                  ? 'Tarefa concluída'
                                  : 'Tarefa em andamento',
                              style: TextStyle(
                                color: tarefa.concluida
                                    ? Colors.green
                                    : Colors.blue,
                                fontSize: 12,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.redAccent),
                              onPressed: () {
                                setState(() { tarefas.remove(tarefa); });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: roxoEscuro,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: adicionarTarefa,
                icon: const Icon(Icons.add),
                label: const Text('Adicionar tarefa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
