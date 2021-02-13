import 'package:dio/dio.dart';
import 'package:hellohit/utils/endpoint.dart';

class TimeController {
  Future<List> getTeams() async {
    try {
      Response res = await Endpoint.getPosts();
      print(res.data);
      // });
      // return post;
    } catch (e) {
      throw e;
    }
  }
}
