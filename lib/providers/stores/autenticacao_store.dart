import 'package:hellohit/models/autenticacao_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/autenticacao_controller.dart';
import 'package:mobx/mobx.dart';

part 'autenticacao_store.g.dart';

class AutenticacaoStore = _AutenticacaoStore with _$AutenticacaoStore;

enum AutenticacaoState {
  inicial,
  carregando,
  carregado,
}

abstract class _AutenticacaoStore with Store {
  final AutenticacaoController _autenticacaoController;
  _AutenticacaoStore(this._autenticacaoController);

  @observable
  ObservableFuture<Usuario> _autenticacaoFuture;

  @observable
  Usuario _autenticacao;

  @computed
  Usuario get autenticacao {
    return _autenticacao;
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
    try {
      _autenticacaoFuture =
          ObservableFuture(_autenticacaoController.autenticacaoUsuario(dados));
      _autenticacao = await _autenticacaoFuture;
    } catch (e) {
      throw e;
    }
  }
}
