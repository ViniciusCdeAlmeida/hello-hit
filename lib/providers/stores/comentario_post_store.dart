import 'package:hellohit/models/comentario_model.dart';
import 'package:hellohit/providers/comentario_post_controller.dart';
import 'package:mobx/mobx.dart';

part 'comentario_post_store.g.dart';

class ComentarioPostStore = _ComentarioPostStore with _$ComentarioPostStore;

enum ComentarioPostState {
  inicial,
  carregando,
  carregado,
}

abstract class _ComentarioPostStore with Store {
  final ComentarioPostController _comentarioPostController;
  _ComentarioPostStore(this._comentarioPostController);

  @observable
  ObservableFuture<Comentario> _comentarioFuture;

  @observable
  Comentario _comentario;

  @computed
  Comentario get comentario {
    return _comentario;
  }

  /*void postagemImagem(String imagem) {
    _comentario.file = imagem;
  }*/

  void postagemTexto(String texto) {
    _comentario.body = texto;
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

  @action
  // ignore: missing_return
  Future<Comentario> fazerComentario(String id, Comentario post) async {
    try {
      _comentarioFuture = ObservableFuture(
        _comentarioPostController.comentarioPost(id, post),
      );
      _comentario = await _comentarioFuture;
    } catch (e) {
      throw e;
    }
  }
}
