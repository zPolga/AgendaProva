import 'package:flutter/material.dart';
import 'package:prova_agenda/contatos_repository.dart';
import 'package:prova_agenda/entidades/contatoEnt.dart';
import 'package:prova_agenda/contato.dart';

class ListagemEnt extends StatelessWidget {
  final ContatosRepository contatos;

  ListagemEnt({required this.contatos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Contatos'),
      ),
      body: FutureBuilder<List<contato>>(
        future: contatos.getContatos(), // Ajuste o método se necessário
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar contatos'));
          }
          final contatosList = snapshot.data ?? [];
          return ListView.builder(
            itemCount: contatosList.length,
            itemBuilder: (context, index) {
              final contato = contatosList[index];
              return ListTile(
                title: Text(contato.nome),
                subtitle: Text('${contato.tel} - ${contato.email}'),
              );
            },
          );
        },
      ),
    );
  }
}
