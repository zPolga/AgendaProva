import 'package:flutter/material.dart'; // Importa o material design do Flutter
import 'contato.dart'; // Importa a classe Contato
import 'contatos_repository.dart'; // Importa o repositório de contatos

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
      _loadContato();
    }
  }

  Future<void> _loadContato() async {
    final contatosList = await widget.contatos.getContatos(); // Obtem a lista de contatos
    final contato = contatosList[widget.index!]; // Acessa o contato pelo índice
    nomeController.text = contato.nome; // Preenche o nome
    telefoneController.text = contato.telefone; // Preenche o telefone
    emailController.text = contato.email; // Preenche o e-mail
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.index == null ? 'Cadastrar Contato' : 'Editar Contato'),
        actions: [
          if (widget.index != null) // Mostra botão de deletar se estiver editando
            IconButton(
              icon: Icon(Icons.delete), // Ícone de deletar
              onPressed: () async {
                await widget.contatos.removeContato(widget.index!); // Remove o contato
                Navigator.pop(context); // Volta para a tela anterior
              },
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaçamento
        child: Form(
          key: _formKey, // Usando a chave do formulário
          child: Column(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'), // Label do campo
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome é obrigatório'; // Validação do nome
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'), // Label do campo
              ),
              TextFormField(
                controller: emailController,
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
                      widget.contatos.updateContato(widget.index! as Contato, novoContato); // Atualiza contato
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
