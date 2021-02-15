import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class PostController {
  Future<Post> makePost(Post post) async {
    try {
      Response res = await Endpoint.postPosts(post);
      return Post.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }

  Future<void> makeHitPost(String id, int hitAtual) async {
    try {
      await Endpoint.putHitPosts(id);
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
