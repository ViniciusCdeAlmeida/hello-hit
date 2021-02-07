import 'dart:io';

import 'package:mobx/mobx.dart';

import 'package:hellohit/models/profile_model.dart';
import 'package:hellohit/models/profile_time_model.dart';
import 'package:hellohit/models/skill_model.dart';
import 'package:hellohit/providers/profile_controller.dart';

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
  File image;

  @observable
  String imageAvatar;

  @observable
  File imageCover;

  @observable
  String imageAvatarCover;

  @observable
  bool fulltime = false;

  @observable
  bool freelance = false;

  @observable
  bool beSponsored = false;

  @observable
  ObservableList<Skill> skills = ObservableList<Skill>();

  @observable
  Profile _profileObservable;

  @observable
  ObservableFuture<Profile> _profileFuture;

  @observable
  ProfileTime _profileTimeObservable;

  @observable
  ObservableFuture<ProfileTime> _profileTimeFuture;

  @computed
  Profile get usuario {
    return _profileObservable;
  }

  @computed
  ProfileTime get usuarioTime {
    return _profileTimeObservable;
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

  @computed
  // ignore: missing_return
  ProfileState get profilesTimeState {
    if ((_profileTimeFuture == null ||
        _profileTimeFuture.status == FutureStatus.rejected)) {
      return ProfileState.inicial;
    }

    if (_profileTimeFuture.status == FutureStatus.pending) {
      return ProfileState.carregando;
    }

    if (_profileTimeFuture.status == FutureStatus.fulfilled)
      return ProfileState.carregado;
  }

  @action
  void fullTime(bool value) {
    _profileObservable.workAvailability.fulltime = value;
  }

  @action
  void freeLance(bool value) {
    _profileObservable.workAvailability.freelance = value;
  }

  @action
  void timefullTime(bool value) {
    _profileTimeObservable.workAvailability.fulltime = value;
  }

  @action
  void timeFreeLance(bool value) {
    _profileTimeObservable.workAvailability.freelance = value;
  }

  @action
  void beSponsor(bool value) {
    _profileTimeObservable.workAvailability.beSponsored = value;
  }

  @action
  Future loadUsuarioProfile(String id) async {
    try {
      _profileFuture = ObservableFuture(
        _profileController.getUsuarioProfile(id),
      );
      // _profileObservable = await _profileFuture;
      // freelance = _profileObservable.freelance;
      // fulltime = _profileObservable.fullTime;
      skills.addAll(_profileObservable.skills);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future loadTimeProfile(String id) async {
    try {
      _profileTimeFuture = ObservableFuture(
        _profileController.getTimeProfile(id),
      );
      _profileTimeObservable = await _profileTimeFuture;
    } catch (e) {
      throw e;
    } finally {
      // freelance = _profileTimeObservable.freelance;
      // fulltime = _profileTimeObservable.fullTime;
      // beSponsored = _profileTimeObservable.beSponsored;
      skills.addAll(_profileTimeObservable.skills);
    }
  }

  @action
  Future loadUsuarioProfileScreen(String id) async {
    try {
      _profileFuture = ObservableFuture(
        _profileController.getUsuarioProfileScreen(id),
      );
    } catch (e) {
      throw e;
    }
  }

  @action
  Future loadTimeProfileScreen(String id) async {
    try {
      _profileTimeFuture = ObservableFuture(
        _profileController.getTimeProfileScreen(id),
      );
      _profileTimeObservable = await _profileTimeFuture;
    } catch (e) {
      throw e;
    }
  }

  void limparSkills() {
    skills.clear();
  }

  @action
  Future<void> saveUsuarioProfile(Profile profile, String image) async {
    try {
      _profileController.atualizarUsuarioProfile(profile, image);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> saveTimeProfile(ProfileTime profile) async {
    try {
      _profileController.atualizarTimeProfile(profile, imageAvatar);
    } catch (e) {
      throw e;
    }
  }
}
