import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hellohit/models/autenticacao_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/utils/endpoint.dart';
// import 'package:hive/hive.dart';

class AutenticacaoController {
  String _token;
  // Box _tokenBox = Hive.box('tokenBox');
  String get token => _token;
  Future<Usuario> autenticacaoUsuario(Autenticacao usuario) async {
    try {
      Response res = await Endpoint.postAutenticacaoUsuario(usuario)
          .timeout(Duration(seconds: 40));
      var usuarioRecebido = Usuario.fromJson(res.data);
      usuarioRecebido.id = res.data['_id'];
      // if (res.data['avatar'] != null)
      usuarioRecebido.avatarImg = res.data['avatar'];
      //
      // _token = usuarioRecebido.token;
      getToken(usuarioRecebido.token);
      // var tokenExistente = _tokenBox.get('tokenUsuario');
      // if (tokenExistente == null) {
      //   _tokenBox.put('tokenUsuario', usuarioRecebido.token);
      // }
      return usuarioRecebido;
    } on DioError catch (e) {
      if (e.response != null)
        throw e.response.data['message'];
      else
        throw 'Check your connection.';
    } on TimeoutException catch (_) {
      throw 'Check your connection';
    } catch (e) {
      throw e;
    }
  }
}
