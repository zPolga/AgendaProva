import 'package:flutter/material.dart'; // Importa o material design do Flutter
import 'contatos_repository.dart' // Importa o repositório de contatos

// Tela para cadastrar ou editar um contato
class Cadastro extends StatefulWidget {
  final ContatosRepository contatos; // Repositório de contatos
  final int? index; // Para saber se é edição ou novo contato

  Cadastro({required this.contatos, this.index}); // Construtor da classe

  @override
  State<Cadastro> createState() => _CadastroState(); // Cria o estado
}

// Estado da tela de cadastro
class _CadastroState extends State<Cadastro> {
  final TextEditingController nomeController = TextEditingController(); // Controlador do nome
  final TextEditingController telefoneController = TextEditingController(); // Controlador do telefone
  final TextEditingController emailController = TextEditingController(); // Controlador do e-mail
  final _formKey = GlobalKey<FormState>(); // Chave para o formulário

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      // Se estamos editando, preenche os campos com os dados do contato
      final contato = widget.contatos.getContatos()[widget.index!]; // Pega o contato atual
      nomeController.text = contato.nome; // Preenche o nome
      telefoneController.text = contato.telefone; // Preenche o telefone
      emailController.text = contato.email; // Preenche o e-mail
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null ? 'Cadastrar Contato' : 'Editar Contato'), // Título do app
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaçamento
        child: Form(
          key: _formKey, // Usando a chave do formulário
          child: Column(
            children: [
              TextFormField(
                controller: nomeController, // Controlador do nome
                decoration: InputDecoration(labelText: 'Nome'), // Label do campo
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome é obrigatório'; // Validação do nome
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: telefoneController, // Controlador do telefone
                decoration: InputDecoration(labelText: 'Telefone'), // Label do campo
              ),
              TextFormField(
                controller: emailController, // Controlador do e-mail
                decoration: InputDecoration(labelText: 'E-mail'), // Label do campo
              ),
              SizedBox(height: 20), // Espaço entre os campos e o botão
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) { // Valida o formulário
                    final novoContato = Contato( // Cria um novo contato
                      nome: nomeController.text,
                      telefone: telefoneController.text,
                      email: emailController.text,
                    );
                    if (widget.index != null) {
                      widget.contatos.updateContato(widget.index!, novoContato); // Atualiza contato
                    } else {
                      widget.contatos.addContato(novoContato); // Adiciona novo contato
                    }
                    Navigator.pop(context); // Volta para a tela anterior
                  }
                },
                child: Text('Salvar'), // Texto do botão
              ),
            ],
          ),
        ),
      ),
    );
  }
}