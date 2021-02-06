import 'package:dio/dio.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class ProfileController {
  Future<Profile> atualizarUsuarioProfile(Profile profile) async {
    try {
      Response res = await Endpoint.patchProfileUsuario(profile);
      return Profile.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }

  Future<Profile> atualizarTimeProfile(Profile profile) async {
    try {
      Response res = await Endpoint.patchProfileTime(profile);
      await Endpoint.putImagem(profile.avatar);
      return Profile.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }

  Future<Profile> getTimeProfile(String id) async {
    try {
      Response res = await Endpoint.getProfileTime(id);
      return Profile.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }

  Future<Profile> getUsuarioProfile(String id) async {
    try {
      Response res = await Endpoint.getProfileUsuario(id);
      var t = Profile.fromJson(res.data);
      t.user.full_name = res.data['user']['fullName'];
      return t;
    } catch (e) {
      throw e;
    }
  }
}
