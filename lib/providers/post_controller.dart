import 'package:dio/dio.dart';
import 'package:hellohit/models/post_model.dart';
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
      await Endpoint.putHitPosts(id, hitAtual);
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
