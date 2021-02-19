import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';

part 'time_store.g.dart';

class TimeStore = _TimeStore with _$TimeStore;

enum TimeState {
  inicial,
  carregando,
  carregado,
}

abstract class _TimeStore with Store {
  final ProfileController _profileController;
  _TimeStore(this._profileController);

  @observable
  ObservableList<ProfileTime> _timesObservable = ObservableList<ProfileTime>();

  @observable
  ObservableFuture<List<ProfileTime>> _timesFuture;

  @observable
  bool buscando = false;

  @computed
  List<ProfileTime> get times {
    return [..._timesObservable];
  }

  @computed
  // ignore: missing_return
  TimeState get timeState {
    if ((_timesFuture == null || _timesFuture.status == FutureStatus.rejected)) {
      return TimeState.inicial;
    }

    if (_timesFuture.status == FutureStatus.pending) {
      return TimeState.carregando;
    }

    if (_timesFuture.status == FutureStatus.fulfilled) return TimeState.carregado;
  }

  @action
  Future<void> getTeams() async {
    buscando = true;
    var temp;
    if (_timesObservable.length != 0) temp = [..._timesObservable];
    _timesObservable.clear();
    try {
      _timesFuture =
          ObservableFuture(_profileController.getAllTimeProfile(newSearch: true).whenComplete(() => buscando = false));
      _timesObservable = (await _timesFuture).asObservable();
    } catch (e) {
      _timesObservable.addAll(temp);
      buscando = false;
      throw e;
    }
  }

  @action
  Future getTeamsPagination() async {
    try {
      var _tempFuture = await _profileController.getAllTimeProfile(newSearch: false);
      if (_tempFuture != null) _timesObservable.addAll(_tempFuture);
    } catch (e) {
      throw e;
    }
  }
}
