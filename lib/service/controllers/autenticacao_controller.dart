import 'dart:async';
import 'package:dio/dio.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class AutenticacaoController {
  Future<Usuario> autenticacaoUsuario(Autenticacao usuario) async {
    try {
      Response res = await Endpoint.postAutenticacaoUsuario(usuario)
          .timeout(Duration(seconds: 40));
      var existeCategoria = res.data['profile']['categories'] as List;
      var usuarioRecebido = Usuario.fromJson(res.data);
      usuarioRecebido.fullName = res.data['full_name'];
      usuarioRecebido.avatarImg = res.data['avatar'];
      existeCategoria.length == 0
          ? usuarioRecebido.existeCategoria = false
          : usuarioRecebido.existeCategoria = true;
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

  Future<List<Usuario>> getUsuarios() async {
    try {
      Response res =
          await Endpoint.getUsuarios().timeout(Duration(seconds: 40));
      return res.data
          .map<Usuario>((content) => Usuario.fromJson(content))
          .toList() as List<Usuario>;
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

  Future<List<Conversation>> getConversationList() async {
    try {
      Response res =
          await Endpoint.getChatsUsers().timeout(Duration(seconds: 40));
      return res.data
          .map<Conversation>((content) => Conversation.fromJson(content))
          .toList() as List<Conversation>;
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

  Future<void> patchCategoriaUsuario(String id) async {
    try {
      await Endpoint.patchCategoriaUsuario(id);
    } catch (e) {
      throw e;
    }
  }

  Future<void> patchCategoriaTime(String id) async {
    try {
      await Endpoint.patchCategoriaTime(id);
    } catch (e) {
      throw e;
    }
  }
}
