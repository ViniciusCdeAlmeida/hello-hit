// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketplaceStore on _MarketplaceStore, Store {
  Computed<List<Carreira>> _$carreirasComputed;

  @override
  List<Carreira> get carreiras =>
      (_$carreirasComputed ??= Computed<List<Carreira>>(() => super.carreiras,
              name: '_MarketplaceStore.carreiras'))
          .value;
  Computed<List<Carreira>> _$carreirasOriginalComputed;

  @override
  List<Carreira> get carreirasOriginal => (_$carreirasOriginalComputed ??=
          Computed<List<Carreira>>(() => super.carreirasOriginal,
              name: '_MarketplaceStore.carreirasOriginal'))
      .value;
  Computed<Carreira> _$carreiraComputed;

  @override
  Carreira get carreira =>
      (_$carreiraComputed ??= Computed<Carreira>(() => super.carreira,
              name: '_MarketplaceStore.carreira'))
          .value;
  Computed<MarketplaceState> _$marketplaceStateComputed;

  @override
  MarketplaceState get marketplaceState => (_$marketplaceStateComputed ??=
          Computed<MarketplaceState>(() => super.marketplaceState,
              name: '_MarketplaceStore.marketplaceState'))
      .value;

  final _$presentAtom = Atom(name: '_MarketplaceStore.present');

  @override
  int get present {
    _$presentAtom.reportRead();
    return super.present;
  }

  @override
  set present(int value) {
    _$presentAtom.reportWrite(value, super.present, () {
      super.present = value;
    });
  }

  final _$_carreiraObservableAtom =
      Atom(name: '_MarketplaceStore._carreiraObservable');

  @override
  ObservableList<Carreira> get _carreiraObservable {
    _$_carreiraObservableAtom.reportRead();
    return super._carreiraObservable;
  }

  @override
  set _carreiraObservable(ObservableList<Carreira> value) {
    _$_carreiraObservableAtom.reportWrite(value, super._carreiraObservable, () {
      super._carreiraObservable = value;
    });
  }

  final _$_carreiraItensAtom = Atom(name: '_MarketplaceStore._carreiraItens');

  @override
  ObservableList<Carreira> get _carreiraItens {
    _$_carreiraItensAtom.reportRead();
    return super._carreiraItens;
  }

  @override
  set _carreiraItens(ObservableList<Carreira> value) {
    _$_carreiraItensAtom.reportWrite(value, super._carreiraItens, () {
      super._carreiraItens = value;
    });
  }

  final _$_carreiraFutureAtom = Atom(name: '_MarketplaceStore._carreiraFuture');

  @override
  ObservableFuture<List<Carreira>> get _carreiraFuture {
    _$_carreiraFutureAtom.reportRead();
    return super._carreiraFuture;
  }

  @override
  set _carreiraFuture(ObservableFuture<List<Carreira>> value) {
    _$_carreiraFutureAtom.reportWrite(value, super._carreiraFuture, () {
      super._carreiraFuture = value;
    });
  }

  final _$_carreiraOportunidadeAtom =
      Atom(name: '_MarketplaceStore._carreiraOportunidade');

  @override
  Carreira get _carreiraOportunidade {
    _$_carreiraOportunidadeAtom.reportRead();
    return super._carreiraOportunidade;
  }

  @override
  set _carreiraOportunidade(Carreira value) {
    _$_carreiraOportunidadeAtom.reportWrite(value, super._carreiraOportunidade,
        () {
      super._carreiraOportunidade = value;
    });
  }

  final _$seedAsyncAction = AsyncAction('_MarketplaceStore.seed');

  @override
  Future<void> seed() {
    return _$seedAsyncAction.run(() => super.seed());
  }

  final _$_MarketplaceStoreActionController =
      ActionController(name: '_MarketplaceStore');

  @override
  void loadMore() {
    final _$actionInfo = _$_MarketplaceStoreActionController.startAction(
        name: '_MarketplaceStore.loadMore');
    try {
      return super.loadMore();
    } finally {
      _$_MarketplaceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadCarreira(int id) {
    final _$actionInfo = _$_MarketplaceStoreActionController.startAction(
        name: '_MarketplaceStore.loadCarreira');
    try {
      return super.loadCarreira(id);
    } finally {
      _$_MarketplaceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
present: ${present},
carreiras: ${carreiras},
carreirasOriginal: ${carreirasOriginal},
carreira: ${carreira},
marketplaceState: ${marketplaceState}
    ''';
  }
}
