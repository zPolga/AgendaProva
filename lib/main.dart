import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('username');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda de Contatos',
      home: FutureBuilder(
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return snapshot.data == true ? Principal() : Login();
          }
        },
      ),
    );
  }
}
