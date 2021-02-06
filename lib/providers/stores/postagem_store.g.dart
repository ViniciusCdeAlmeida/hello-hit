// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postagem_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostagemStore on _PostagemStore, Store {
  Computed<Post> _$postagemComputed;

  @override
  Post get postagem => (_$postagemComputed ??=
          Computed<Post>(() => super.postagem, name: '_PostagemStore.postagem'))
      .value;
  Computed<PostagemState> _$postagemStateComputed;

  @override
  PostagemState get postagemState => (_$postagemStateComputed ??=
          Computed<PostagemState>(() => super.postagemState,
              name: '_PostagemStore.postagemState'))
      .value;

  final _$_postagemFutureAtom = Atom(name: '_PostagemStore._postagemFuture');

  @override
  ObservableFuture<Post> get _postagemFuture {
    _$_postagemFutureAtom.reportRead();
    return super._postagemFuture;
  }

  @override
  set _postagemFuture(ObservableFuture<Post> value) {
    _$_postagemFutureAtom.reportWrite(value, super._postagemFuture, () {
      super._postagemFuture = value;
    });
  }

  final _$_postagemAtom = Atom(name: '_PostagemStore._postagem');

  @override
  Post get _postagem {
    _$_postagemAtom.reportRead();
    return super._postagem;
  }

  @override
  set _postagem(Post value) {
    _$_postagemAtom.reportWrite(value, super._postagem, () {
      super._postagem = value;
    });
  }

  final _$fazerPostagemAsyncAction =
      AsyncAction('_PostagemStore.fazerPostagem');

  @override
  Future<Post> fazerPostagem(Post post) {
    return _$fazerPostagemAsyncAction.run(() => super.fazerPostagem(post));
  }

  @override
  String toString() {
    return '''
postagem: ${postagem},
postagemState: ${postagemState}
    ''';
  }
}
