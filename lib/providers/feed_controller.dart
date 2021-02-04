import 'package:dio/dio.dart';
import 'package:hellohit/models/feed_model.dart';

class FeedController {
  Feed feed;

  Future<Feed> feedList(Feed feed) async {
    try {
      Dio dio = Dio()..options.baseUrl = "http://192.168.60.2:3000/";

      await dio.get('feed');
    } on DioError catch (e) {
      if (e.response != null)
        throw e.response.data['message'];
      else
        throw 'Check your connection.';
    }
  }
}
