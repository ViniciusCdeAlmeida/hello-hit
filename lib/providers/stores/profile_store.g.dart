// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  Computed<List<Usuario>> _$usuariosComputed;

  @override
  List<Usuario> get usuarios =>
      (_$usuariosComputed ??= Computed<List<Usuario>>(() => super.usuarios,
              name: '_ProfileStore.usuarios'))
          .value;
  Computed<Usuario> _$usuarioComputed;

  @override
  Usuario get usuario => (_$usuarioComputed ??=
          Computed<Usuario>(() => super.usuario, name: '_ProfileStore.usuario'))
      .value;
  Computed<ProfileState> _$profilesStateComputed;

  @override
  ProfileState get profilesState => (_$profilesStateComputed ??=
          Computed<ProfileState>(() => super.profilesState,
              name: '_ProfileStore.profilesState'))
      .value;
  Computed<ProfileState> _$profileStateComputed;

  @override
  ProfileState get profileState => (_$profileStateComputed ??=
          Computed<ProfileState>(() => super.profileState,
              name: '_ProfileStore.profileState'))
      .value;

  final _$_profilesObservableAtom =
      Atom(name: '_ProfileStore._profilesObservable');

  @override
  ObservableList<Usuario> get _profilesObservable {
    _$_profilesObservableAtom.reportRead();
    return super._profilesObservable;
  }

  @override
  set _profilesObservable(ObservableList<Usuario> value) {
    _$_profilesObservableAtom.reportWrite(value, super._profilesObservable, () {
      super._profilesObservable = value;
    });
  }

  final _$_profileObservableAtom =
      Atom(name: '_ProfileStore._profileObservable');

  @override
  Usuario get _profileObservable {
    _$_profileObservableAtom.reportRead();
    return super._profileObservable;
  }

  @override
  set _profileObservable(Usuario value) {
    _$_profileObservableAtom.reportWrite(value, super._profileObservable, () {
      super._profileObservable = value;
    });
  }

  final _$_profileFutureAtom = Atom(name: '_ProfileStore._profileFuture');

  @override
  ObservableFuture<Usuario> get _profileFuture {
    _$_profileFutureAtom.reportRead();
    return super._profileFuture;
  }

  @override
  set _profileFuture(ObservableFuture<Usuario> value) {
    _$_profileFutureAtom.reportWrite(value, super._profileFuture, () {
      super._profileFuture = value;
    });
  }

  final _$_profilesFutureAtom = Atom(name: '_ProfileStore._profilesFuture');

  @override
  ObservableFuture<List<Usuario>> get _profilesFuture {
    _$_profilesFutureAtom.reportRead();
    return super._profilesFuture;
  }

  @override
  set _profilesFuture(ObservableFuture<List<Usuario>> value) {
    _$_profilesFutureAtom.reportWrite(value, super._profilesFuture, () {
      super._profilesFuture = value;
    });
  }

  final _$seedAsyncAction = AsyncAction('_ProfileStore.seed');

  @override
  Future<void> seed() {
    return _$seedAsyncAction.run(() => super.seed());
  }

  final _$loadProfileAsyncAction = AsyncAction('_ProfileStore.loadProfile');

  @override
  Future<void> loadProfile(int id) {
    return _$loadProfileAsyncAction.run(() => super.loadProfile(id));
  }

  @override
  String toString() {
    return '''
usuarios: ${usuarios},
usuario: ${usuario},
profilesState: ${profilesState},
profileState: ${profileState}
    ''';
  }
}
