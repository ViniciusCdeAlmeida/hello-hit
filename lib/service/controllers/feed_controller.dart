import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

// Future.forEach(post, (element) async {
//   if (element.user != null) {
//     Response res = await Endpoint.getUserById(element.user['_id']);
//     element.user = Post.fromJson(res.data);
//   }
class FeedController {
  Future<List<Post>> getFeed() async {
    try {
      Response res = await Endpoint.getPosts();
      return res.data.map<Post>((content) {
        var post = Post.fromJson(content);
        return post;
      }).toList() as List<Post>;
    } catch (e) {
      throw e;
    }
  }
}
