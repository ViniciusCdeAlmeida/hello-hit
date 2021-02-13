// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comentario_post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComentarioPostStore on _ComentarioPostStore, Store {
  Computed<Comentario> _$comentarioComputed;

  @override
  Comentario get comentario =>
      (_$comentarioComputed ??= Computed<Comentario>(() => super.comentario,
              name: '_ComentarioPostStore.comentario'))
          .value;
  Computed<List<Comentario>> _$carreirasComputed;

  @override
  List<Comentario> get carreiras =>
      (_$carreirasComputed ??= Computed<List<Comentario>>(() => super.carreiras,
              name: '_ComentarioPostStore.carreiras'))
          .value;
  Computed<List<Comentario>> _$comentariosOriginalComputed;

  @override
  List<Comentario> get comentariosOriginal => (_$comentariosOriginalComputed ??=
          Computed<List<Comentario>>(() => super.comentariosOriginal,
              name: '_ComentarioPostStore.comentariosOriginal'))
      .value;
  Computed<ComentarioPostState> _$comentarioStateComputed;

  @override
  ComentarioPostState get comentarioState => (_$comentarioStateComputed ??=
          Computed<ComentarioPostState>(() => super.comentarioState,
              name: '_ComentarioPostStore.comentarioState'))
      .value;
  Computed<ComentarioPostListState> _$marketplaceListStateComputed;

  @override
  ComentarioPostListState get marketplaceListState =>
      (_$marketplaceListStateComputed ??= Computed<ComentarioPostListState>(
              () => super.marketplaceListState,
              name: '_ComentarioPostStore.marketplaceListState'))
          .value;

  final _$_comentarioObservableAtom =
      Atom(name: '_ComentarioPostStore._comentarioObservable');

  @override
  ObservableList<Comentario> get _comentarioObservable {
    _$_comentarioObservableAtom.reportRead();
    return super._comentarioObservable;
  }

  @override
  set _comentarioObservable(ObservableList<Comentario> value) {
    _$_comentarioObservableAtom.reportWrite(value, super._comentarioObservable,
        () {
      super._comentarioObservable = value;
    });
  }

  final _$reqAtom = Atom(name: '_ComentarioPostStore.req');

  @override
  bool get req {
    _$reqAtom.reportRead();
    return super.req;
  }

  @override
  set req(bool value) {
    _$reqAtom.reportWrite(value, super.req, () {
      super.req = value;
    });
  }

  final _$_comentarioFutureAtom =
      Atom(name: '_ComentarioPostStore._comentarioFuture');

  @override
  ObservableFuture<Comentario> get _comentarioFuture {
    _$_comentarioFutureAtom.reportRead();
    return super._comentarioFuture;
  }

  @override
  set _comentarioFuture(ObservableFuture<Comentario> value) {
    _$_comentarioFutureAtom.reportWrite(value, super._comentarioFuture, () {
      super._comentarioFuture = value;
    });
  }

  final _$_comentarioAtom = Atom(name: '_ComentarioPostStore._comentario');

  @override
  Comentario get _comentario {
    _$_comentarioAtom.reportRead();
    return super._comentario;
  }

  @override
  set _comentario(Comentario value) {
    _$_comentarioAtom.reportWrite(value, super._comentario, () {
      super._comentario = value;
    });
  }

  final _$_comentarioItensAtom =
      Atom(name: '_ComentarioPostStore._comentarioItens');

  @override
  ObservableList<Comentario> get _comentarioItens {
    _$_comentarioItensAtom.reportRead();
    return super._comentarioItens;
  }

  @override
  set _comentarioItens(ObservableList<Comentario> value) {
    _$_comentarioItensAtom.reportWrite(value, super._comentarioItens, () {
      super._comentarioItens = value;
    });
  }

  final _$_comentariosFutureAtom =
      Atom(name: '_ComentarioPostStore._comentariosFuture');

  @override
  ObservableFuture<List<Comentario>> get _comentariosFuture {
    _$_comentariosFutureAtom.reportRead();
    return super._comentariosFuture;
  }

  @override
  set _comentariosFuture(ObservableFuture<List<Comentario>> value) {
    _$_comentariosFutureAtom.reportWrite(value, super._comentariosFuture, () {
      super._comentariosFuture = value;
    });
  }

  final _$fazerComentarioAsyncAction =
      AsyncAction('_ComentarioPostStore.fazerComentario');

  @override
  Future<Comentario> fazerComentario(String id, Comentario post) {
    return _$fazerComentarioAsyncAction
        .run(() => super.fazerComentario(id, post));
  }

  @override
  String toString() {
    return '''
req: ${req},
comentario: ${comentario},
carreiras: ${carreiras},
comentariosOriginal: ${comentariosOriginal},
comentarioState: ${comentarioState},
marketplaceListState: ${marketplaceListState}
    ''';
  }
}
