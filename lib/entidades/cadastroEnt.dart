import 'package:flutter/material.dart';
import 'package:prova_agenda/cadastro.dart';
import 'package:prova_agenda/contatos_repository.dart';

class CadastroEnt extends StatefulWidget {
  final ContatosRepository contatos;

  CadastroEnt({required this.contatos});

  @override
  State<CadastroEnt> createState() => _CadastroState(); // Corrigido aqui
}

class _CadastroState extends State<CadastroEnt> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome é obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final novoContato = contatoEnt(
                      nome: nomeController.text,
                      telefone: telefoneController.text,
                      email: emailController.text,
                    );
                    widget.contatos.addContato(novoContato);
                    Navigator.pop(context);
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  contatoEnt({required String nome, required String telefone, required String email}) {}
}
