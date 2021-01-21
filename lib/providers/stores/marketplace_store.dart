import 'package:hellohit/models/carreira_model.dart';
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
  ObservableList<Carreira> _carreiraObservable = ObservableList<Carreira>();

  @observable
  ObservableList<Carreira> _carreiraItens = ObservableList<Carreira>();

  @observable
  ObservableFuture<List<Carreira>> _carreiraFuture;

  @observable
  Carreira _carreiraOportunidade;

  @computed
  List<Carreira> get carreiras {
    return [..._carreiraItens];
  }

  @computed
  List<Carreira> get carreirasOriginal {
    return [..._carreiraObservable];
  }

  @computed
  Carreira get carreira {
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
      _carreiraFuture = ObservableFuture(
        _marketPlaceController.seed(),
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

  // @action
  // Future login(String usuario, String senha) async {
  //   logando = true;
  //   try {
  //     _loginFuture = ObservableFuture(
  //       _autenticacao.login(
  //         userName: usuario,
  //         password: senha,
  //         offline: _loginOffline,
  //       ),
  //     );
  //     _usuarioLogado = await _loginFuture.whenComplete(() => logando = false);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
