// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStore, Store {
  Computed<List<Message>> _$messageSendComputed;

  @override
  List<Message> get messageSend => (_$messageSendComputed ??=
          Computed<List<Message>>(() => super.messageSend,
              name: '_ChatStore.messageSend'))
      .value;
  Computed<List<Message>> _$messageReceivedComputed;

  @override
  List<Message> get messageReceived => (_$messageReceivedComputed ??=
          Computed<List<Message>>(() => super.messageReceived,
              name: '_ChatStore.messageReceived'))
      .value;
  Computed<MessagesState> _$messagesStateComputed;

  @override
  MessagesState get messagesState => (_$messagesStateComputed ??=
          Computed<MessagesState>(() => super.messagesState,
              name: '_ChatStore.messagesState'))
      .value;

  final _$_socketAtom = Atom(name: '_ChatStore._socket');

  @override
  Socket get _socket {
    _$_socketAtom.reportRead();
    return super._socket;
  }

  @override
  set _socket(Socket value) {
    _$_socketAtom.reportWrite(value, super._socket, () {
      super._socket = value;
    });
  }

  final _$_messagesReceivedFutureAtom =
      Atom(name: '_ChatStore._messagesReceivedFuture');

  @override
  ObservableFuture<List<Message>> get _messagesReceivedFuture {
    _$_messagesReceivedFutureAtom.reportRead();
    return super._messagesReceivedFuture;
  }

  @override
  set _messagesReceivedFuture(ObservableFuture<List<Message>> value) {
    _$_messagesReceivedFutureAtom
        .reportWrite(value, super._messagesReceivedFuture, () {
      super._messagesReceivedFuture = value;
    });
  }

  final _$_messageSendAtom = Atom(name: '_ChatStore._messageSend');

  @override
  ObservableList<Message> get _messageSend {
    _$_messageSendAtom.reportRead();
    return super._messageSend;
  }

  @override
  set _messageSend(ObservableList<Message> value) {
    _$_messageSendAtom.reportWrite(value, super._messageSend, () {
      super._messageSend = value;
    });
  }

  final _$_messageReceivedAtom = Atom(name: '_ChatStore._messageReceived');

  @override
  ObservableList<Message> get _messageReceived {
    _$_messageReceivedAtom.reportRead();
    return super._messageReceived;
  }

  @override
  set _messageReceived(ObservableList<Message> value) {
    _$_messageReceivedAtom.reportWrite(value, super._messageReceived, () {
      super._messageReceived = value;
    });
  }

  final _$verificaMessageAsyncAction =
      AsyncAction('_ChatStore.verificaMessage');

  @override
  Future<void> verificaMessage(
      {String idReceiver, String idSender, String idConversation}) {
    return _$verificaMessageAsyncAction.run(() => super.verificaMessage(
        idReceiver: idReceiver,
        idSender: idSender,
        idConversation: idConversation));
  }

  final _$_ChatStoreActionController = ActionController(name: '_ChatStore');

  @override
  void sendMessage({String idReceiver, String idSender, String message}) {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.sendMessage');
    try {
      return super.sendMessage(
          idReceiver: idReceiver, idSender: idSender, message: message);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messageSend: ${messageSend},
messageReceived: ${messageReceived},
messagesState: ${messagesState}
    ''';
  }
}
