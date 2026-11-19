import 'package:flutter/material.dart';
import 'dados.dart';
import 'login.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Violeta Agenda',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: roxo),
        scaffoldBackgroundColor: fundo,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
