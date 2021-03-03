import 'dart:async';
import 'dart:io';

import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/controllers/chat_controller.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

enum MessagesState { inicial, carregando, carregado, digitando }

abstract class _ChatStore with Store {
  final ChatController _chatController;
  _ChatStore(this._chatController);

  StreamSubscription<Message> _subscriber;

  @observable
  Socket _socket;

  @observable
  ObservableFuture<List<Message>> _messagesReceivedFuture;

  @observable
  ObservableList<Message> _messageSend = ObservableList<Message>();

  @observable
  ObservableList<Message> _messageReceived = ObservableList<Message>();

  @computed
  List<Message> get messageSend {
    return [..._messageSend];
  }

  @computed
  List<Message> get messageReceived {
    return [..._messageReceived];
  }

  @computed
  // ignore: missing_return
  MessagesState get messagesState {
    if ((_messagesReceivedFuture == null || _messagesReceivedFuture.status == FutureStatus.rejected)) {
      return MessagesState.inicial;
    }

    if (_messagesReceivedFuture.status == FutureStatus.pending) {
      return MessagesState.carregando;
    }

    if (_messagesReceivedFuture.status == FutureStatus.fulfilled) return MessagesState.carregado;
  }

  @action
  Future<void> verificaMessage({String idReceiver, String idSender, String idConversation}) async {
    _socket = _chatController.configSocket({
      "receiver": idReceiver,
      "sender": idSender,
      "idConversation": idConversation,
    });

    try {
      _messagesReceivedFuture =
          ObservableFuture(_chatController.retrieveMessage(idReceiver: idReceiver, idSender: idSender));
      _messageReceived = (await _messagesReceivedFuture).asObservable();
    } on Exception catch (e) {
      throw e;
    }

    if (idReceiver == idSender) {
      _subscriber = _chatController
          .listenOurMessage(idReceiver: idReceiver, idSender: idSender, idConversation: idConversation)
          .listen((event) {
        _messageReceived.add(event);
      });
    } else
      _subscriber = _chatController.listenMessage(socket: _socket).listen((event) {
        _messageReceived.add(event);
      });
  }

  void saiSala() {
    _chatController.disconnectRoom(socket: _socket);
    _subscriber?.cancel();
    _messageReceived.clear();
    _messageSend.clear();
  }

  @action
  void sendMessage({String idReceiver, String idSender, String message}) {
    _chatController.sendMessage(
      idReceiver: idReceiver,
      idSender: idSender,
      message: message,
      socket: _socket,
    );
    // _messageReceived.add(Message(
    //   author: idSender,
    //   text: message,
    // ));
  }
}
