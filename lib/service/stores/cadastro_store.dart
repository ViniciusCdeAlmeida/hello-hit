import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';

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
  bool _cadastrando = false;

  @observable
  ObservableFuture<Cadastro> _cadastroFuture;

  @observable
  Cadastro _cadastro;

  @computed
  Cadastro get cadastro {
    return _cadastro;
  }

  @computed
  bool get cadastrando {
    return _cadastrando;
  }

  @computed
  // ignore: missing_return
  CadastroState get marketplaceState {
    if ((_cadastroFuture == null || _cadastroFuture.status == FutureStatus.rejected)) {
      return CadastroState.inicial;
    }

    if (_cadastroFuture.status == FutureStatus.pending) {
      return CadastroState.carregando;
    }

    if (_cadastroFuture.status == FutureStatus.fulfilled) return CadastroState.carregado;
  }

  @action
  // ignore: missing_return
  Future<void> cadastroUsuario(Cadastro usuario) async {
    _cadastrando = true;
    try {
      await _cadastroController.cadastroUsuario(usuario).then((_) => _cadastrando = false).catchError((error) {
        _cadastrando = false;
        throw error;
      });
    } catch (e) {
      _cadastrando = false;
      throw e;
    }
  }

  Future<Map> checkUser(String usuario) async {
    try {
      return await _cadastroController.verificaUsuario(usuario).catchError((error) {
        throw error;
      });
    } catch (e) {
      throw e;
    }
  }
}
