import 'package:flutter/material.dart';
import 'contatos_repository.dart';
import 'cadastro.dart';
import 'contato.dart';

class listagem extends StatefulWidget {
  final ContatosRepository contatos;

  listagem({required this.contatos});

  @override
  _ListagemState createState() => _ListagemState();
}

class _ListagemState extends State<listagem> {
  late Future<List<Contato>> contatos;

  @override
  void initState() {
    super.initState();
    contatos = widget.contatos.getContatos(); // Carrega os contatos ao iniciar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
      ),
      body: FutureBuilder<List<Contato>>(
        future: contatos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            final contatosList = snapshot.data!;
            return ListView.builder(
              itemCount: contatosList.length,
              itemBuilder: (context, index) {
                final c = contatosList[index];
                return ListTile(
                  title: Text(c.nome),
                  subtitle: Text('${c.telefone} - ${c.email}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cadastro(contatos: widget.contatos, index: c.id),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
