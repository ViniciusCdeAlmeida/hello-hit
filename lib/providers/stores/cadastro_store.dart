import 'package:hellohit/models/usuario_model.dart';
import 'package:mobx/mobx.dart';

import 'package:hellohit/models/cadastro_model.dart';
import 'package:hellohit/models/feed_model.dart';
import 'package:hellohit/providers/cadastro_controller.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

enum CadastroState {
  inicial,
  carregando,
  carregado,
}

abstract class _CadastroStore with Store {
  final CadastroController _cadastroController;
  _CadastroStore(this._cadastroController);

  @observable
  ObservableFuture<Cadastro> _cadastroFuture;

  @observable
  Cadastro _cadastro;

  @computed
  Cadastro get cadastro {
    return _cadastro;
  }

  @computed
  // ignore: missing_return
  CadastroState get marketplaceState {
    if ((_cadastroFuture == null ||
        _cadastroFuture.status == FutureStatus.rejected)) {
      return CadastroState.inicial;
    }

    if (_cadastroFuture.status == FutureStatus.pending) {
      return CadastroState.carregando;
    }

    if (_cadastroFuture.status == FutureStatus.fulfilled)
      return CadastroState.carregado;
  }

  @action
  // ignore: missing_return
  Future<Cadastro> cadastroUsuario(Cadastro usuario) async {
    try {
      _cadastroFuture = ObservableFuture(
        _cadastroController.cadastroUsuario(usuario),
      );
      _cadastro = await _cadastroFuture;
    } catch (e) {
      throw e;
    }
  }
}
