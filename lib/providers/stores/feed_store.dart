import 'package:hellohit/models/feed_model.dart';
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
  ObservableFuture<Feed> _feedFuture;

  @observable
  Feed _feed;

  @computed
  Feed get feed {
    return _feed;
  }

  @computed
  // ignore: missing_return
  FeedState get marketplaceState {
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
  Future<Feed> feedList(Feed dados) async {
    try {
      _feedFuture = ObservableFuture(_feedController.feedList(dados));
      _feed = await _feedFuture;
    } catch (e) {
      throw e;
    }
  }
}
