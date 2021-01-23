import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/providers/marketplace_controller.dart';
import 'package:hellohit/providers/post_controller.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

enum PostState {
  inicial,
  carregando,
  carregado,
}

abstract class _PostStore with Store {
  final PostController _postController;
  _PostStore(this._postController);

  @observable
  ObservableList<Post> _postsObservable = ObservableList<Post>();

  @observable
  ObservableFuture<List<Post>> _postFuture;

  @computed
  List<Post> get posts {
    return [..._postsObservable];
  }

  @computed
  // ignore: missing_return
  PostState get marketplaceState {
    if ((_postFuture == null || _postFuture.status == FutureStatus.rejected)) {
      return PostState.inicial;
    }

    if (_postFuture.status == FutureStatus.pending) {
      return PostState.carregando;
    }

    if (_postFuture.status == FutureStatus.fulfilled)
      return PostState.carregado;
  }

  @action
  Future<void> seed() async {
    try {
      _postFuture = ObservableFuture(
        _postController.seed(),
      );
      _postsObservable = (await _postFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }

  List<Post> loadUserPosts(int id) {
    return [
      ..._postsObservable.where((element) => element.idUsuario == id).toList()
    ];
  }
}
