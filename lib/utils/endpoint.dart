import 'package:dio/dio.dart';
import 'package:hellohit/models/autenticacao_model.dart';
import 'package:hellohit/models/comentario_model.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _token;

Future<void> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _token = prefs.get('tokenUsuario');
}

Dio getConexaoPrefs() {
  Dio dio = Dio()
    ..options.baseUrl = "http://192.168.15.7:3000/"
    ..options.headers['Authorization'] = 'Bearer $_token';
  return dio;
}

class Endpoint {
  static Future postCadastroUsuario(Usuario usuario) async =>
      await getConexaoPrefs().post('signup', data: usuario);

  static Future postAutenticacaoUsuario(Autenticacao usuario) async {
    return await getConexaoPrefs().post('login', data: usuario);
  }

  static Future getFeed() async => await getConexaoPrefs().get('feed');

  static Future getPosts() async => await getConexaoPrefs().get('posts');

  static Future getUserById(String id) async =>
      await getConexaoPrefs().get('users/$id');
  // static Future getPostsFiltro(String nome) async =>
  //     await getConexaoPrefs().get('contatos/filtrar?nome=$nome');

  static Future postPosts(Post post) async =>
      await getConexaoPrefs().post('posts', data: post);

  static Future postComenetarioPost(
          Comentario comentario, String idUsuario) async =>
      await getConexaoPrefs()
          .post('posts/$idUsuario/comments', data: comentario);
}
