import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';
part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

enum SearchState {
  inicial,
  carregando,
  carregado,
}

abstract class _SearchStore with Store {
  final SearchController _searchController;
  _SearchStore(
    this._searchController,
  );

  @observable
  ObservableList<ProfileTime> _timesObservable = ObservableList<ProfileTime>();

  @observable
  ObservableList<Profile> _talentosObservable = ObservableList<Profile>();

  @observable
  ObservableFuture _searchFuture;

  // @observable
  // ObservableFuture<List<ProfileTime>> _timesFuture;

  @computed
  List<Profile> get talentos {
    return [..._talentosObservable];
  }

  @computed
  List<ProfileTime> get times {
    return [..._timesObservable];
  }

  @computed
  // ignore: missing_return
  SearchState get searchState {
    if ((_searchFuture == null || _searchFuture.status == FutureStatus.rejected)) {
      return SearchState.inicial;
    }

    if (_searchFuture.status == FutureStatus.pending) {
      return SearchState.carregando;
    }

    if (_searchFuture.status == FutureStatus.fulfilled) return SearchState.carregado;
  }

  @action
  Future<void> getTalentos(Map data) async {
    try {
      _searchFuture = ObservableFuture(_searchController.getTalentoSearch(data));
      _talentosObservable = (await _searchFuture as List<Profile>).asObservable();
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> getTimes(Map data) async {
    try {
      _searchFuture = ObservableFuture(_searchController.getTimeSearch(data));
      _timesObservable = (await _searchFuture as List<ProfileTime>).asObservable();
    } catch (e) {
      throw e;
    }
  }
}
