import 'package:dio/dio.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/models/search_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class SearchController {
  Future<List<ProfileTime>> getTimeSearch(Search data) async {
    try {
      Response res = await Endpoint.getTimeSearch(data);
      print(res.data);
      return res.data.map<ProfileTime>((content) {
        var post = ProfileTime.fromJson(content);
        return post;
      }).toList() as List<ProfileTime>;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Profile>> getTalentoSearch(Search data) async {
    try {
      Response res = await Endpoint.getTalentoSearch(data);
      print(res.data);
      return res.data.map<Profile>((content) {
        var post = Profile.fromJson(content);
        return post;
      }).toList() as List<Profile>;
    } catch (e) {
      throw e;
    }
  }
}
