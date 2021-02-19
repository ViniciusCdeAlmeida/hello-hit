import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/index_controllers.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

enum FeedState {
  inicial,
  carregando,
  carregado,
}

abstract class _FeedStore with Store {
  final FeedController _feedController;
  _FeedStore(this._feedController);

  @observable
  ObservableFuture<List<Post>> _feedFuture;

  @observable
  ObservableList<Post> _feedObservable = ObservableList<Post>();

  @observable
  List<Post> _feed;

  @computed
  List<Post> get feed {
    return _feedObservable;
  }

  @computed
  // ignore: missing_return
  FeedState get feedState {
    if ((_feedFuture == null)) {
      return FeedState.inicial;
    }

    if (_feedFuture.status == FutureStatus.pending) {
      return FeedState.carregando;
    }

    if (_feedFuture.status == FutureStatus.fulfilled || _feedFuture.status == FutureStatus.rejected)
      return FeedState.carregado;
  }

  @action
  Future feedList() async {
    var temp;
    if (_feedObservable.length != 0) temp = [..._feedObservable];
    _feedObservable.clear();
    try {
      _feedFuture = ObservableFuture(_feedController.getFeed(newSearch: true));
      _feedObservable = (await _feedFuture).asObservable();
    } catch (e) {
      _feedObservable.addAll(temp);
      throw e;
    }
  }

  @action
  Future feedListPagination() async {
    try {
      var _tempFuture = await _feedController.getFeed(newSearch: false);
      if (_tempFuture != null) _feedObservable.addAll(_tempFuture);
    } catch (e) {
      throw e;
    }
  }

  @action
  void updateFeed(String id) {
    final idx = _feedObservable.indexWhere((e) => e.id == id);
    _feedObservable.removeAt(idx);
  }
}
