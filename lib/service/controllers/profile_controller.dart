import 'package:dio/dio.dart';
import 'dart:async';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class ProfileController {
  int paginaTimeAtual = 0, paginaTimeInicial = 1, paginaTimeTotal;
  Future<void> atualizarUsuarioProfile(Profile profile, String image) async {
    try {
      await Endpoint.patchProfileUsuario(profile).timeout(Duration(seconds: 40));
      if (image != null) await Endpoint.putImagem(image);
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizarTimeProfile(ProfileTime profile, String image, String imageBanner) async {
    try {
      await Endpoint.patchProfileTime(profile);
      if (image != null) await Endpoint.putImagem(image);
      // if (imageBanner != null)
      //   await Endpoint.putImagemBannerTime(imageBanner, profile.id);
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileTime> getTimeProfileEdit(String id) async {
    try {
      Response resProfile = await Endpoint.getProfileTime(id);
      var temp = ProfileTime.fromJson(resProfile.data);
      temp.openOpportunities ??= [];
      temp.fansProfile = [];
      temp.membersProfile = [];

      temp.category = await _getCategoria(temp.categories.first);

      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileTime> getTimeProfile(String id) async {
    try {
      Response res = await Endpoint.getProfileTime(id);
      var temp = ProfileTime.fromJson(res.data);
      temp.openOpportunities ??= [];
      temp.fansProfile = [];
      temp.membersProfile = [];
      temp.posts = await _getUsuarioPosts(temp.user.id);
      if (temp.categories.isNotEmpty)
        temp.category = await _getCategoria(temp.categories.first);
      else
        temp.category = Categoria();
      await Future.forEach(
        temp.fans,
        (id) => _getSeguidoresProfile(id).then((value) => temp.fansProfile.add(value)),
      );
      await Future.forEach(
        temp.members,
        (id) => _getSeguidoresProfile(id).then((value) => temp.membersProfile.add(value)),
      );
      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<Categoria> _getCategoria(String id) async {
    try {
      Response resp = await Endpoint.getCategoria(id);
      return Categoria.fromJson(resp.data);
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

  Future<Usuario> _getSeguidoresProfile(String id) async {
    try {
      Response resUser = await Endpoint.getUserById(id);

      return Usuario.fromJson(resUser.data);
    } catch (e) {
      throw e;
    }
  }

  Future<List<ProfileTime>> getAllTimeProfile({bool newSearch}) async {
    try {
      Response res;
      if (paginaTimeAtual == 0 || newSearch) {
        res = await Endpoint.getAllProfileTime(paginaTimeInicial, 10).timeout(Duration(seconds: 40));
        paginaTimeAtual = res.data['currentPage'];
        paginaTimeTotal = res.data['totalPages'];
        paginaTimeAtual = paginaTimeAtual + 1;
      } else if (paginaTimeAtual <= paginaTimeTotal) {
        res = await await Endpoint.getAllProfileTime(paginaTimeAtual, 10).timeout(Duration(seconds: 40));
        paginaTimeTotal = res.data['totalPages'];
        paginaTimeAtual = paginaTimeAtual + 1;
      }
      return res != null
          ? res.data['profiles'].map<ProfileTime>((content) => ProfileTime.fromJson(content)).toList()
              as List<ProfileTime>
          : Future.value();
    } catch (e) {
      throw e;
    }
  }

  Future<Profile> getUsuarioProfileEdit(String id) async {
    try {
      Response res = await Endpoint.getProfileUsuario(id);
      var temp = Profile.fromJson(res.data);
      return temp;
    } catch (e) {
      throw e;
    }
  }

  Future<Profile> getUsuarioProfile(String id) async {
    try {
      Response resP = await Endpoint.getProfileUsuario(id);
      var temp = Profile.fromJson(resP.data);
      temp.posts = await _getUsuarioPosts(temp.user.id);
      temp.category = await _getCategoria(temp.categories.first);
      temp.fansProfile = [];
      await Future.forEach(
        temp.fans,
        (id) => _getSeguidoresProfile(id).then((value) => temp.fansProfile.add(value)),
      );
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
