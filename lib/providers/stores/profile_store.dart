import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/providers/stores/marketplace_store.dart';
import 'package:hellohit/screens/marketplace/marketplace_screen.dart';
import 'package:mobx/mobx.dart';

import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/profile_controller.dart';
import 'package:hellohit/providers/stores/post_store.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

enum ProfileState {
  inicial,
  carregando,
  carregado,
}

abstract class _ProfileStore with Store {
  final ProfileController _profileController;
  _ProfileStore(
    this._profileController,
  );

  @observable
  Profile _profileObservable;

  @observable
  ObservableFuture<Profile> _profileFuture;

  @computed
  Profile get usuario {
    return _profileObservable;
  }

  @computed
  // ignore: missing_return
  ProfileState get profilesState {
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
  Future loadUsuarioProfile(String id) async {
    try {
      _profileFuture = ObservableFuture(
        _profileController.getUsuarioProfile(id),
      );
      _profileObservable = await _profileFuture;
    } catch (e) {
      throw e;
    }
  }

  @action
  Future loadTimeProfile(String id) async {
    try {
      _profileFuture = ObservableFuture(
        _profileController.getTimeProfile(id),
      );
      _profileObservable = await _profileFuture;
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> saveUsuarioProfile(Profile profile) async {
    try {
      _profileController.atualizarUsuarioProfile(profile);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> saveTimeProfile(Profile profile) async {
    try {
      _profileController.atualizarTimeProfile(profile);
    } catch (e) {
      throw e;
    }
  }
}
