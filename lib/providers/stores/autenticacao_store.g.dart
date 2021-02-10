// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AutenticacaoStore on _AutenticacaoStore, Store {
  Computed<Usuario> _$autenticacaoComputed;

  @override
  Usuario get autenticacao =>
      (_$autenticacaoComputed ??= Computed<Usuario>(() => super.autenticacao,
              name: '_AutenticacaoStore.autenticacao'))
          .value;
  Computed<List<Categoria>> _$categoriasComputed;

  @override
  List<Categoria> get categorias => (_$categoriasComputed ??=
          Computed<List<Categoria>>(() => super.categorias,
              name: '_AutenticacaoStore.categorias'))
      .value;
  Computed<bool> _$autenticandoComputed;

  @override
  bool get autenticando =>
      (_$autenticandoComputed ??= Computed<bool>(() => super.autenticando,
              name: '_AutenticacaoStore.autenticando'))
          .value;
  Computed<AutenticacaoState> _$autenticacaoStateComputed;

  @override
  AutenticacaoState get autenticacaoState => (_$autenticacaoStateComputed ??=
          Computed<AutenticacaoState>(() => super.autenticacaoState,
              name: '_AutenticacaoStore.autenticacaoState'))
      .value;

  final _$_autenticacaoFutureAtom =
      Atom(name: '_AutenticacaoStore._autenticacaoFuture');

  @override
  ObservableFuture<Usuario> get _autenticacaoFuture {
    _$_autenticacaoFutureAtom.reportRead();
    return super._autenticacaoFuture;
  }

  @override
  set _autenticacaoFuture(ObservableFuture<Usuario> value) {
    _$_autenticacaoFutureAtom.reportWrite(value, super._autenticacaoFuture, () {
      super._autenticacaoFuture = value;
    });
  }

  final _$_autenticacaoAtom = Atom(name: '_AutenticacaoStore._autenticacao');

  @override
  Usuario get _autenticacao {
    _$_autenticacaoAtom.reportRead();
    return super._autenticacao;
  }

  @override
  set _autenticacao(Usuario value) {
    _$_autenticacaoAtom.reportWrite(value, super._autenticacao, () {
      super._autenticacao = value;
    });
  }

  final _$_categoriaFutureAtom =
      Atom(name: '_AutenticacaoStore._categoriaFuture');

  @override
  ObservableFuture<List<Categoria>> get _categoriaFuture {
    _$_categoriaFutureAtom.reportRead();
    return super._categoriaFuture;
  }

  @override
  set _categoriaFuture(ObservableFuture<List<Categoria>> value) {
    _$_categoriaFutureAtom.reportWrite(value, super._categoriaFuture, () {
      super._categoriaFuture = value;
    });
  }

  final _$_categoriaObservableAtom =
      Atom(name: '_AutenticacaoStore._categoriaObservable');

  @override
  ObservableList<Categoria> get _categoriaObservable {
    _$_categoriaObservableAtom.reportRead();
    return super._categoriaObservable;
  }

  @override
  set _categoriaObservable(ObservableList<Categoria> value) {
    _$_categoriaObservableAtom.reportWrite(value, super._categoriaObservable,
        () {
      super._categoriaObservable = value;
    });
  }

  final _$_autenticandoAtom = Atom(name: '_AutenticacaoStore._autenticando');

  @override
  bool get _autenticando {
    _$_autenticandoAtom.reportRead();
    return super._autenticando;
  }

  @override
  set _autenticando(bool value) {
    _$_autenticandoAtom.reportWrite(value, super._autenticando, () {
      super._autenticando = value;
    });
  }

  final _$autenticacaoUsuarioAsyncAction =
      AsyncAction('_AutenticacaoStore.autenticacaoUsuario');

  @override
  Future<void> autenticacaoUsuario(Autenticacao dados) {
    return _$autenticacaoUsuarioAsyncAction
        .run(() => super.autenticacaoUsuario(dados));
  }

  final _$atualizaCategoriaUsuarioAsyncAction =
      AsyncAction('_AutenticacaoStore.atualizaCategoriaUsuario');

  @override
  Future<void> atualizaCategoriaUsuario(String id) {
    return _$atualizaCategoriaUsuarioAsyncAction
        .run(() => super.atualizaCategoriaUsuario(id));
  }

  @override
  String toString() {
    return '''
autenticacao: ${autenticacao},
categorias: ${categorias},
autenticando: ${autenticando},
autenticacaoState: ${autenticacaoState}
    ''';
  }
}
