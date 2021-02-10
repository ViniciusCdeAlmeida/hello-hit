import 'package:dio/dio.dart';
import 'package:hellohit/models/comentario_model.dart';
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

  Future<Comentario> getAllComentariosPost(String id) async {
    try {
      Response res = await Endpoint.getComentariosPost(id);
      return Comentario.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }
}
