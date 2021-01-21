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
  Computed<ProfileState> _$marketplaceStateComputed;

  @override
  ProfileState get marketplaceState => (_$marketplaceStateComputed ??=
          Computed<ProfileState>(() => super.marketplaceState,
              name: '_ProfileStore.marketplaceState'))
      .value;

  final _$_profileObservableAtom =
      Atom(name: '_ProfileStore._profileObservable');

  @override
  ObservableList<Usuario> get _profileObservable {
    _$_profileObservableAtom.reportRead();
    return super._profileObservable;
  }

  @override
  set _profileObservable(ObservableList<Usuario> value) {
    _$_profileObservableAtom.reportWrite(value, super._profileObservable, () {
      super._profileObservable = value;
    });
  }

  final _$_profileFutureAtom = Atom(name: '_ProfileStore._profileFuture');

  @override
  ObservableFuture<List<Usuario>> get _profileFuture {
    _$_profileFutureAtom.reportRead();
    return super._profileFuture;
  }

  @override
  set _profileFuture(ObservableFuture<List<Usuario>> value) {
    _$_profileFutureAtom.reportWrite(value, super._profileFuture, () {
      super._profileFuture = value;
    });
  }

  final _$seedAsyncAction = AsyncAction('_ProfileStore.seed');

  @override
  Future<void> seed() {
    return _$seedAsyncAction.run(() => super.seed());
  }

  @override
  String toString() {
    return '''
usuarios: ${usuarios},
marketplaceState: ${marketplaceState}
    ''';
  }
}
