import 'package:hellohit/models/feed_model.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/providers/feed_controller.dart';
import 'package:mobx/mobx.dart';

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
    if ((_feedFuture == null || _feedFuture.status == FutureStatus.rejected)) {
      return FeedState.inicial;
    }

    if (_feedFuture.status == FutureStatus.pending) {
      return FeedState.carregando;
    }

    if (_feedFuture.status == FutureStatus.fulfilled)
      return FeedState.carregado;
  }

  @action
  Future feedList() async {
    try {
      _feedFuture = ObservableFuture(_feedController.getFeed());
      _feedObservable = (await _feedFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }
}
