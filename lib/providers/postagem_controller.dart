import 'package:dio/dio.dart';
import 'package:hellohit/models/post_model.dart';
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

  Future<Post> getAllPosts() async {
    try {
      Response res = await Endpoint.getPosts();
      return Post.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }
}
