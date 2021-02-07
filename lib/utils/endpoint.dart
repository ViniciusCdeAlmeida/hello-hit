import 'package:dio/dio.dart';
import 'package:hellohit/models/autenticacao_model.dart';
import 'package:hellohit/models/cadastro_model.dart';
import 'package:hellohit/models/comentario_model.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/providers/autenticacao_controller.dart';
import 'package:hive/hive.dart';

String _token;

void getToken(String token) {
  _token = token;
}

Dio getConexaoPrefs() {
  Dio dio = Dio()
    ..options.baseUrl = "http://192.168.15.7:3000/"
    // ..options.baseUrl = "http://3.16.49.191:3000/"
    ..options.headers['Authorization'] = 'Bearer $_token';
  return dio;
}

class Endpoint {
  static Future postCadastroUsuario(Cadastro usuario) async =>
      await getConexaoPrefs().post('signup', data: usuario);

  static Future postProfileUsuario(dynamic usuario) async =>
      await getConexaoPrefs().post('profiles', data: usuario);

  static Future postAutenticacaoUsuario(Autenticacao usuario) async {
    return await getConexaoPrefs().post('login', data: usuario);
  }

  static Future getFeed() async => await getConexaoPrefs().get('feed');

  static Future getPosts() async => await getConexaoPrefs().get('posts');

  static Future getProfileTime(String id) async =>
      await getConexaoPrefs().get('profilesTeam/user/$id');

  static Future getProfileUsuario(String id) async =>
      await getConexaoPrefs().get('profiles/user/$id');

  static Future putImagem(String image) async {
    FormData formData =
        FormData.fromMap({"file": await MultipartFile.fromFile(image)});

    return await getConexaoPrefs().put('myuser', data: formData);
  }

  static Future createSubscription() async {
    final dados = {
      "price": "price_1IGkiwAIZbIeL4kbL4Fe4ASc",
      "paymentMethodId": "pm_1IHTgPAIZbIeL4kbbXNUPmmZ",
      "customerId": "cus_601401ee40648b09944109f5",
    };
    return await getConexaoPrefs().post('create-subscription', data: dados);
  }

  static Future patchProfileUsuario(Profile profile) async {
    final dados = {
      'avatar': profile.avatar,
      'banner': profile.banner,
      'bio': profile.bio,
      'educations': profile.educations,
      'hits': profile.hits,
      'hitsCount': profile.hitsCount,
      '_id': profile.id,
      'jobHistory': profile.jobHistory,
      'location': profile.location,
      'openOpportunities': profile.openOpportunities,
      'PersonalWebsite': profile.personalWebsite,
      'experiences': profile.skills,
      'teams': profile.teams,
      'user': profile.user,
      'workAvailability': profile.workAvailability,
      'skills': [],
      'categories': []
    };
    await getConexaoPrefs().patch('profiles/${profile.id}', data: dados);
  }

  static Future patchProfileTime(ProfileTime profile) async {
    await getConexaoPrefs().patch('profilesTeam/${profile.id}', data: profile);
  }

  static Future getUserById(String id) async =>
      await getConexaoPrefs().get('users/$id');

  static Future postPosts(Post post) async {
    FormData formData = FormData.fromMap({
      "location": post.location,
      "text": post.text,
      "file": await MultipartFile.fromFile(post.file)
    });

    return await getConexaoPrefs().post('posts', data: formData);
  }

  static Future postComenetarioPost(
          Comentario comentario, String idUsuario) async =>
      await getConexaoPrefs()
          .post('posts/$idUsuario/comments', data: comentario);
}
