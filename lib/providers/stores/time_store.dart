import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/providers/profile_controller.dart';
import 'package:mobx/mobx.dart';

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
    if ((_timesFuture == null ||
        _timesFuture.status == FutureStatus.rejected)) {
      return TimeState.inicial;
    }

    if (_timesFuture.status == FutureStatus.pending) {
      return TimeState.carregando;
    }

    if (_timesFuture.status == FutureStatus.fulfilled)
      return TimeState.carregado;
  }

  @action
  Future<void> getTeams() async {
    buscando = true;
    try {
      _timesFuture = ObservableFuture(_profileController
          .getAllTimeProfile()
          .whenComplete(() => buscando = false));
      _timesObservable = (await _timesFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }
}
