class ContatoEnt {
  final int? id;
  final String nome;
  final String email;
  final String tel;

  ContatoEnt({this.id, required this.nome, required this.email, required this.tel});

  factory ContatoEnt.fromMap(Map<String, dynamic> map) {
    return ContatoEnt(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      tel: map['tel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'tel': tel,
    };
  }

  @override
  String toString() {
    return 'ContatoEnt{id: $id, nome: $nome, email: $email, tel: $tel}';
  }
}
