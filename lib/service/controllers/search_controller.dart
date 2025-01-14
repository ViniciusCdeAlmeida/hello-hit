import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class SearchController {
  Future<List<ProfileTime>> getTimeSearch(Map data) async {
    try {
      Response res = await Endpoint.getTimeSearch(data);
      return res.data.map<ProfileTime>((content) {
        var post = ProfileTime.fromJson(content);
        return post;
      }).toList() as List<ProfileTime>;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Profile>> getTalentoSearch(Map data) async {
    try {
      Response res = await Endpoint.getTalentoSearch(data);

      return res.data.map<Profile>((content) {
        var post = Profile.fromJson(content);
        return post;
      }).toList() as List<Profile>;
    } catch (e) {
      throw e;
    }
  }
}
