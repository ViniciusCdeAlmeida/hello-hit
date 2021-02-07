import 'package:dio/dio.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class ProfileController {
  Future<void> atualizarUsuarioProfile(Profile profile, String image) async {
    try {
      await Endpoint.patchProfileUsuario(profile);
      if (image != null) await Endpoint.putImagem(image);
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizarTimeProfile(ProfileTime profile, String image) async {
    try {
      await Endpoint.patchProfileTime(profile);
      if (image != null) await Endpoint.putImagem(image);
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileTime> getTimeProfile(String id) async {
    try {
      Response res = await Endpoint.getProfileTime(id);
      var temp = ProfileTime.fromJson(res.data);
      temp.user.full_name = res.data['user']['fullName'];

      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<Profile> getUsuarioProfile(String id) async {
    try {
      Response res = await Endpoint.getProfileUsuario(id);
      var temp = Profile.fromJson(res.data);
      temp.user.full_name = res.data['user']['fullName'];
      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileTime> getTimeProfileScreen(String id) async {
    try {
      Response resP = await Endpoint.getProfileTime(id);
      var temp = ProfileTime.fromJson(resP.data);
      temp.user.full_name = resP.data['user']['fullName'];

      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<Profile> getUsuarioProfileScreen(String id) async {
    try {
      Response resP = await Endpoint.getProfileUsuario(id);
      var temp = Profile.fromJson(resP.data);
      temp.user.full_name = resP.data['user']['fullName'];
      // Response resP = await Endpoint.getProfileUsuario(id);
      return temp;
    } catch (e) {
      throw e;
    }
  }
}
