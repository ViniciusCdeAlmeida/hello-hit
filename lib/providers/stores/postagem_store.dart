import 'dart:io';

import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/postagem_controller.dart';
import 'package:mobx/mobx.dart';

import 'package:hellohit/models/cadastro_model.dart';
import 'package:hellohit/models/feed_model.dart';
import 'package:hellohit/providers/cadastro_controller.dart';

part 'postagem_store.g.dart';

class PostagemStore = _PostagemStore with _$PostagemStore;

enum PostagemState {
  inicial,
  carregando,
  carregado,
}

abstract class _PostagemStore with Store {
  final PostagemController _postagemController;
  _PostagemStore(this._postagemController);

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
}
