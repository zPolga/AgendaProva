class Contato {
  final int? id; // ID do contato
  final String nome; // Nome do contato
  final String telefone; // Telefone do contato
  final String email; // E-mail do contato

  Contato({this.id, required this.nome, required this.telefone, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
    };
  }

  factory Contato.fromMap(Map<String, dynamic> map) {
    return Contato(
      id: map['id'],
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
    );
  }
}
