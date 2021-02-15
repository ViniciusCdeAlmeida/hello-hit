import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';

part 'oportunidade_store.g.dart';

class OportunidadeStore = _OportunidadeStore with _$OportunidadeStore;

enum OportunidadeState {
  inicial,
  carregando,
  carregado,
}

abstract class _OportunidadeStore with Store {
  final OportunidadeController _oportunidadeController;
  _OportunidadeStore(this._oportunidadeController);

  @observable
  ObservableFuture<List<Oportunidade>> _oportunidadeFuture;

  @observable
  ObservableList<Oportunidade> _oportunidadeObservable =
      ObservableList<Oportunidade>();

  @observable
  List<Oportunidade> _oportunidade;

  @computed
  List<Oportunidade> get feed {
    return _oportunidadeObservable;
  }

  @computed
  // ignore: missing_return
  OportunidadeState get oportunidadeState {
    if ((_oportunidadeFuture == null ||
        _oportunidadeFuture.status == FutureStatus.rejected)) {
      return OportunidadeState.inicial;
    }

    if (_oportunidadeFuture.status == FutureStatus.pending) {
      return OportunidadeState.carregando;
    }

    if (_oportunidadeFuture.status == FutureStatus.fulfilled)
      return OportunidadeState.carregado;
  }

  @action
  Future oportunidadeList() async {
    try {
      _oportunidadeFuture =
          ObservableFuture(_oportunidadeController.getOportunidadeList());
      _oportunidadeObservable = (await _oportunidadeFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }

  @action
  Future makeOportunidade(Oportunidade oportunidade) async {
    try {
      _oportunidadeController.makeOportunidade(oportunidade);
    } catch (e) {
      throw e;
    }
  }
}
