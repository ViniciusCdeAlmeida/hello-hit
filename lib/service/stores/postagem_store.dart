import 'dart:io';

import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';
import 'package:hellohit/service/stores/index_stores.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as syspath;

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

  @observable
  File _postagemImage;

  @observable
  File _postagemImageEdit;

  @computed
  Post get postagem {
    return _postagem;
  }

  @computed
  File get postagemImagemEdit {
    return _postagemImageEdit;
  }

  @computed
  File get postagemImageNew {
    return _postagemImage;
  }

  void postagemImagem(String imagem) {
    _postagem.file = imagem;
  }

  void postagemTexto(String texto) {
    _postagem.text = texto;
  }

  @action
  void postagemInicial(Post postInicial) {
    _postagem = postInicial;
  }

  @action
  void postagemImage(File image) {
    _postagem.file = image.path;
    _postagemImage = image;
  }

  @action
  void postagemImageEdit(File image) {
    _postagem.file = image.path;
    _postagemImageEdit = image;
  }

  @action
  void clean() {
    _postagemImageEdit = null;
    _postagemImage = null;
  }

  @computed
  // ignore: missing_return
  PostagemState get postagemState {
    if ((_postagemFuture == null || _postagemFuture.status == FutureStatus.rejected)) {
      return PostagemState.inicial;
    }

    if (_postagemFuture.status == FutureStatus.pending) {
      return PostagemState.carregando;
    }

    if (_postagemFuture.status == FutureStatus.fulfilled) return PostagemState.carregado;
  }

  @action
  // ignore: missing_return
  Future<Post> fazerPostagem(Post post) async {
    try {
      _postagemFuture = ObservableFuture(
        _postagemController.makePost(post),
      );
      _postagem = await _postagemFuture;
      // .whenComplete(() async {
      //   final String path = syspath.StorageDirectory.pictures.toString();
      //   var fileName = basename(post.file);
      //   await _postagemImage.copy('$path/$fileName');
      // });
    } catch (e) {
      throw e;
    }
  }

  @action
  // ignore: missing_return
  Future<Post> buscaPostagem(String id) async {
    try {
      _postagemFuture = ObservableFuture(
          // ignore: missing_return
          _postagemController.getPost(id)
          // .then((value) async {
          //   _postagemImageEdit = await DefaultCacheManager().getSingleFile(
          //     value.file['url'].toString().replaceAll(RegExp(r'localhost'), '192.168.15.14').toString(),
          //   );
          //   return value;
          // }),
          );
      _postagem = await _postagemFuture;
      _postagem.file = _postagemImageEdit.path;
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

  @action
  Future<void> makeBookmarkPost(String idPerfil) async {
    try {
      await _postagemController.patchBookmarkPost(idPerfil);
    } catch (e) {
      throw e;
    }
  }
}
