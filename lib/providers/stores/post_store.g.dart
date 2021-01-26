// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStore, Store {
  Computed<List<Post>> _$postsComputed;

  @override
  List<Post> get posts => (_$postsComputed ??=
          Computed<List<Post>>(() => super.posts, name: '_PostStore.posts'))
      .value;
  Computed<PostState> _$postStateComputed;

  @override
  PostState get postState =>
      (_$postStateComputed ??= Computed<PostState>(() => super.postState,
              name: '_PostStore.postState'))
          .value;

  final _$_postsObservableAtom = Atom(name: '_PostStore._postsObservable');

  @override
  ObservableList<Post> get _postsObservable {
    _$_postsObservableAtom.reportRead();
    return super._postsObservable;
  }

  @override
  set _postsObservable(ObservableList<Post> value) {
    _$_postsObservableAtom.reportWrite(value, super._postsObservable, () {
      super._postsObservable = value;
    });
  }

  final _$_postFutureAtom = Atom(name: '_PostStore._postFuture');

  @override
  ObservableFuture<List<Post>> get _postFuture {
    _$_postFutureAtom.reportRead();
    return super._postFuture;
  }

  @override
  set _postFuture(ObservableFuture<List<Post>> value) {
    _$_postFutureAtom.reportWrite(value, super._postFuture, () {
      super._postFuture = value;
    });
  }

  final _$seedAsyncAction = AsyncAction('_PostStore.seed');

  @override
  Future<void> seed() {
    return _$seedAsyncAction.run(() => super.seed());
  }

  @override
  String toString() {
    return '''
posts: ${posts},
postState: ${postState}
    ''';
  }
}
