import 'package:dio/dio.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/utils/endpoint.dart';

class ProfileController {
  Future<void> atualizarUsuarioProfile(Profile profile, String image) async {
    try {
      await Endpoint.patchProfileUsuario(profile)
          .timeout(Duration(seconds: 40));
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
      Response resProfile = await Endpoint.getProfileTime(id);
      var temp = ProfileTime.fromJson(resProfile.data);
      temp.openOpportunities ??= [];

      temp.posts = await _getUsuarioPosts(temp.user.id);
      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Post>> _getUsuarioPosts(String id) async {
    try {
      Response resProfilePosts = await Endpoint.getPostsUsuario(id);

      return resProfilePosts.data.map<Post>((content) {
        var post = Post.fromJson(content);
        return post;
      }).toList() as List<Post>;
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileTime> getTimeProfileScreen(String id) async {
    try {
      Response res = await Endpoint.getProfileTimeScreen(id);
      var temp = ProfileTime.fromJson(res.data[0]);
      temp.openOpportunities ??= [];

      Response resProfilePosts = await Endpoint.getPostsUsuario(temp.id);
      temp.posts = resProfilePosts.data.map<Post>((content) {
        var post = Post.fromJson(content);
        return post;
      }).toList() as List<Post>;
      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<List<ProfileTime>> getAllTimeProfile() async {
    try {
      Response res = await Endpoint.getAllProfileTime();

      return res.data
          .map<ProfileTime>((content) => ProfileTime.fromJson(content))
          .toList() as List<ProfileTime>;
    } catch (e) {
      throw e;
    }
  }

  Future<Profile> getUsuarioProfile(String id) async {
    try {
      Response res = await Endpoint.getProfileUsuario(id);
      var temp = Profile.fromJson(res.data);
      temp.posts = await _getUsuarioPosts(temp.user.id);
      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<Profile> getUsuarioProfileScreen(String id) async {
    try {
      Response resP = await Endpoint.getProfileUsuario(id);
      var temp = Profile.fromJson(resP.data);
      // Response resP = await Endpoint.getProfileUsuario(id);
      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<void> patchHitUsuario(String idUsuario, String idPerfil) async {
    try {
      await Endpoint.patchHitUsuario(idUsuario, idPerfil);
    } catch (e) {
      throw e;
    }
  }

  Future<void> patchHitTime(String idUsuario, String idPerfil) async {
    try {
      await Endpoint.patchHitTime(idUsuario, idPerfil);
    } catch (e) {
      throw e;
    }
  }

  Future<void> patchFanTime(String idUsuario, String idPerfil) async {
    try {
      await Endpoint.patchFanTime(idUsuario, idPerfil);
    } catch (e) {
      throw e;
    }
  }

  Future<void> patchFanUsuario(String idUsuario, String idPerfil) async {
    try {
      await Endpoint.patchFanUsuario(idUsuario, idPerfil);
    } catch (e) {
      throw e;
    }
  }
}
