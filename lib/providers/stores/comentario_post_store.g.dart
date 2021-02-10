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
  Computed<ComentarioPostState> _$comentarioStateComputed;

  @override
  ComentarioPostState get comentarioState => (_$comentarioStateComputed ??=
          Computed<ComentarioPostState>(() => super.comentarioState,
              name: '_ComentarioPostStore.comentarioState'))
      .value;

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
comentario: ${comentario},
comentarioState: ${comentarioState}
    ''';
  }
}
