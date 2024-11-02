import 'contato.dart';
import 'package:sqflite/sqlite_api.dart';
import 'database/apiDB.dart';

class ContatosRepository {
  final ApiDB _db = ApiDB();

  Future<void> addContato(Contato contato) async {
    await _db.insertContato(contato);
  }

  Future<List<Contato>> getContatos() async {
    return await _db.getContatos();
  }

  Future<void> updateContato(Contato contato, Contato novoContato) async {
    await _db.updateContato(contato);
  }

  Future<void> removeContato(int id) async {
    await _db.deleteContato(id);
  }
}
