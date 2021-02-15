import 'package:dio/dio.dart';

import 'package:hellohit/models/index_models.dart';

String _token;

void getToken(String token) {
  _token = token;
}

Dio getConexaoPrefs() {
  Dio dio = Dio()
    ..options.baseUrl = "http://192.168.15.4:3000/"
    // ..options.baseUrl = "http://api.rancher.hellohit.co/"
    ..options.headers['Authorization'] = 'Bearer $_token';
  return dio;
}

class Endpoint {
  static Future getComentariosPost(String id) async =>
      await getConexaoPrefs().get('posts/$id/comments');

  static Future postCadastroUsuario(Cadastro usuario) async =>
      await getConexaoPrefs().post('signup', data: usuario);

  static Future getPostId(String id) async {
    await getConexaoPrefs().get('posts/$id');
  }

  static Future getMessages() async => await getConexaoPrefs().get('users');

  static Future getUsuarios() async => await getConexaoPrefs().get('users');

  static Future postComentarioPost(String id, Comentario comentario) async {
    FormData formData = FormData.fromMap(
      {
        "text": comentario.text,
      },
    );
    return await getConexaoPrefs().post('posts/$id/comments', data: comentario);
  }

  static Future postProfileUsuario(dynamic usuario) async =>
      await getConexaoPrefs().post('profiles', data: usuario);

  static Future postAutenticacaoUsuario(Autenticacao usuario) async =>
      await getConexaoPrefs().post('login', data: usuario);

  static Future postOportunidade(Oportunidade oportunidade) async =>
      await getConexaoPrefs().post('opportunities', data: oportunidade);

  static Future getCategorias() async =>
      await getConexaoPrefs().get('categories');

  static Future patchCategoriaUsuario(String id) async {
    await getConexaoPrefs().patch('profiles/categories/update', data: {
      'categories': [id]
    });
  }

  static Future patchCategoriaTime(String id) async {
    await getConexaoPrefs().patch('profilesTeam/categories/update', data: {
      'categories': [id]
    });
  }

  static Future getFeed() async => await getConexaoPrefs().get('feed');

  static Future getPosts() async => await getConexaoPrefs().get('posts');

  static Future getPost(String id) async =>
      await getConexaoPrefs().get('posts/$id');

  static Future getChatsUsers() async =>
      await getConexaoPrefs().get('/chats/user');

  static Future getTeams() async => await getConexaoPrefs().get('profilesTeam');

  static Future getTimeSearch(Search data) async =>
      await getConexaoPrefs().post('search', data: data);

  static Future getTalentoSearch(Search data) async =>
      await getConexaoPrefs().post('search', data: data);

  static Future getProfileTime(String id) async =>
      await getConexaoPrefs().get('profilesTeam/user/$id');

  static Future getPostsUsuario(String id) async =>
      await getConexaoPrefs().get('posts/user/$id');

  static Future getProfileTimeScreen(String id) async =>
      await getConexaoPrefs().get('profilesTeam/$id');

  static Future getAllProfileTime() async =>
      await getConexaoPrefs().get('profilesTeam');

  static Future patchHitTime(String idUsuario, String idPerfil) async =>
      await getConexaoPrefs()
          .patch('profilesTeam/hit/$idPerfil', data: {'id': idUsuario});

  static Future patchFanUsuario(String idUsuario, String idPerfil) async =>
      await getConexaoPrefs().patch('profiles/fan/$idUsuario');

  static Future patchFanTime(String idUsuario, String idPerfil) async =>
      await getConexaoPrefs()
          .patch('profilesTeam/fan/$idUsuario', data: {'id': idPerfil});

  static Future patchHitUsuario(String idUsuario, String idPerfil) async =>
      await getConexaoPrefs().patch('profiles/hit/$idUsuario');

  static Future patchHitPost(String idPerfil) async =>
      await getConexaoPrefs().patch('posts/hit/$idPerfil');

  static Future getProfileUsuario(String id) async =>
      await getConexaoPrefs().get('profiles/user/$id');

  static Future getOportunidadesList() async =>
      await getConexaoPrefs().get('opportunities');

  static Future getOportunidade(String id) async =>
      await getConexaoPrefs().get('opportunities/$id');

  static Future patchHitOportunidade(String id, Map data) async {
    await getConexaoPrefs().patch('opportunities/hit/$id', data: data);
  }

  static Future putImagem(String image) async {
    FormData formData =
        FormData.fromMap({"file": await MultipartFile.fromFile(image)});

    return await getConexaoPrefs().put('myuser', data: formData);
  }

  static Future putImagemBannerTime(String image, String id) async {
    FormData formData =
        FormData.fromMap({"file": await MultipartFile.fromFile(image)});

    return await getConexaoPrefs()
        .put('profilesTeam/banner/$id', data: formData);
  }

  static Future patchProfileUsuario(Profile profile) async =>
      await getConexaoPrefs().patch('profiles/${profile.id}', data: profile);

  static Future patchProfileTime(ProfileTime profile) async =>
      await getConexaoPrefs()
          .patch('profilesTeam/${profile.id}', data: profile);

  static Future getUserById(String id) async =>
      await getConexaoPrefs().get('users/$id');

  static Future postPosts(Post post) async {
    FormData formData = FormData.fromMap({
      "location": post.location,
      "text": post.text,
      "event": post.event,
      // "team": post.team,
      "file": await MultipartFile.fromFile(post.file)
    });

    return await getConexaoPrefs().post('posts', data: formData);
  }

  static Future putHitPosts(String id) async {
    return await getConexaoPrefs().post('posts/$id');
  }

  static Future deletePost(String id) async {
    return await getConexaoPrefs().delete('posts/$id');
  }

  static Future makePayment(String pm, String priceId) async {
    var data = {"price": priceId, "paymentMethodId": pm};
    return await getConexaoPrefs().post('/create-subscription', data: data);
  }

  static Future getProdutos() async =>
      await getConexaoPrefs().get('/list-products');

  static Future postComenetarioPost(
          Comentario comentario, String idUsuario) async =>
      await getConexaoPrefs()
          .post('posts/$idUsuario/comments', data: comentario);

  //static Future getUsuarios() async => await getConexaoPrefs().get('users');
  //static Future getMessages() async => await getConexaoPrefs().get('messages');
}
