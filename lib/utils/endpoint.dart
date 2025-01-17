import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'package:hellohit/models/index_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _token;

Future<void> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<void> setToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
  _token = prefs.getString('token');
}

Dio getConexaoPrefs() {
  Dio dio = Dio()
    ..options.baseUrl = DotEnv.env['API_URL']
    // ..options.baseUrl = "http://api.rancher.hellohit.co/"
    ..options.headers['Authorization'] = 'Bearer $_token';
  return dio;
}

class Endpoint {
  static Future getComentariosPost(String id) async => await getConexaoPrefs().get('posts/$id/comments');

  static Future postCadastroUsuario(Cadastro usuario) async => await getConexaoPrefs().post('signup', data: usuario);

  static Future getExistsUsername(String usuario) async => await getConexaoPrefs().get('users/verifyUsername/$usuario');

  static Future getPostId(String id) async => await getConexaoPrefs().get('posts/$id');

  static Future getMessages() async => await getConexaoPrefs().get('users');

  static Future getUsuarios() async => await getConexaoPrefs().get('users');

  static Future getCategoria(String id) async => await getConexaoPrefs().get('categories/$id');

  static Future getUsuariosById(String id) async => await getConexaoPrefs().get('users/$id');

  static Future postComentarioPost(String id, Comentario comentario) async {
    // FormData formData = FormData.fromMap(
    //   {
    //     "text": comentario.text,
    //   },
    // );
    return await getConexaoPrefs().post('posts/$id/comments', data: comentario);
  }

  static Future postProfileUsuario(dynamic usuario) async => await getConexaoPrefs().post('profiles', data: usuario);

  static Future postAutenticacaoUsuario(Autenticacao usuario) async =>
      await getConexaoPrefs().post('login', data: usuario);

  static Future postOportunidade(Oportunidade oportunidade) async =>
      await getConexaoPrefs().post('opportunities', data: oportunidade);

  static Future getCategorias() async => await getConexaoPrefs().get('categories?page=1&limit=1000');

  static Future patchCategoriaUsuario(String id) async =>
      await getConexaoPrefs().patch('profiles/categories/update', data: {
        'categories': [id]
      });

  static Future patchCategoriaTime(String id) async =>
      await getConexaoPrefs().patch('profilesTeam/categories/update', data: {
        'categories': [id]
      });

  static Future getFeed() async => await getConexaoPrefs().get('feed');

  // static Future getPosts() async => await getConexaoPrefs().get('posts');
  static Future getPosts(int page, int limit) async => await getConexaoPrefs().get('posts?page=$page&limit=$limit');

  static Future getPostsBookmark(int page, int limit, String id) async =>
      await getConexaoPrefs().get('users/$id/bookmark?page=$page&limit=$limit');

  static Future getPost(String id) async => await getConexaoPrefs().get('posts/$id');

  static Future getChatsUsers() async => await getConexaoPrefs().get('/chats/user');

  static Future getMessagesByChat(String id) async => await getConexaoPrefs().get('/chats/messages/$id');

  static Future postChatRoom(Map data) async => await getConexaoPrefs().post('/chats/conversation', data: data);

  static Future getTeams() async => await getConexaoPrefs().get('profilesTeam');

  static Future getTimeSearch(Map data) async => await getConexaoPrefs().get('search/', queryParameters: data);

  static Future getTalentoSearch(Map data) async => await getConexaoPrefs().get('search/', queryParameters: data);

  static Future getTimeSearchAdvanced(Map data) async => await getConexaoPrefs().get('search/', queryParameters: data);

  static Future getTalentoSearchAdvanced(Map data) async =>
      await getConexaoPrefs().get('search/', queryParameters: data);

  static Future getProfileTime(String id) async => await getConexaoPrefs().get('profilesTeam/user/$id');

  static Future getPostsUsuario(String id) async => await getConexaoPrefs().get('posts/user/$id');

  static Future getProfileTimeScreen(String id) async => await getConexaoPrefs().get('profilesTeam/$id');

  static Future getAllProfileTime(int page, int limit) async =>
      await getConexaoPrefs().get('profilesTeam?page=$page&limit=$limit');

  static Future patchHitTime(String idUsuario, String idPerfil) async =>
      await getConexaoPrefs().patch('profilesTeam/hit/$idPerfil', data: {'id': idUsuario});

  static Future patchFanUsuario(String idUsuario, String idPerfil) async =>
      await getConexaoPrefs().patch('profiles/fan/$idUsuario');

  static Future patchFanTime(String idUsuario, String idPerfil) async =>
      await getConexaoPrefs().patch('profilesTeam/fan/$idUsuario', data: {'id': idPerfil});

  static Future patchHitUsuario(String idUsuario, String idPerfil) async =>
      await getConexaoPrefs().patch('profiles/hit/$idUsuario');

  static Future patchHitPost(String idPerfil) async => await getConexaoPrefs().patch('posts/hit/$idPerfil');

  static Future patchBookmarkPost(String idPerfil) async => await getConexaoPrefs().patch('posts/bookmark/$idPerfil');

  static Future getProfileUsuario(String id) async => await getConexaoPrefs().get('profiles/user/$id');

  static Future getOportunidadesList() async => await getConexaoPrefs().get('opportunities');

  static Future getOportunidade(String id) async => await getConexaoPrefs().get('opportunities/$id');

  static Future patchHitOportunidade(String id, Map data) async =>
      await getConexaoPrefs().patch('opportunities/hit/$id', data: data);

  static Future putImagem(String image) async {
    FormData formData = FormData.fromMap({"file": await MultipartFile.fromFile(image)});

    return await getConexaoPrefs().put('myuser', data: formData);
  }

  static Future putImagemBannerTime(String image, String id) async {
    FormData formData = FormData.fromMap({"file": await MultipartFile.fromFile(image)});

    return await getConexaoPrefs().put('profilesTeam/banner/$id', data: formData);
  }

  static Future patchProfileUsuario(Profile profile) async =>
      await getConexaoPrefs().patch('profiles/${profile.id}', data: profile);

  static Future patchProfileTime(ProfileTime profile) async =>
      await getConexaoPrefs().patch('profilesTeam/${profile.id}', data: profile);

  static Future getUserById(String id) async => await getConexaoPrefs().get('users/$id');

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

  static Future putHitPosts(String id) async => await getConexaoPrefs().post('posts/$id');

  static Future deletePost(String id) async => await getConexaoPrefs().delete('posts/$id');

  static Future makePayment(String pm, String priceId) async {
    var data = {"price": priceId, "paymentMethodId": pm};
    return await getConexaoPrefs().post('/create-subscription', data: data);
  }

  static Future getProdutos() async => await getConexaoPrefs().get('/list-products');

  static Future postComenetarioPost(Comentario comentario, String idUsuario) async =>
      await getConexaoPrefs().post('posts/$idUsuario/comments', data: comentario);

  //static Future getUsuarios() async => await getConexaoPrefs().get('users');
  //static Future getMessages() async => await getConexaoPrefs().get('messages');
}
