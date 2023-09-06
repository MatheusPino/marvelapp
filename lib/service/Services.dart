import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';

class Services {
  static const String PUBLIC_KEY = "4a2a39e0402d82bbd107f62ff8fd20ad";
  static const String PRIVATE_KEY = "6e5b32f1b0036dd1a119c6b781ed94ef7798ac30";
  static const String URL_SERVICE = "http://gateway.marvel.com/";
  static Dio dio = Dio();

  bool verifyConnection() {
    try {
      bool connectivityManager = true;

      return connectivityManager;
    } on Exception {
      return false;
    }
  }

  String messageError(String code) {
    switch (code) {
      case "401":
        return "hash invalido";
      case "409":
        return "api key invalido";
      case "405":
        return "acao nao pérmitida";
      case "403":
        return "acao proibida";
      case "connect":
        return "nao conectado";
      case "error":
        return "erro de conexao";
      default:
        return "erro desconhecido";
    }
  }

  void getConection() {
    // Configuração do interceptor para adicionar os parâmetros de autenticação em todas as requisições
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
        final hash = generateHash(timestamp, PRIVATE_KEY, PUBLIC_KEY);

        options.queryParameters.addAll({
          'apikey': PUBLIC_KEY,
          'ts': timestamp,
          'hash': hash,
        });

        return handler.next(options);
      },
    ));
  }

  Future<String?> getSeries() async {
    getConection();
    try {
      final response = await dio?.get('${URL_SERVICE}v1/public/series');
      return response?.data.toString();
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }


  String generateHash(String timestamp, String privateKey, String publicKey) {
    final input = '$timestamp$privateKey$publicKey';
    final bytes = utf8.encode(input);
    final digest = md5.convert(bytes);
    return digest.toString();
  }
}
