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
  Computed<ProfileState> _$profilesStateComputed;

  @override
  ProfileState get profilesState => (_$profilesStateComputed ??=
          Computed<ProfileState>(() => super.profilesState,
              name: '_ProfileStore.profilesState'))
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
  Future<void> saveTimeProfile(Profile profile) {
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
  String toString() {
    return '''
image: ${image},
imageAvatar: ${imageAvatar},
fulltime: ${fulltime},
freelance: ${freelance},
skills: ${skills},
usuario: ${usuario},
profilesState: ${profilesState}
    ''';
  }
}
