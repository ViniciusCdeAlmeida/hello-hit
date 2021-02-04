// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStore, Store {
  Computed<Feed> _$feedComputed;

  @override
  Feed get feed => (_$feedComputed ??=
          Computed<Feed>(() => super.feed, name: '_FeedStore.feed'))
      .value;
  Computed<FeedState> _$marketplaceStateComputed;

  @override
  FeedState get marketplaceState => (_$marketplaceStateComputed ??=
          Computed<FeedState>(() => super.marketplaceState,
              name: '_FeedStore.marketplaceState'))
      .value;

  final _$_feedFutureAtom = Atom(name: '_FeedStore._feedFuture');

  @override
  ObservableFuture<Feed> get _feedFuture {
    _$_feedFutureAtom.reportRead();
    return super._feedFuture;
  }

  @override
  set _feedFuture(ObservableFuture<Feed> value) {
    _$_feedFutureAtom.reportWrite(value, super._feedFuture, () {
      super._feedFuture = value;
    });
  }

  final _$_feedAtom = Atom(name: '_FeedStore._feed');

  @override
  Feed get _feed {
    _$_feedAtom.reportRead();
    return super._feed;
  }

  @override
  set _feed(Feed value) {
    _$_feedAtom.reportWrite(value, super._feed, () {
      super._feed = value;
    });
  }

  final _$feedAsyncAction = AsyncAction('_FeedStore.seed');

  @override
  Future<void> feedL(Feed dados) {
    return _$feedAsyncAction.run(
      () => super.feedList(dados),
    );
  }

  @override
  String toString() {
    return '''
feed: ${feed},
marketplaceState: ${marketplaceState}
    ''';
  }
}
