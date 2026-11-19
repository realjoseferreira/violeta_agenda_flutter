import 'package:flutter/material.dart';
import 'dados.dart';
import 'cadastro.dart';
import 'calendario.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  void entrar() {
    if (email == emailCadastrado && senha == senhaCadastrada &&
        emailCadastrado.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CalendarioPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Confira o e-mail e a senha.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 42,
                  backgroundColor: amarelo,
                  child: Icon(Icons.event_note, size: 47, color: roxoEscuro),
                ),
                const SizedBox(height: 16),
                const Text(
                  'VIOLETA AGENDA',
                  style: TextStyle(
                    color: roxoEscuro,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 26),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: roxo,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white, fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 22),
                      const Text('E-mail',
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 7),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Digite seu e-mail',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (valor) { email = valor.trim(); },
                      ),
                      const SizedBox(height: 16),
                      const Text('Senha',
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 7),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Digite sua senha',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (valor) { senha = valor; },
                      ),
                      const SizedBox(height: 23),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: roxoEscuro,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: entrar,
                        child: const Text('Entrar'),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CadastroPage(),
                            ),
                          );
                        },
                        child: const Text('Não tem conta? Cadastre-se',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
