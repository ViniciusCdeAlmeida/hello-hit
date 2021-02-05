import 'package:dio/dio.dart';
import 'package:hellohit/models/autenticacao_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/utils/endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutenticacaoController {
  Future<Usuario> autenticacaoUsuario(Autenticacao usuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Response res = await Endpoint.postAutenticacaoUsuario(usuario);
      var usuarioRecebido = Usuario.fromJson(res.data);
      usuarioRecebido.id = res.data['_id'];
      var tokenExistente = prefs.getString('tokenUsuario');
      if (tokenExistente == null) {
        await prefs.setString('tokenUsuario', usuarioRecebido.token);
      }
      getToken();
      return usuarioRecebido;
    } on DioError catch (e) {
      if (e.response != null)
        throw e.response.data['message'];
      else
        throw 'Check your connection.';
    }
  }
}
