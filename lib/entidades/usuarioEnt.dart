class UsuarioEnt {
  final int? id;
  final String usuario;
  final String senha;

  UsuarioEnt({this.id, required this.usuario, required this.senha});

  static UsuarioEnt fromMap(Map<String, dynamic> map) {
    return UsuarioEnt(
      id: map['id'],
      usuario: map['usuario'],
      senha: map['senha'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuario': usuario,
      'senha': senha,
    };
  }
}
