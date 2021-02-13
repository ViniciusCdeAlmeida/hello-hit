// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oportunidade_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OportunidadeStore on _OportunidadeStore, Store {
  Computed<List<Oportunidade>> _$feedComputed;

  @override
  List<Oportunidade> get feed =>
      (_$feedComputed ??= Computed<List<Oportunidade>>(() => super.feed,
              name: '_OportunidadeStore.feed'))
          .value;
  Computed<OportunidadeState> _$oportunidadeStateComputed;

  @override
  OportunidadeState get oportunidadeState => (_$oportunidadeStateComputed ??=
          Computed<OportunidadeState>(() => super.oportunidadeState,
              name: '_OportunidadeStore.oportunidadeState'))
      .value;

  final _$_oportunidadeFutureAtom =
      Atom(name: '_OportunidadeStore._oportunidadeFuture');

  @override
  ObservableFuture<List<Oportunidade>> get _oportunidadeFuture {
    _$_oportunidadeFutureAtom.reportRead();
    return super._oportunidadeFuture;
  }

  @override
  set _oportunidadeFuture(ObservableFuture<List<Oportunidade>> value) {
    _$_oportunidadeFutureAtom.reportWrite(value, super._oportunidadeFuture, () {
      super._oportunidadeFuture = value;
    });
  }

  final _$_oportunidadeObservableAtom =
      Atom(name: '_OportunidadeStore._oportunidadeObservable');

  @override
  ObservableList<Oportunidade> get _oportunidadeObservable {
    _$_oportunidadeObservableAtom.reportRead();
    return super._oportunidadeObservable;
  }

  @override
  set _oportunidadeObservable(ObservableList<Oportunidade> value) {
    _$_oportunidadeObservableAtom
        .reportWrite(value, super._oportunidadeObservable, () {
      super._oportunidadeObservable = value;
    });
  }

  final _$_oportunidadeAtom = Atom(name: '_OportunidadeStore._oportunidade');

  @override
  List<Oportunidade> get _oportunidade {
    _$_oportunidadeAtom.reportRead();
    return super._oportunidade;
  }

  @override
  set _oportunidade(List<Oportunidade> value) {
    _$_oportunidadeAtom.reportWrite(value, super._oportunidade, () {
      super._oportunidade = value;
    });
  }

  final _$oportunidadeListAsyncAction =
      AsyncAction('_OportunidadeStore.oportunidadeList');

  @override
  Future<dynamic> oportunidadeList() {
    return _$oportunidadeListAsyncAction.run(() => super.oportunidadeList());
  }

  final _$makeOportunidadeAsyncAction =
      AsyncAction('_OportunidadeStore.makeOportunidade');

  @override
  Future<dynamic> makeOportunidade(Oportunidade oportunidade) {
    return _$makeOportunidadeAsyncAction
        .run(() => super.makeOportunidade(oportunidade));
  }

  @override
  String toString() {
    return '''
feed: ${feed},
oportunidadeState: ${oportunidadeState}
    ''';
  }
}
