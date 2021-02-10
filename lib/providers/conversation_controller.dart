import 'package:dio/dio.dart';
import 'package:hellohit/models/conversation_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class ConversationController {
  Future<List<Conversation>> getConversationList() async {
    try {
      Response res = await Endpoint.getChatsUsers();
      return res.data
          .map<Conversation>((content) => Conversation.fromJson(content))
          .toList() as List<Conversation>;
    } catch (e) {
      throw e;
    }
  }
}
