import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class PostagemController {
  Future<Post> makePost(Post post) async {
    try {
      Response res = await Endpoint.postPosts(post);
      var idUser = res.data['user'];
      res.data['user'] = {
        'id': idUser,
      };
      return Post.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }

  Future<void> removePost(String id) async {
    try {
      await Endpoint.deletePost(id);
    } catch (e) {
      throw e;
    }
  }

  Future<Post> getPost(String id) async {
    try {
      Response res = await Endpoint.getPost(id);
      return Post.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }

  Future<void> patchHitPost(String idPerfil) async {
    try {
      await Endpoint.patchHitPost(idPerfil);
    } catch (e) {
      throw e;
    }
  }

  Future<void> patchBookmarkPost(String idPerfil) async {
    try {
      await Endpoint.patchBookmarkPost(idPerfil);
    } catch (e) {
      throw e;
    }
  }
}
