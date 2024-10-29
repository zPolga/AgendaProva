import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contatos_repository.dart';
import 'cadastro.dart';
import 'listagem.dart';
import 'login.dart';

class Principal extends StatelessWidget {
  final ContatosRepository contatos = ContatosRepository();

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cadastro(contatos: contatos),
                ),
              );
            },
            child: Text("Cadastrar Contato"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Listagem(contatos: contatos),
                ),
              );
            },
            child: Text("Listar Contatos"),
          ),
        ],
      ),
    );
  }
}
