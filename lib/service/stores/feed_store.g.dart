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
  Computed<List<Post>> _$feedBookmarkComputed;

  @override
  List<Post> get feedBookmark =>
      (_$feedBookmarkComputed ??= Computed<List<Post>>(() => super.feedBookmark,
              name: '_FeedStore.feedBookmark'))
          .value;
  Computed<FeedState> _$feedStateComputed;

  @override
  FeedState get feedState =>
      (_$feedStateComputed ??= Computed<FeedState>(() => super.feedState,
              name: '_FeedStore.feedState'))
          .value;
  Computed<FeedState> _$feedBookmarkStateComputed;

  @override
  FeedState get feedBookmarkState => (_$feedBookmarkStateComputed ??=
          Computed<FeedState>(() => super.feedBookmarkState,
              name: '_FeedStore.feedBookmarkState'))
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

  final _$_feedBookmarkFutureAtom =
      Atom(name: '_FeedStore._feedBookmarkFuture');

  @override
  ObservableFuture<List<Post>> get _feedBookmarkFuture {
    _$_feedBookmarkFutureAtom.reportRead();
    return super._feedBookmarkFuture;
  }

  @override
  set _feedBookmarkFuture(ObservableFuture<List<Post>> value) {
    _$_feedBookmarkFutureAtom.reportWrite(value, super._feedBookmarkFuture, () {
      super._feedBookmarkFuture = value;
    });
  }

  final _$_feedBookmarkObservableAtom =
      Atom(name: '_FeedStore._feedBookmarkObservable');

  @override
  ObservableList<Post> get _feedBookmarkObservable {
    _$_feedBookmarkObservableAtom.reportRead();
    return super._feedBookmarkObservable;
  }

  @override
  set _feedBookmarkObservable(ObservableList<Post> value) {
    _$_feedBookmarkObservableAtom
        .reportWrite(value, super._feedBookmarkObservable, () {
      super._feedBookmarkObservable = value;
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

  final _$_feedBookmarkAtom = Atom(name: '_FeedStore._feedBookmark');

  @override
  List<Post> get _feedBookmark {
    _$_feedBookmarkAtom.reportRead();
    return super._feedBookmark;
  }

  @override
  set _feedBookmark(List<Post> value) {
    _$_feedBookmarkAtom.reportWrite(value, super._feedBookmark, () {
      super._feedBookmark = value;
    });
  }

  final _$feedListAsyncAction = AsyncAction('_FeedStore.feedList');

  @override
  Future<dynamic> feedList() {
    return _$feedListAsyncAction.run(() => super.feedList());
  }

  final _$feedListPaginationAsyncAction =
      AsyncAction('_FeedStore.feedListPagination');

  @override
  Future<dynamic> feedListPagination() {
    return _$feedListPaginationAsyncAction
        .run(() => super.feedListPagination());
  }

  final _$feedBookmarkListAsyncAction =
      AsyncAction('_FeedStore.feedBookmarkList');

  @override
  Future<dynamic> feedBookmarkList(String id) {
    return _$feedBookmarkListAsyncAction.run(() => super.feedBookmarkList(id));
  }

  final _$feedBookmarkListPaginationAsyncAction =
      AsyncAction('_FeedStore.feedBookmarkListPagination');

  @override
  Future<dynamic> feedBookmarkListPagination(String id) {
    return _$feedBookmarkListPaginationAsyncAction
        .run(() => super.feedBookmarkListPagination(id));
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
  void updateFeedBookmark(String id) {
    final _$actionInfo = _$_FeedStoreActionController.startAction(
        name: '_FeedStore.updateFeedBookmark');
    try {
      return super.updateFeedBookmark(id);
    } finally {
      _$_FeedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
feed: ${feed},
feedBookmark: ${feedBookmark},
feedState: ${feedState},
feedBookmarkState: ${feedBookmarkState}
    ''';
  }
}
