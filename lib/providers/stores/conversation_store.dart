import 'package:hellohit/models/conversation_model.dart';
import 'package:hellohit/providers/conversation_controller.dart';
import 'package:mobx/mobx.dart';
part 'conversation_store.g.dart';

class ConversationStore = _ConversationStore with _$ConversationStore;

enum ConversationState {
  inicial,
  carregando,
  carregado,
}

abstract class _ConversationStore with Store {
  final ConversationController _conversationController;
  _ConversationStore(this._conversationController);

  @observable
  ObservableFuture<List<Conversation>> _conversationFuture;

  @observable
  ObservableList<Conversation> _conversationObservable =
      ObservableList<Conversation>();

  @observable
  List<Conversation> _conversation;

  @computed
  List<Conversation> get conv {
    return _conversationObservable;
  }

  @computed
  // ignore: missing_return
  ConversationState get conversationState {
    if ((_conversationFuture == null ||
        _conversationFuture.status == FutureStatus.rejected)) {
      return ConversationState.inicial;
    }

    if (_conversationFuture.status == FutureStatus.pending) {
      return ConversationState.carregando;
    }

    if (_conversationFuture.status == FutureStatus.fulfilled)
      return ConversationState.carregado;
  }

  @action
  Future conversationList() async {
    try {
      _conversationFuture =
          ObservableFuture(_conversationController.getConversationList());
      _conversationObservable = (await _conversationFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }
}
