import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';

part 'marketplace_store.g.dart';

class MarketplaceStore = _MarketplaceStore with _$MarketplaceStore;

enum MarketplaceListState {
  inicial,
  carregando,
  carregado,
}

enum MarketplaceState {
  inicial,
  carregando,
  carregado,
}

abstract class _MarketplaceStore with Store {
  final OportunidadeController _oportunidadeController;
  _MarketplaceStore(this._oportunidadeController);

  int qtdeCarreiras = 0;

  @observable
  int present = 0;

  final int perPage = 4;

  @observable
  ObservableList<Oportunidade> _carreiraObservable =
      ObservableList<Oportunidade>();

  @observable
  ObservableList<Oportunidade> _carreiraItens = ObservableList<Oportunidade>();

  @observable
  ObservableFuture<List<Oportunidade>> _carreiraFuture;

  @observable
  Oportunidade _carreiraOportunidade;

  @observable
  ObservableFuture<Oportunidade> _carreiraOportunidadeFuture;

  @computed
  List<Oportunidade> get carreiras {
    return [..._carreiraItens];
  }

  @computed
  List<Oportunidade> get carreirasOriginal {
    return [..._carreiraObservable];
  }

  @computed
  Oportunidade get carreira {
    return _carreiraOportunidade;
  }

  @computed
  // ignore: missing_return
  MarketplaceListState get marketplaceListState {
    if ((_carreiraFuture == null ||
        _carreiraFuture.status == FutureStatus.rejected)) {
      return MarketplaceListState.inicial;
    }

    if (_carreiraFuture.status == FutureStatus.pending) {
      return MarketplaceListState.carregando;
    }

    if (_carreiraFuture.status == FutureStatus.fulfilled)
      return MarketplaceListState.carregado;
  }

  @computed
  // ignore: missing_return
  MarketplaceState get marketplaceState {
    if ((_carreiraOportunidadeFuture == null ||
        _carreiraOportunidadeFuture.status == FutureStatus.rejected)) {
      return MarketplaceState.inicial;
    }

    if (_carreiraOportunidadeFuture.status == FutureStatus.pending) {
      return MarketplaceState.carregando;
    }

    if (_carreiraOportunidadeFuture.status == FutureStatus.fulfilled)
      return MarketplaceState.carregado;
  }

  @action
  Future oportunidadeList() async {
    try {
      _carreiraFuture =
          ObservableFuture(_oportunidadeController.getOportunidadeList());
      _carreiraItens = (await _carreiraFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }

  @action
  Future getOportunidade(String id) async {
    try {
      _carreiraOportunidadeFuture =
          ObservableFuture(_oportunidadeController.getOportunidade(id));
      _carreiraOportunidade = await _carreiraOportunidadeFuture;
    } catch (e) {
      throw e;
    }
  }

  @action
  Future hitOportunidade(Map dados) async {
    try {
      _oportunidadeController.patchHitOportunidade(
          _carreiraOportunidade.id, dados);
    } catch (e) {
      throw e;
    }
  }

  @action
  void loadMore() {
    _carreiraItens.clear();
    if ((present + perPage) > _carreiraObservable.length) {
      _carreiraItens.addAll(
          _carreiraObservable.getRange(present, _carreiraObservable.length));
    } else {
      _carreiraItens
          .addAll(_carreiraObservable.getRange(present, present + perPage));
    }
    present = present + perPage;
  }

  @action
  void loadCarreira(int id) {
    // _carreiraOportunidade =
    //     _carreiraObservable.firstWhere((element) => element.id == id);
  }

  List<Oportunidade> loadUserCarreiras() {
    return [..._carreiraObservable];
  }
}
