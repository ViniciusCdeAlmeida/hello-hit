import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

// Future.forEach(post, (element) async {
//   if (element.user != null) {
//     Response res = await Endpoint.getUserById(element.user['_id']);
//     element.user = Post.fromJson(res.data);
//   }
class FeedController {
  int paginaAtual = 0, paginaInicial = 1, paginaTotal;

  // ignore: missing_return
  Future<List<Post>> getFeed({bool newSearch}) async {
    try {
      Response res;
      if (paginaAtual == 0 || newSearch) {
        res = await Endpoint.getPosts(paginaInicial, 4).timeout(Duration(seconds: 40));
        paginaAtual = res.data['currentPage'];
        paginaTotal = res.data['totalPages'];
        paginaAtual = paginaAtual + 1;
      } else if (paginaAtual <= paginaTotal) {
        res = await Endpoint.getPosts(paginaAtual, 4);
        paginaTotal = res.data['totalPages'];
        paginaAtual = paginaAtual + 1;
      }
      return res != null
          ? res.data['posts'].map<Post>((content) => Post.fromJson(content)).toList() as List<Post>
          : Future.value();
    } catch (e) {
      throw e;
    }
  }
}
