import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/models/search_model.dart';
import 'package:mobx/mobx.dart';

import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/search_controller.dart';

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
  ObservableFuture<List> _searchFuture;

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
    if ((_searchFuture == null ||
        _searchFuture.status == FutureStatus.rejected)) {
      return SearchState.inicial;
    }

    if (_searchFuture.status == FutureStatus.pending) {
      return SearchState.carregando;
    }

    if (_searchFuture.status == FutureStatus.fulfilled)
      return SearchState.carregado;
  }

  @action
  Future<void> getTalentos(Search data) async {
    try {
      _searchFuture =
          ObservableFuture(_searchController.getTalentoSearch(data));
      _talentosObservable = (await _searchFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> getTimes(Search data) async {
    try {
      _searchFuture = ObservableFuture(_searchController.getTimeSearch(data));
      _timesObservable = (await _searchFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }
}
