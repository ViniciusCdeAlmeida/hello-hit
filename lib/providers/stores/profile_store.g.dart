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
  Future<void> saveUsuarioProfile(Profile profile) {
    return _$saveUsuarioProfileAsyncAction
        .run(() => super.saveUsuarioProfile(profile));
  }

  final _$saveTimeProfileAsyncAction =
      AsyncAction('_ProfileStore.saveTimeProfile');

  @override
  Future<void> saveTimeProfile(Profile profile) {
    return _$saveTimeProfileAsyncAction
        .run(() => super.saveTimeProfile(profile));
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
profilesState: ${profilesState}
    ''';
  }
}
