// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConversationStore on _ConversationStore, Store {
  Computed<List<Conversation>> _$convComputed;

  @override
  List<Conversation> get conv =>
      (_$convComputed ??= Computed<List<Conversation>>(() => super.conv,
              name: '_ConversationStore.conv'))
          .value;
  Computed<ConversationState> _$conversationStateComputed;

  @override
  ConversationState get conversationState => (_$conversationStateComputed ??=
          Computed<ConversationState>(() => super.conversationState,
              name: '_ConversationStore.conversationState'))
      .value;

  final _$_conversationFutureAtom =
      Atom(name: '_ConversationStore._conversationFuture');

  @override
  ObservableFuture<List<Conversation>> get _conversationFuture {
    _$_conversationFutureAtom.reportRead();
    return super._conversationFuture;
  }

  @override
  set _conversationFuture(ObservableFuture<List<Conversation>> value) {
    _$_conversationFutureAtom.reportWrite(value, super._conversationFuture, () {
      super._conversationFuture = value;
    });
  }

  final _$_conversationObservableAtom =
      Atom(name: '_ConversationStore._conversationObservable');

  @override
  ObservableList<Conversation> get _conversationObservable {
    _$_conversationObservableAtom.reportRead();
    return super._conversationObservable;
  }

  @override
  set _conversationObservable(ObservableList<Conversation> value) {
    _$_conversationObservableAtom
        .reportWrite(value, super._conversationObservable, () {
      super._conversationObservable = value;
    });
  }

  final _$_conversationAtom = Atom(name: '_ConversationStore._conversation');

  @override
  List<Conversation> get _conversation {
    _$_conversationAtom.reportRead();
    return super._conversation;
  }

  @override
  set _conversation(List<Conversation> value) {
    _$_conversationAtom.reportWrite(value, super._conversation, () {
      super._conversation = value;
    });
  }

  final _$conversationListAsyncAction =
      AsyncAction('_ConversationStore.conversationList');

  @override
  Future<dynamic> conversationList() {
    return _$conversationListAsyncAction.run(() => super.conversationList());
  }

  @override
  String toString() {
    return '''
conv: ${conv},
conversationState: ${conversationState}
    ''';
  }
}
