import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class ComentarioPostController {
  Future<Comentario> comentarioPost(String id, Comentario comentario) async {
    try {
      Response res = await Endpoint.postComentarioPost(id, comentario);
      return Comentario.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Comentario>> getAllComentariosPost(String id) async {
    try {
      Response res = await Endpoint.getComentariosPost(id).timeout(Duration(seconds: 40));
      return res.data.map<Comentario>((content) => Comentario.fromJson(content)).toList() as List<Comentario>;
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
