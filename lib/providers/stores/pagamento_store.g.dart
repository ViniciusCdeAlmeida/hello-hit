// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagamentoStore on _PostStore, Store {
  Computed<List<ProdutosPagamento>> _$produtosComputed;

  @override
  List<ProdutosPagamento> get produtos => (_$produtosComputed ??=
          Computed<List<ProdutosPagamento>>(() => super.produtos,
              name: '_PostStore.produtos'))
      .value;
  Computed<List<ProdutosPagamento>> _$produtosProTalentoComputed;

  @override
  List<ProdutosPagamento> get produtosProTalento =>
      (_$produtosProTalentoComputed ??= Computed<List<ProdutosPagamento>>(
              () => super.produtosProTalento,
              name: '_PostStore.produtosProTalento'))
          .value;
  Computed<List<ProdutosPagamento>> _$produtosAdicionarMembroTimeComputed;

  @override
  List<ProdutosPagamento> get produtosAdicionarMembroTime =>
      (_$produtosAdicionarMembroTimeComputed ??=
              Computed<List<ProdutosPagamento>>(
                  () => super.produtosAdicionarMembroTime,
                  name: '_PostStore.produtosAdicionarMembroTime'))
          .value;
  Computed<List<ProdutosPagamento>> _$produtosCriarOportunidadeTimeComputed;

  @override
  List<ProdutosPagamento> get produtosCriarOportunidadeTime =>
      (_$produtosCriarOportunidadeTimeComputed ??=
              Computed<List<ProdutosPagamento>>(
                  () => super.produtosCriarOportunidadeTime,
                  name: '_PostStore.produtosCriarOportunidadeTime'))
          .value;
  Computed<PagamentoState> _$pagamentoStateComputed;

  @override
  PagamentoState get pagamentoState => (_$pagamentoStateComputed ??=
          Computed<PagamentoState>(() => super.pagamentoState,
              name: '_PostStore.pagamentoState'))
      .value;

  final _$pagandoAtom = Atom(name: '_PostStore.pagando');

  @override
  bool get pagando {
    _$pagandoAtom.reportRead();
    return super.pagando;
  }

  @override
  set pagando(bool value) {
    _$pagandoAtom.reportWrite(value, super.pagando, () {
      super.pagando = value;
    });
  }

  final _$_produtosObservableAtom =
      Atom(name: '_PostStore._produtosObservable');

  @override
  ObservableList<ProdutosPagamento> get _produtosObservable {
    _$_produtosObservableAtom.reportRead();
    return super._produtosObservable;
  }

  @override
  set _produtosObservable(ObservableList<ProdutosPagamento> value) {
    _$_produtosObservableAtom.reportWrite(value, super._produtosObservable, () {
      super._produtosObservable = value;
    });
  }

  final _$_produtosFutureAtom = Atom(name: '_PostStore._produtosFuture');

  @override
  ObservableFuture<List<ProdutosPagamento>> get _produtosFuture {
    _$_produtosFutureAtom.reportRead();
    return super._produtosFuture;
  }

  @override
  set _produtosFuture(ObservableFuture<List<ProdutosPagamento>> value) {
    _$_produtosFutureAtom.reportWrite(value, super._produtosFuture, () {
      super._produtosFuture = value;
    });
  }

  final _$getProdutosAsyncAction = AsyncAction('_PostStore.getProdutos');

  @override
  Future<void> getProdutos() {
    return _$getProdutosAsyncAction.run(() => super.getProdutos());
  }

  final _$makePagamentoTimeAsyncAction =
      AsyncAction('_PostStore.makePagamentoTime');

  @override
  Future<void> makePagamentoTime(String priceId) {
    return _$makePagamentoTimeAsyncAction
        .run(() => super.makePagamentoTime(priceId));
  }

  final _$makePagamentoTalentoProAsyncAction =
      AsyncAction('_PostStore.makePagamentoTalentoPro');

  @override
  Future<void> makePagamentoTalentoPro(String priceId) {
    return _$makePagamentoTalentoProAsyncAction
        .run(() => super.makePagamentoTalentoPro(priceId));
  }

  @override
  String toString() {
    return '''
pagando: ${pagando},
produtos: ${produtos},
produtosProTalento: ${produtosProTalento},
produtosAdicionarMembroTime: ${produtosAdicionarMembroTime},
produtosCriarOportunidadeTime: ${produtosCriarOportunidadeTime},
pagamentoState: ${pagamentoState}
    ''';
  }
}
