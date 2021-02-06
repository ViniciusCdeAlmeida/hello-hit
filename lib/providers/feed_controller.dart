import 'package:dio/dio.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class FeedController {
  Future<List<Post>> getFeed() async {
    try {
      Response res = await Endpoint.getPosts();
      var post = res.data.map<Post>((content) {
        var post = Post.fromJson(content);
        post.id = content['_id'];
        post.user.full_name = content['user']['fullName'];
        return post;
      }).toList() as List<Post>;
      // Future.forEach(post, (element) async {
      //   if (element.user != null) {
      //     Response res = await Endpoint.getUserById(element.user['_id']);
      //     element.user = Post.fromJson(res.data);
      //   }
      // });
      return post;
    } catch (e) {
      throw e;
    }
  }
}
