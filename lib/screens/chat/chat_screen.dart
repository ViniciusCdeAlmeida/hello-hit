import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/service/stores/chat_store.dart';
import 'package:hellohit/utils/keys.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:hellohit/service/stores/index_stores.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AutenticacaoStore _autenticacaoStore;
  String idUsuario;
  String idReceiver;
  String idConversation;
  String userName;
  String _textMessage;
  Socket socket;
  ChatStore _chatStore;
  TextEditingController messageController;
  final _chatKey = GlobalKey();
  ScrollController _scrollController = ScrollController();

  // var _text = Message(
  //   text: '',
  // );

  // _enviarFoto() {}

  @override
  void didChangeDependencies() {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context, listen: false);
    _chatStore = Provider.of<ChatStore>(context, listen: false);
    idUsuario = _autenticacaoStore.usuarioLogado.id;
    Map args = ModalRoute.of(context).settings.arguments;
    userName = args['username'];
    idReceiver = args['idReceiver'];
    idConversation = args['idConversation'];
    _chatStore.verificaMessage(idReceiver: idReceiver, idSender: idUsuario, idConversation: idConversation);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _chatStore.saiSala();
    super.dispose();
  }

  void fimPagina() {
    Future.delayed(Duration(microseconds: 1)).then((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void enviaMessage() {
    if (_textMessage.length > 0) {
      _chatStore.sendMessage(
        idReceiver: idReceiver,
        idSender: idUsuario,
        message: _textMessage,
      );
      _textMessage = null;
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context, listen: false);
    _chatStore = Provider.of<ChatStore>(context, listen: false);
    idUsuario = _autenticacaoStore.usuarioLogado.id;

    return Scaffold(
      key: _chatKey,
      appBar: AppBar(
        leading: IconButton(
          key: Key(Keys.backPageChatScreen),
          icon: Icon(Icons.arrow_back),
          iconSize: 20,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(userName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 70,
              // height: 200,
              child: Observer(
                // ignore: missing_return
                builder: (_) {
                  switch (_chatStore.messagesState) {
                    case MessagesState.inicial:
                    case MessagesState.digitando:
                      return Container();
                    case MessagesState.carregando:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case MessagesState.carregado:
                      fimPagina();
                      return SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            Column(
                              children: _chatStore.messageReceived
                                  .map(
                                    (received) => Align(
                                      alignment: received.author == _autenticacaoStore.usuarioLogado.id
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: received.author == _autenticacaoStore.usuarioLogado.id
                                                ? Colors.orange[700]
                                                : Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            received.text,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      );
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  cursorColor: Color(0xFFE0651F),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      color: Colors.orange[700],
                      icon: Icon(Icons.send),
                      onPressed: enviaMessage,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color(0xFFE0651F),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    labelText: 'Message',
                    labelStyle: TextStyle(color: Color(0xFFE0651F)),
                    hintStyle: TextStyle(color: Color(0xFFE0651F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onEditingComplete: enviaMessage,
                  controller: messageController,
                  onChanged: (texto) => _textMessage = texto,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
