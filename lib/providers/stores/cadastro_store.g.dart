// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  Computed<Cadastro> _$cadastroComputed;

  @override
  Cadastro get cadastro =>
      (_$cadastroComputed ??= Computed<Cadastro>(() => super.cadastro,
              name: '_CadastroStore.cadastro'))
          .value;
  Computed<bool> _$cadastrandoComputed;

  @override
  bool get cadastrando =>
      (_$cadastrandoComputed ??= Computed<bool>(() => super.cadastrando,
              name: '_CadastroStore.cadastrando'))
          .value;
  Computed<CadastroState> _$marketplaceStateComputed;

  @override
  CadastroState get marketplaceState => (_$marketplaceStateComputed ??=
          Computed<CadastroState>(() => super.marketplaceState,
              name: '_CadastroStore.marketplaceState'))
      .value;

  final _$_cadastrandoAtom = Atom(name: '_CadastroStore._cadastrando');

  @override
  bool get _cadastrando {
    _$_cadastrandoAtom.reportRead();
    return super._cadastrando;
  }

  @override
  set _cadastrando(bool value) {
    _$_cadastrandoAtom.reportWrite(value, super._cadastrando, () {
      super._cadastrando = value;
    });
  }

  final _$_cadastroFutureAtom = Atom(name: '_CadastroStore._cadastroFuture');

  @override
  ObservableFuture<Cadastro> get _cadastroFuture {
    _$_cadastroFutureAtom.reportRead();
    return super._cadastroFuture;
  }

  @override
  set _cadastroFuture(ObservableFuture<Cadastro> value) {
    _$_cadastroFutureAtom.reportWrite(value, super._cadastroFuture, () {
      super._cadastroFuture = value;
    });
  }

  final _$_cadastroAtom = Atom(name: '_CadastroStore._cadastro');

  @override
  Cadastro get _cadastro {
    _$_cadastroAtom.reportRead();
    return super._cadastro;
  }

  @override
  set _cadastro(Cadastro value) {
    _$_cadastroAtom.reportWrite(value, super._cadastro, () {
      super._cadastro = value;
    });
  }

  final _$cadastroUsuarioAsyncAction =
      AsyncAction('_CadastroStore.cadastroUsuario');

  @override
  Future<Cadastro> cadastroUsuario(Cadastro usuario) {
    return _$cadastroUsuarioAsyncAction
        .run(() => super.cadastroUsuario(usuario));
  }

  @override
  String toString() {
    return '''
cadastro: ${cadastro},
cadastrando: ${cadastrando},
marketplaceState: ${marketplaceState}
    ''';
  }
}
