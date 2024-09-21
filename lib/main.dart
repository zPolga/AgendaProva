import 'package:flutter/material.dart'; // Importa o material design do Flutter
import 'cadastro.dart'; // Importa a tela de cadastro
import 'contatos_repository.dart'; // Importa o repositório de contatos
import 'listagem.dart'; // Importa a tela de listagem

void main() {
  runApp(MyApp()); // Inicia o app
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda de Contatos', // Título do app
      home: Principal(), // Define a tela inicial
    );
  }
}

// Tela principal do app
class Principal extends StatelessWidget {
  final ContatosRepository contatos = ContatosRepository(); // Cria o repositório de contatos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'), // Título da barra superior
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Quando o botão é pressionado, vai para a tela de cadastro
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cadastro(contatos: contatos), // Passa o repositório
                ),
              );
            },
            child: Text("Cadastrar Contato"), // Texto do botão
          ),
          ElevatedButton(
            onPressed: () {
              // Quando o botão é pressionado, vai para a tela de listagem
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Listagem(contatos: contatos), // Passa o repositório
                ),
              );
            },
            child: Text("Listar Contatos"), // Texto do botão
          ),
        ],
      ),
    );
  }
}
