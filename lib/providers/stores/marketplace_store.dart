import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/providers/marketplace_controller.dart';
import 'package:mobx/mobx.dart';

part 'marketplace_store.g.dart';

class MarketplaceStore = _MarketplaceStore with _$MarketplaceStore;

enum MarketplaceState {
  inicial,
  carregando,
  carregado,
}

abstract class _MarketplaceStore with Store {
  final MarketPlaceController _marketPlaceController;
  _MarketplaceStore(this._marketPlaceController);

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
  MarketplaceState get marketplaceState {
    if ((_carreiraFuture == null ||
        _carreiraFuture.status == FutureStatus.rejected)) {
      return MarketplaceState.inicial;
    }

    if (_carreiraFuture.status == FutureStatus.pending) {
      return MarketplaceState.carregando;
    }

    if (_carreiraFuture.status == FutureStatus.fulfilled)
      return MarketplaceState.carregado;
  }

  @action
  Future<void> seed() async {
    try {
      _carreiraFuture = ObservableFuture(null
          // _marketPlaceController.seed(),
          );
      _carreiraObservable = (await _carreiraFuture).asObservable();
    } catch (e) {
      throw e;
    }
    _carreiraItens
        .addAll(_carreiraObservable.getRange(present, present + perPage));
    present = present + perPage;
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
    _carreiraOportunidade =
        _carreiraObservable.firstWhere((element) => element.id == id);
  }

  List<Oportunidade> loadUserCarreiras() {
    return [..._carreiraObservable];
  }
}
