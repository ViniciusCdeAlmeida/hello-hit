import 'package:dio/dio.dart';
import 'package:hellohit/models/conversation_model.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class CoversationController {
  Future<List<Conversation>> getFeed() async {
    // try {
    //   Response res = await Endpoint.getPosts();
    //   var post = res.data.map<Conversation>((content) {
    //     var post = Conversation.fromJson(content);
    //     post.user.full_name = content['user']['fullName'];
    //     return post;
    //   }).toList() as List<Post>;
    //   // });
    //   return post;
    // } catch (e) {
    //   throw e;
    // }
  }
}
