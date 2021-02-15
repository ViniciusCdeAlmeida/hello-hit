import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';

part 'comentario_post_store.g.dart';

class ComentarioPostStore = _ComentarioPostStore with _$ComentarioPostStore;

enum ComentarioPostListState {
  inicial,
  carregando,
  carregado,
}

enum ComentarioPostState {
  inicial,
  carregando,
  carregado,
}

abstract class _ComentarioPostStore with Store {
  final ComentarioPostController _comentarioPostController;
  _ComentarioPostStore(this._comentarioPostController);

  @observable
  ObservableList<Comentario> _comentarioObservable =
      ObservableList<Comentario>();

  @observable
  bool req = false;

  @observable
  ObservableFuture<Comentario> _comentarioFuture;

  @observable
  Comentario _comentario;

  @observable
  ObservableList<Comentario> _comentarioItens = ObservableList<Comentario>();

  @observable
  ObservableFuture<List<Comentario>> _comentariosFuture;

  @computed
  Comentario get comentario {
    return _comentario;
  }

  @computed
  List<Comentario> get carreiras {
    return [..._comentarioItens];
  }

  @computed
  List<Comentario> get comentariosOriginal {
    return [..._comentarioObservable];
  }

  /*void postagemImagem(String imagem) {
    _comentario.file = imagem;
  }*/

  void postagemTexto(String texto) {
    _comentario.text = texto;
  }

  void postagemInicial(Comentario comentarioInicial) {
    _comentario = comentarioInicial;
  }

  @computed
  // ignore: missing_return
  ComentarioPostState get comentarioState {
    if ((_comentarioFuture == null ||
        _comentarioFuture.status == FutureStatus.rejected)) {
      return ComentarioPostState.inicial;
    }

    if (_comentarioFuture.status == FutureStatus.pending) {
      return ComentarioPostState.carregando;
    }

    if (_comentarioFuture.status == FutureStatus.fulfilled)
      return ComentarioPostState.carregado;
  }

  @computed
  // ignore: missing_return
  ComentarioPostListState get marketplaceListState {
    if ((_comentarioFuture == null ||
        _comentarioFuture.status == FutureStatus.rejected)) {
      return ComentarioPostListState.inicial;
    }

    if (_comentarioFuture.status == FutureStatus.pending) {
      return ComentarioPostListState.carregando;
    }

    if (_comentarioFuture.status == FutureStatus.fulfilled)
      return ComentarioPostListState.carregado;
  }

  @action
  // ignore: missing_return
  Future<Comentario> fazerComentario(String id, Comentario post) async {
    req = true;
    try {
      _comentarioFuture =
          ObservableFuture(_comentarioPostController.comentarioPost(id, post));

      _comentariosFuture =
          ObservableFuture(_comentarioPostController.getAllComentariosPost(id));

      _comentario = await _comentarioFuture.whenComplete(() => req = false);
    } catch (e) {
      throw e;
    }
  }

  List<Comentario> loadUserComentarios() {
    return [..._comentarioObservable];
  }
}
