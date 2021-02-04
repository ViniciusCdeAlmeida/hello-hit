import 'package:dio/dio.dart';
import 'package:hellohit/models/autenticacao_model.dart';

class AutenticacaoController {
  Autenticacao ususario;

  // ignore: missing_return
  Future<Autenticacao> autenticacaoUsuario(Autenticacao usuario) async {
    try {
      Dio dio = Dio()..options.baseUrl = "http://192.168.60.2:3000/";

      await dio.post('login', data: usuario);
    } on DioError catch (e) {
      if (e.response != null)
        throw e.response.data['message'];
      else
        throw 'Check your connection.';
    }
  }
}
