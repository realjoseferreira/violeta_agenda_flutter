import 'package:flutter/material.dart';
import 'dados.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String nome = '';
  String ra = '';
  String email = '';
  String senha = '';

  void cadastrar() {
    if (nome.isEmpty || ra.isEmpty || email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos.')),
      );
      return;
    }

    nomeCadastrado = nome;
    raCadastrado = ra;
    emailCadastrado = email;
    senhaCadastrada = senha;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: roxo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: roxo,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.person_add, color: amarelo, size: 48),
                const SizedBox(height: 8),
                const Text('Criar conta',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    filled: true, fillColor: Colors.white,
                    labelText: 'Nome', border: OutlineInputBorder(),
                  ),
                  onChanged: (valor) { nome = valor.trim(); },
                ),
                const SizedBox(height: 13),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true, fillColor: Colors.white,
                    labelText: 'RA', border: OutlineInputBorder(),
                  ),
                  onChanged: (valor) { ra = valor.trim(); },
                ),
                const SizedBox(height: 13),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    filled: true, fillColor: Colors.white,
                    labelText: 'E-mail', border: OutlineInputBorder(),
                  ),
                  onChanged: (valor) { email = valor.trim(); },
                ),
                const SizedBox(height: 13),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true, fillColor: Colors.white,
                    labelText: 'Senha', border: OutlineInputBorder(),
                  ),
                  onChanged: (valor) { senha = valor; },
                ),
                const SizedBox(height: 22),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: roxoEscuro,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: cadastrar,
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
