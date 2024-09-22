import 'package:flutter/material.dart'; // Importa o material design do Flutter
import 'contatos_repository.dart'; // Importa o repositório de contatos
import 'cadastro.dart'; // Importa a tela de cadastro
import 'contato.dart'; // Importa a classe Contato

// Tela para listar os contatos
class Listagem extends StatelessWidget {
  final ContatosRepository contatos; // Repositório de contatos

  Listagem({required this.contatos}); // Construtor da classe

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'), // Título da barra superior
      ),
      body: ListView.builder(
        itemCount: contatos.getContatos().length, // Conta quantos contatos tem
        itemBuilder: (context, index) {
          Contato c = contatos.getContatos()[index]; // Pega o contato atual
          return ListTile(
            title: Text(c.nome), // Mostra o nome do contato
            subtitle: Text('${c.telefone} - ${c.email}'), // Mostra telefone e e-mail
            onTap: () {
              // Quando clicar no contato, abre a tela de edição
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cadastro(contatos: contatos, index: index), // Passa o contato para editar
                ),
              );
            },
          );
        },
      ),
    );
  }
}