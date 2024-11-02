import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:prova_agenda/contatoEnt.dart';

class SecureStorage {
  String geraToken(contatoEnt c) {
    const secret = 'token';

    final jwt = JWT({
      'name': c.nome,
      'email': c.email,

    });

    final token = jwt.sign(SecretKey(secret), algorithm: JWTAlgorithm.HS256);
    return token;
  }

  static bool verifyToken(String token) {
    const secret = 'token';
    try {
      final jwt = JWT.verify(token, SecretKey(secret));
      return jwt.payload != null;
    } on JWTExpiredException {
      print('JWT expired');
    } on JWTException catch (ex) {
      print('JWT error: ${ex.message}');
    }
    return false;
  }
}