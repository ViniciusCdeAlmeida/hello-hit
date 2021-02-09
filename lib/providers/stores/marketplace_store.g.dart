// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketplaceStore on _MarketplaceStore, Store {
  Computed<List<Oportunidade>> _$carreirasComputed;

  @override
  List<Oportunidade> get carreiras => (_$carreirasComputed ??=
          Computed<List<Oportunidade>>(() => super.carreiras,
              name: '_MarketplaceStore.carreiras'))
      .value;
  Computed<List<Oportunidade>> _$carreirasOriginalComputed;

  @override
  List<Oportunidade> get carreirasOriginal => (_$carreirasOriginalComputed ??=
          Computed<List<Oportunidade>>(() => super.carreirasOriginal,
              name: '_MarketplaceStore.carreirasOriginal'))
      .value;
  Computed<Oportunidade> _$carreiraComputed;

  @override
  Oportunidade get carreira =>
      (_$carreiraComputed ??= Computed<Oportunidade>(() => super.carreira,
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
  ObservableList<Oportunidade> get _carreiraObservable {
    _$_carreiraObservableAtom.reportRead();
    return super._carreiraObservable;
  }

  @override
  set _carreiraObservable(ObservableList<Oportunidade> value) {
    _$_carreiraObservableAtom.reportWrite(value, super._carreiraObservable, () {
      super._carreiraObservable = value;
    });
  }

  final _$_carreiraItensAtom = Atom(name: '_MarketplaceStore._carreiraItens');

  @override
  ObservableList<Oportunidade> get _carreiraItens {
    _$_carreiraItensAtom.reportRead();
    return super._carreiraItens;
  }

  @override
  set _carreiraItens(ObservableList<Oportunidade> value) {
    _$_carreiraItensAtom.reportWrite(value, super._carreiraItens, () {
      super._carreiraItens = value;
    });
  }

  final _$_carreiraFutureAtom = Atom(name: '_MarketplaceStore._carreiraFuture');

  @override
  ObservableFuture<List<Oportunidade>> get _carreiraFuture {
    _$_carreiraFutureAtom.reportRead();
    return super._carreiraFuture;
  }

  @override
  set _carreiraFuture(ObservableFuture<List<Oportunidade>> value) {
    _$_carreiraFutureAtom.reportWrite(value, super._carreiraFuture, () {
      super._carreiraFuture = value;
    });
  }

  final _$_carreiraOportunidadeAtom =
      Atom(name: '_MarketplaceStore._carreiraOportunidade');

  @override
  Oportunidade get _carreiraOportunidade {
    _$_carreiraOportunidadeAtom.reportRead();
    return super._carreiraOportunidade;
  }

  @override
  set _carreiraOportunidade(Oportunidade value) {
    _$_carreiraOportunidadeAtom.reportWrite(value, super._carreiraOportunidade,
        () {
      super._carreiraOportunidade = value;
    });
  }

  final _$oportunidadeListAsyncAction =
      AsyncAction('_MarketplaceStore.oportunidadeList');

  @override
  Future<dynamic> oportunidadeList() {
    return _$oportunidadeListAsyncAction.run(() => super.oportunidadeList());
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
