import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../contato.dart';

class ApiDB {
  static final ApiDB _instance = ApiDB._internal();
  factory ApiDB() => _instance;
  static Database? _database;

  ApiDB._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'contatos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE contatos(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, telefone TEXT, email TEXT)',
        );
      },
    );
  }

  Future<void> insertContato(Contato contato) async {
    final db = await database;
    await db.insert(
      'contatos',
      contato.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Contato>> getContatos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('contatos');
    return List.generate(maps.length, (i) {
      return Contato.fromMap(maps[i]);
    });
  }

  Future<void> updateContato(Contato contato) async {
    final db = await database;
    await db.update(
      'contatos',
      contato.toMap(),
      where: 'id = ?',
      whereArgs: [contato.id],
    );
  }

  Future<void> deleteContato(int id) async {
    final db = await database;
    await db.delete(
      'contatos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
