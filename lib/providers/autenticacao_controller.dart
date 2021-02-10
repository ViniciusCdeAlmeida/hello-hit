import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hellohit/models/autenticacao_model.dart';
import 'package:hellohit/models/categoria_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/utils/endpoint.dart';
// import 'package:hive/hive.dart';

class AutenticacaoController {
  Future<Usuario> autenticacaoUsuario(Autenticacao usuario) async {
    try {
      Response res = await Endpoint.postAutenticacaoUsuario(usuario)
          .timeout(Duration(seconds: 40));
      var usuarioRecebido = Usuario.fromJson(res.data);
      usuarioRecebido.id = res.data['_id'];
      usuarioRecebido.avatarImg = res.data['avatar'];
      getToken(usuarioRecebido.token);
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

  Future<List<Categoria>> getCategorias() async {
    try {
      Response res =
          await Endpoint.getCategorias().timeout(Duration(seconds: 40));
      return res.data
          .map<Categoria>((content) => Categoria.fromJson(content))
          .toList() as List<Categoria>;
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
