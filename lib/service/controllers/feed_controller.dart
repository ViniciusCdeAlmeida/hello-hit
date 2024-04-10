import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class FeedController {
  int paginaAtual = 0,
      paginaInicial = 1,
      paginaTotal,
      paginaBookmarkAtual = 0,
      paginaBookmarkInicial = 1,
      paginaBookmarkTotal;

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

  Future<List<Post>> getFeedBookmark({bool newSearch, String id}) async {
    try {
      Response res;
      if (paginaBookmarkAtual == 0 || newSearch) {
        res = await Endpoint.getPostsBookmark(paginaBookmarkInicial, 1000, id).timeout(Duration(seconds: 40));
        paginaBookmarkAtual = res.data['currentPage'];
        paginaBookmarkTotal = res.data['totalPages'];
        paginaBookmarkAtual = paginaBookmarkAtual + 1;
      } else if (paginaBookmarkAtual <= paginaBookmarkTotal) {
        res = await Endpoint.getPostsBookmark(paginaBookmarkInicial, 1000, id);
        paginaBookmarkTotal = res.data['totalPages'];
        paginaBookmarkAtual = paginaBookmarkAtual + 1;
      }
      return res != null
          ? res.data['posts'].map<Post>((content) => Post.fromJson(content)).toList() as List<Post>
          : Future.value();
    } catch (e) {
      throw e;
    }
  }
}
