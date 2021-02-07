import 'package:dio/dio.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class ProfileController {
  Future<void> atualizarUsuarioProfile(Profile profile, String image) async {
    try {
      await Endpoint.patchProfileUsuario(profile);
      await Endpoint.putImagem(image);
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
      var temp = Profile.fromJson(res.data);
      temp.user.full_name = res.data['user']['fullName'];
      temp.freelance ??= false;
      temp.fullTime ??= false;
      return temp;
    } catch (e) {
      throw e;
    }
  }
}
