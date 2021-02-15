// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AutenticacaoStore on _AutenticacaoStore, Store {
  Computed<Usuario> _$usuarioLogadoComputed;

  @override
  Usuario get usuarioLogado =>
      (_$usuarioLogadoComputed ??= Computed<Usuario>(() => super.usuarioLogado,
              name: '_AutenticacaoStore.usuarioLogado'))
          .value;
  Computed<List<Usuario>> _$usuariosComputed;

  @override
  List<Usuario> get usuarios =>
      (_$usuariosComputed ??= Computed<List<Usuario>>(() => super.usuarios,
              name: '_AutenticacaoStore.usuarios'))
          .value;
  Computed<List<Categoria>> _$categoriasComputed;

  @override
  List<Categoria> get categorias => (_$categoriasComputed ??=
          Computed<List<Categoria>>(() => super.categorias,
              name: '_AutenticacaoStore.categorias'))
      .value;
  Computed<List<Conversation>> _$conversationsComputed;

  @override
  List<Conversation> get conversations => (_$conversationsComputed ??=
          Computed<List<Conversation>>(() => super.conversations,
              name: '_AutenticacaoStore.conversations'))
      .value;
  Computed<List<Message>> _$messagesComputed;

  @override
  List<Message> get messages =>
      (_$messagesComputed ??= Computed<List<Message>>(() => super.messages,
              name: '_AutenticacaoStore.messages'))
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

  final _$_messageFutureAtom = Atom(name: '_AutenticacaoStore._messageFuture');

  @override
  ObservableFuture<List<Message>> get _messageFuture {
    _$_messageFutureAtom.reportRead();
    return super._messageFuture;
  }

  @override
  set _messageFuture(ObservableFuture<List<Message>> value) {
    _$_messageFutureAtom.reportWrite(value, super._messageFuture, () {
      super._messageFuture = value;
    });
  }

  final _$_messageObservableAtom =
      Atom(name: '_AutenticacaoStore._messageObservable');

  @override
  ObservableList<Message> get _messageObservable {
    _$_messageObservableAtom.reportRead();
    return super._messageObservable;
  }

  @override
  set _messageObservable(ObservableList<Message> value) {
    _$_messageObservableAtom.reportWrite(value, super._messageObservable, () {
      super._messageObservable = value;
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

  final _$_usuarioFutureAtom = Atom(name: '_AutenticacaoStore._usuarioFuture');

  @override
  ObservableFuture<List<Usuario>> get _usuarioFuture {
    _$_usuarioFutureAtom.reportRead();
    return super._usuarioFuture;
  }

  @override
  set _usuarioFuture(ObservableFuture<List<Usuario>> value) {
    _$_usuarioFutureAtom.reportWrite(value, super._usuarioFuture, () {
      super._usuarioFuture = value;
    });
  }

  final _$_usuarioObservableAtom =
      Atom(name: '_AutenticacaoStore._usuarioObservable');

  @override
  ObservableList<Usuario> get _usuarioObservable {
    _$_usuarioObservableAtom.reportRead();
    return super._usuarioObservable;
  }

  @override
  set _usuarioObservable(ObservableList<Usuario> value) {
    _$_usuarioObservableAtom.reportWrite(value, super._usuarioObservable, () {
      super._usuarioObservable = value;
    });
  }

  final _$_conversationFutureAtom =
      Atom(name: '_AutenticacaoStore._conversationFuture');

  @override
  ObservableFuture<List<Conversation>> get _conversationFuture {
    _$_conversationFutureAtom.reportRead();
    return super._conversationFuture;
  }

  @override
  set _conversationFuture(ObservableFuture<List<Conversation>> value) {
    _$_conversationFutureAtom.reportWrite(value, super._conversationFuture, () {
      super._conversationFuture = value;
    });
  }

  final _$_conversationObservableAtom =
      Atom(name: '_AutenticacaoStore._conversationObservable');

  @override
  ObservableList<Conversation> get _conversationObservable {
    _$_conversationObservableAtom.reportRead();
    return super._conversationObservable;
  }

  @override
  set _conversationObservable(ObservableList<Conversation> value) {
    _$_conversationObservableAtom
        .reportWrite(value, super._conversationObservable, () {
      super._conversationObservable = value;
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

  final _$atualizaCategoriaTimeAsyncAction =
      AsyncAction('_AutenticacaoStore.atualizaCategoriaTime');

  @override
  Future<void> atualizaCategoriaTime(String id) {
    return _$atualizaCategoriaTimeAsyncAction
        .run(() => super.atualizaCategoriaTime(id));
  }

  @override
  String toString() {
    return '''
usuarioLogado: ${usuarioLogado},
usuarios: ${usuarios},
categorias: ${categorias},
conversations: ${conversations},
messages: ${messages},
autenticando: ${autenticando},
autenticacaoState: ${autenticacaoState}
    ''';
  }
}
