import 'package:flutter/material.dart';
import 'package:prova_agenda/principal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'listagem.dart';
import 'contatos_repository.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Função para salvar o nome de usuário como token
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', usernameController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Principal(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Nome de Usuário'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu nome de usuário';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
