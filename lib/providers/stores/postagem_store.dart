import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/providers/postagem_controller.dart';
import 'package:hellohit/providers/stores/feed_store.dart';
import 'package:mobx/mobx.dart';

part 'postagem_store.g.dart';

class PostagemStore = _PostagemStore with _$PostagemStore;

enum PostagemState {
  inicial,
  carregando,
  carregado,
}

abstract class _PostagemStore with Store {
  final PostagemController _postagemController;
  final FeedStore _feedStore;
  _PostagemStore(this._postagemController, this._feedStore);

  @observable
  ObservableFuture<Post> _postagemFuture;

  @observable
  Post _postagem;

  @computed
  Post get postagem {
    return _postagem;
  }

  void postagemImagem(String imagem) {
    _postagem.file = imagem;
  }

  void postagemTexto(String texto) {
    _postagem.text = texto;
  }

  void postagemInicial(Post postInicial) {
    _postagem = postInicial;
  }

  @computed
  // ignore: missing_return
  PostagemState get postagemState {
    if ((_postagemFuture == null ||
        _postagemFuture.status == FutureStatus.rejected)) {
      return PostagemState.inicial;
    }

    if (_postagemFuture.status == FutureStatus.pending) {
      return PostagemState.carregando;
    }

    if (_postagemFuture.status == FutureStatus.fulfilled)
      return PostagemState.carregado;
  }

  @action
  // ignore: missing_return
  Future<Post> fazerPostagem(Post post) async {
    try {
      _postagemFuture = ObservableFuture(
        _postagemController.makePost(post),
      );
      _postagem = await _postagemFuture;
    } catch (e) {
      throw e;
    }
  }

  @action
  // ignore: missing_return
  Future<void> removerPostagem(String id) async {
    try {
      await _postagemController.removePost(id);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> makeHitPost(String idPerfil) async {
    try {
      await _postagemController.patchHitPost(idPerfil);
    } catch (e) {
      throw e;
    }
  }
}
