// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AutenticacaoStore on _AutenticacaoStore, Store {
  Computed<Autenticacao> _$autenticacaoComputed;

  @override
  Autenticacao get autenticacao => (_$autenticacaoComputed ??=
          Computed<Autenticacao>(() => super.autenticacao,
              name: '_AutenticacaoStore.autenticacao'))
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
  ObservableFuture<Autenticacao> get _autenticacaoFuture {
    _$_autenticacaoFutureAtom.reportRead();
    return super._autenticacaoFuture;
  }

  @override
  set _autenticacaoFuture(ObservableFuture<Autenticacao> value) {
    _$_autenticacaoFutureAtom.reportWrite(value, super._autenticacaoFuture, () {
      super._autenticacaoFuture = value;
    });
  }

  final _$_autenticacaoAtom = Atom(name: '_AutenticacaoStore._autenticacao');

  @override
  Autenticacao get _autenticacao {
    _$_autenticacaoAtom.reportRead();
    return super._autenticacao;
  }

  @override
  set _autenticacao(Autenticacao value) {
    _$_autenticacaoAtom.reportWrite(value, super._autenticacao, () {
      super._autenticacao = value;
    });
  }

  final _$autenticacaoUsuarioAsyncAction =
      AsyncAction('_AutenticacaoStore.autenticacaoUsuario');

  @override
  Future<void> autenticacaoUsuario(Autenticacao dados) {
    return _$autenticacaoUsuarioAsyncAction
        .run(() => super.autenticacaoUsuario(dados));
  }

  @override
  String toString() {
    return '''
autenticacao: ${autenticacao},
autenticacaoState: ${autenticacaoState}
    ''';
  }
}
