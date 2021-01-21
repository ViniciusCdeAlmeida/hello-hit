import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/marketplace_controller.dart';
import 'package:hellohit/providers/profile_controller.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

enum ProfileState {
  inicial,
  carregando,
  carregado,
}

abstract class _ProfileStore with Store {
  final ProfileController _profileController;
  _ProfileStore(this._profileController);

  @observable
  ObservableList<Usuario> _profileObservable = ObservableList<Usuario>();

  @observable
  ObservableFuture<List<Usuario>> _profileFuture;

  @computed
  List<Usuario> get usuarios {
    return [..._profileObservable];
  }

  @computed
  // ignore: missing_return
  ProfileState get marketplaceState {
    if ((_profileFuture == null ||
        _profileFuture.status == FutureStatus.rejected)) {
      return ProfileState.inicial;
    }

    if (_profileFuture.status == FutureStatus.pending) {
      return ProfileState.carregando;
    }

    if (_profileFuture.status == FutureStatus.fulfilled)
      return ProfileState.carregado;
  }

  @action
  Future<void> seed() async {
    try {
      _profileFuture = ObservableFuture(
        _profileController.seed(),
      );
      _profileObservable = (await _profileFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }
}
