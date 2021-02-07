// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  Computed<Profile> _$usuarioComputed;

  @override
  Profile get usuario => (_$usuarioComputed ??=
          Computed<Profile>(() => super.usuario, name: '_ProfileStore.usuario'))
      .value;
  Computed<ProfileTime> _$usuarioTimeComputed;

  @override
  ProfileTime get usuarioTime =>
      (_$usuarioTimeComputed ??= Computed<ProfileTime>(() => super.usuarioTime,
              name: '_ProfileStore.usuarioTime'))
          .value;
  Computed<ProfileState> _$profilesStateComputed;

  @override
  ProfileState get profilesState => (_$profilesStateComputed ??=
          Computed<ProfileState>(() => super.profilesState,
              name: '_ProfileStore.profilesState'))
      .value;
  Computed<ProfileState> _$profilesTimeStateComputed;

  @override
  ProfileState get profilesTimeState => (_$profilesTimeStateComputed ??=
          Computed<ProfileState>(() => super.profilesTimeState,
              name: '_ProfileStore.profilesTimeState'))
      .value;

  final _$imageAtom = Atom(name: '_ProfileStore.image');

  @override
  File get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$imageAvatarAtom = Atom(name: '_ProfileStore.imageAvatar');

  @override
  String get imageAvatar {
    _$imageAvatarAtom.reportRead();
    return super.imageAvatar;
  }

  @override
  set imageAvatar(String value) {
    _$imageAvatarAtom.reportWrite(value, super.imageAvatar, () {
      super.imageAvatar = value;
    });
  }

  final _$imageCoverAtom = Atom(name: '_ProfileStore.imageCover');

  @override
  File get imageCover {
    _$imageCoverAtom.reportRead();
    return super.imageCover;
  }

  @override
  set imageCover(File value) {
    _$imageCoverAtom.reportWrite(value, super.imageCover, () {
      super.imageCover = value;
    });
  }

  final _$imageAvatarCoverAtom = Atom(name: '_ProfileStore.imageAvatarCover');

  @override
  String get imageAvatarCover {
    _$imageAvatarCoverAtom.reportRead();
    return super.imageAvatarCover;
  }

  @override
  set imageAvatarCover(String value) {
    _$imageAvatarCoverAtom.reportWrite(value, super.imageAvatarCover, () {
      super.imageAvatarCover = value;
    });
  }

  final _$fulltimeAtom = Atom(name: '_ProfileStore.fulltime');

  @override
  bool get fulltime {
    _$fulltimeAtom.reportRead();
    return super.fulltime;
  }

  @override
  set fulltime(bool value) {
    _$fulltimeAtom.reportWrite(value, super.fulltime, () {
      super.fulltime = value;
    });
  }

  final _$freelanceAtom = Atom(name: '_ProfileStore.freelance');

  @override
  bool get freelance {
    _$freelanceAtom.reportRead();
    return super.freelance;
  }

  @override
  set freelance(bool value) {
    _$freelanceAtom.reportWrite(value, super.freelance, () {
      super.freelance = value;
    });
  }

  final _$beSponsoredAtom = Atom(name: '_ProfileStore.beSponsored');

  @override
  bool get beSponsored {
    _$beSponsoredAtom.reportRead();
    return super.beSponsored;
  }

  @override
  set beSponsored(bool value) {
    _$beSponsoredAtom.reportWrite(value, super.beSponsored, () {
      super.beSponsored = value;
    });
  }

  final _$skillsAtom = Atom(name: '_ProfileStore.skills');

  @override
  ObservableList<Skill> get skills {
    _$skillsAtom.reportRead();
    return super.skills;
  }

  @override
  set skills(ObservableList<Skill> value) {
    _$skillsAtom.reportWrite(value, super.skills, () {
      super.skills = value;
    });
  }

  final _$_profileObservableAtom =
      Atom(name: '_ProfileStore._profileObservable');

  @override
  Profile get _profileObservable {
    _$_profileObservableAtom.reportRead();
    return super._profileObservable;
  }

  @override
  set _profileObservable(Profile value) {
    _$_profileObservableAtom.reportWrite(value, super._profileObservable, () {
      super._profileObservable = value;
    });
  }

  final _$_profileFutureAtom = Atom(name: '_ProfileStore._profileFuture');

  @override
  ObservableFuture<Profile> get _profileFuture {
    _$_profileFutureAtom.reportRead();
    return super._profileFuture;
  }

  @override
  set _profileFuture(ObservableFuture<Profile> value) {
    _$_profileFutureAtom.reportWrite(value, super._profileFuture, () {
      super._profileFuture = value;
    });
  }

  final _$_profileTimeObservableAtom =
      Atom(name: '_ProfileStore._profileTimeObservable');

  @override
  ProfileTime get _profileTimeObservable {
    _$_profileTimeObservableAtom.reportRead();
    return super._profileTimeObservable;
  }

  @override
  set _profileTimeObservable(ProfileTime value) {
    _$_profileTimeObservableAtom
        .reportWrite(value, super._profileTimeObservable, () {
      super._profileTimeObservable = value;
    });
  }

  final _$_profileTimeFutureAtom =
      Atom(name: '_ProfileStore._profileTimeFuture');

  @override
  ObservableFuture<ProfileTime> get _profileTimeFuture {
    _$_profileTimeFutureAtom.reportRead();
    return super._profileTimeFuture;
  }

  @override
  set _profileTimeFuture(ObservableFuture<ProfileTime> value) {
    _$_profileTimeFutureAtom.reportWrite(value, super._profileTimeFuture, () {
      super._profileTimeFuture = value;
    });
  }

  final _$loadUsuarioProfileAsyncAction =
      AsyncAction('_ProfileStore.loadUsuarioProfile');

  @override
  Future<dynamic> loadUsuarioProfile(String id) {
    return _$loadUsuarioProfileAsyncAction
        .run(() => super.loadUsuarioProfile(id));
  }

  final _$loadTimeProfileAsyncAction =
      AsyncAction('_ProfileStore.loadTimeProfile');

  @override
  Future<dynamic> loadTimeProfile(String id) {
    return _$loadTimeProfileAsyncAction.run(() => super.loadTimeProfile(id));
  }

  final _$loadUsuarioProfileScreenAsyncAction =
      AsyncAction('_ProfileStore.loadUsuarioProfileScreen');

  @override
  Future<dynamic> loadUsuarioProfileScreen(String id) {
    return _$loadUsuarioProfileScreenAsyncAction
        .run(() => super.loadUsuarioProfileScreen(id));
  }

  final _$loadTimeProfileScreenAsyncAction =
      AsyncAction('_ProfileStore.loadTimeProfileScreen');

  @override
  Future<dynamic> loadTimeProfileScreen(String id) {
    return _$loadTimeProfileScreenAsyncAction
        .run(() => super.loadTimeProfileScreen(id));
  }

  final _$saveUsuarioProfileAsyncAction =
      AsyncAction('_ProfileStore.saveUsuarioProfile');

  @override
  Future<void> saveUsuarioProfile(Profile profile, String image) {
    return _$saveUsuarioProfileAsyncAction
        .run(() => super.saveUsuarioProfile(profile, image));
  }

  final _$saveTimeProfileAsyncAction =
      AsyncAction('_ProfileStore.saveTimeProfile');

  @override
  Future<void> saveTimeProfile(ProfileTime profile) {
    return _$saveTimeProfileAsyncAction
        .run(() => super.saveTimeProfile(profile));
  }

  final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore');

  @override
  void fullTime(bool value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.fullTime');
    try {
      return super.fullTime(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void freeLance(bool value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.freeLance');
    try {
      return super.freeLance(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void timefullTime(bool value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.timefullTime');
    try {
      return super.timefullTime(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void timeFreeLance(bool value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.timeFreeLance');
    try {
      return super.timeFreeLance(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void beSponsor(bool value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.beSponsor');
    try {
      return super.beSponsor(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
imageAvatar: ${imageAvatar},
imageCover: ${imageCover},
imageAvatarCover: ${imageAvatarCover},
fulltime: ${fulltime},
freelance: ${freelance},
beSponsored: ${beSponsored},
skills: ${skills},
usuario: ${usuario},
usuarioTime: ${usuarioTime},
profilesState: ${profilesState},
profilesTimeState: ${profilesTimeState}
    ''';
  }
}
