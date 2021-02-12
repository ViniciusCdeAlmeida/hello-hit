// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStore, Store {
  Computed<List<Post>> _$feedComputed;

  @override
  List<Post> get feed => (_$feedComputed ??=
          Computed<List<Post>>(() => super.feed, name: '_FeedStore.feed'))
      .value;
  Computed<FeedState> _$feedStateComputed;

  @override
  FeedState get feedState =>
      (_$feedStateComputed ??= Computed<FeedState>(() => super.feedState,
              name: '_FeedStore.feedState'))
          .value;

  final _$_feedFutureAtom = Atom(name: '_FeedStore._feedFuture');

  @override
  ObservableFuture<List<Post>> get _feedFuture {
    _$_feedFutureAtom.reportRead();
    return super._feedFuture;
  }

  @override
  set _feedFuture(ObservableFuture<List<Post>> value) {
    _$_feedFutureAtom.reportWrite(value, super._feedFuture, () {
      super._feedFuture = value;
    });
  }

  final _$_feedObservableAtom = Atom(name: '_FeedStore._feedObservable');

  @override
  ObservableList<Post> get _feedObservable {
    _$_feedObservableAtom.reportRead();
    return super._feedObservable;
  }

  @override
  set _feedObservable(ObservableList<Post> value) {
    _$_feedObservableAtom.reportWrite(value, super._feedObservable, () {
      super._feedObservable = value;
    });
  }

  final _$_feedAtom = Atom(name: '_FeedStore._feed');

  @override
  List<Post> get _feed {
    _$_feedAtom.reportRead();
    return super._feed;
  }

  @override
  set _feed(List<Post> value) {
    _$_feedAtom.reportWrite(value, super._feed, () {
      super._feed = value;
    });
  }

  final _$feedListAsyncAction = AsyncAction('_FeedStore.feedList');

  @override
  Future<dynamic> feedList() {
    return _$feedListAsyncAction.run(() => super.feedList());
  }

  final _$_FeedStoreActionController = ActionController(name: '_FeedStore');

  @override
  void updateFeed(String id) {
    final _$actionInfo =
        _$_FeedStoreActionController.startAction(name: '_FeedStore.updateFeed');
    try {
      return super.updateFeed(id);
    } finally {
      _$_FeedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
feed: ${feed},
feedState: ${feedState}
    ''';
  }
}
