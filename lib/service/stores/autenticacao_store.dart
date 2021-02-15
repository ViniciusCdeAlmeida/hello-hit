import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/models/message_model.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';

part 'autenticacao_store.g.dart';

class AutenticacaoStore = _AutenticacaoStore with _$AutenticacaoStore;

enum AutenticacaoState {
  inicial,
  carregando,
  carregado,
}

abstract class _AutenticacaoStore with Store {
  final MessageController _messageController;
  final AutenticacaoController _autenticacaoController;
  _AutenticacaoStore(this._autenticacaoController, this._messageController);

  @observable
  ObservableFuture<Usuario> _autenticacaoFuture;

  @observable
  Usuario _autenticacao;

  @observable
  ObservableFuture<List<Message>> _messageFuture;

  @observable
  ObservableList<Message> _messageObservable = ObservableList<Message>();

  @observable
  ObservableFuture<List<Categoria>> _categoriaFuture;

  @observable
  ObservableList<Categoria> _categoriaObservable = ObservableList<Categoria>();

  @observable
  ObservableFuture<List<Usuario>> _usuarioFuture;

  @observable
  ObservableList<Usuario> _usuarioObservable = ObservableList<Usuario>();

  @observable
  ObservableFuture<List<Conversation>> _conversationFuture;

  @observable
  ObservableList<Conversation> _conversationObservable =
      ObservableList<Conversation>();

  @observable
  bool _autenticando = false;

  @computed
  Usuario get usuarioLogado {
    return _autenticacao;
  }

  @computed
  List<Usuario> get usuarios {
    return [..._usuarioObservable];
  }

  @computed
  List<Categoria> get categorias {
    return [..._categoriaObservable];
  }

  @computed
  List<Conversation> get conversations {
    return [..._conversationObservable];
  }

  @computed
  List<Message> get messages {
    return [..._messageObservable];
  }

  @computed
  bool get autenticando {
    return _autenticando;
  }

  @computed
  // ignore: missing_return
  AutenticacaoState get autenticacaoState {
    if ((_autenticacaoFuture == null ||
        _autenticacaoFuture.status == FutureStatus.rejected)) {
      return AutenticacaoState.inicial;
    }

    if (_autenticacaoFuture.status == FutureStatus.pending) {
      return AutenticacaoState.carregando;
    }

    if (_autenticacaoFuture.status == FutureStatus.fulfilled)
      return AutenticacaoState.carregado;
  }

  @action
  Future<void> autenticacaoUsuario(Autenticacao dados) async {
    _autenticando = true;
    try {
      _autenticacaoFuture =
          ObservableFuture(_autenticacaoController.autenticacaoUsuario(dados));

      _autenticacao =
          await _autenticacaoFuture.whenComplete(() => _autenticando = false);

      _categoriaFuture =
          ObservableFuture(_autenticacaoController.getCategorias());

      _categoriaObservable = (await _categoriaFuture).asObservable();

      _autenticacao = await _autenticacaoFuture;

      _categoriaFuture =
          ObservableFuture(_autenticacaoController.getCategorias());
      /* ----------------------------------------------------------------------*/
      _usuarioFuture = ObservableFuture(_autenticacaoController.getUsuarios());

      _conversationFuture =
          ObservableFuture(_autenticacaoController.getConversationList());

      /*_messageFuture = ObservableFuture(_messageController.getMessages());

      _messageObservable =
          (await _messageFuture.whenComplete(() => _autenticando = false))
              .asObservable();*/

      _conversationObservable =
          (await _conversationFuture.whenComplete(() => _autenticando = false))
              .asObservable();

      _usuarioObservable =
          (await _usuarioFuture.whenComplete(() => _autenticando = false))
              .asObservable();

      _categoriaObservable =
          (await _categoriaFuture.whenComplete(() => _autenticando = false))
              .asObservable();
    } catch (e) {
      _autenticando = false;
      throw e;
    }
  }

  @action
  Future<void> atualizaCategoriaUsuario(String id) async {
    _autenticando = true;
    try {
      await _autenticacaoController
          .patchCategoriaUsuario(id)
          .whenComplete(() => _autenticando = false);
    } catch (e) {
      _autenticando = false;
      throw e;
    }
  }

  @action
  Future<void> atualizaCategoriaTime(String id) async {
    _autenticando = true;
    try {
      await _autenticacaoController
          .patchCategoriaTime(id)
          .whenComplete(() => _autenticando = false);
    } catch (e) {
      _autenticando = false;
      throw e;
    }
  }
}
