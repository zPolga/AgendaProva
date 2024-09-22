import 'contato.dart'; // Importa a classe Contato

// Classe que funciona como um repositório de contatos
class ContatosRepository {
  final List<Contato> _contatos = []; // Lista para armazenar os contatos

  // Método para adicionar um novo contato
  void addContato(Contato contato) {
    _contatos.add(contato); // Adiciona o contato na lista
  }

  // Método para atualizar um contato existente
  void updateContato(int index, Contato contato) {
    _contatos[index] = contato; // Atualiza o contato na lista
  }

  // Método para remover um contato
  void removeContato(int index) {
    _contatos.removeAt(index); // Remove o contato da lista
  }

  // Método para obter todos os contatos
  List<Contato> getContatos() {
    return _contatos; // Retorna a lista de contatos
  }
}

