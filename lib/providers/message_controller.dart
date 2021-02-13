import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hellohit/models/message_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class MessageController {
  Future<List<Message>> getMessages() async {
    try {
      Response res =
          await Endpoint.getMessages().timeout(Duration(seconds: 40));
      return res.data
          .map<Message>((content) => Message.fromJson(content))
          .toList() as List<Message>;
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
