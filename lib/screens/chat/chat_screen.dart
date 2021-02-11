import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hellohit/models/message_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/profile_store.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ProfileStore _profileStore;
  AutenticacaoStore _autenticacaoStore;
  String idArgs;

  final TextEditingController textEditingController = TextEditingController();

  TextEditingController _controllerMensagem = TextEditingController();

  var _text = Message(
    text: '',
  );

  Socket socket;

  _enviar() {
    sendMessage(String text) {
      socket.emit(
        'new_message',
        json.encode({
          'message': text,
        }),
      );
      //notifyListeners();
    }
  }

  /*List<Message> getMessagesForChatID(String chatID) {
    return messages
        .where((msg) => msg.senderID == chatID || msg.receiverID == chatID)
        .toList();
  }*/

  _enviarFoto() {}

  @override
  void didChangeDependencies() {
    _profileStore = Provider.of<ProfileStore>(context, listen: false);
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context, listen: false);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(_text.text);

    var caixaMensagem = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                onChanged: (text) => _text.text = text,
                controller: _controllerMensagem,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.orange[700],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                  hintText: "Message",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                  prefixIcon: IconButton(
                      icon: Icon(Icons.camera_alt), onPressed: _enviarFoto),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.orange[700],
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
            mini: true,
            onPressed: _enviar,
          )
        ],
      ),
    );

    var listView = Expanded(
      child: ListView.builder(
          itemCount: null,
          itemBuilder: (context, indice) {
            double larguraContainer = MediaQuery.of(context).size.width * 0.8;

            //larguraContainer -> 100
            //x                -> 80

            //Define cores e alinhamentos
            Alignment alinhamento = Alignment.centerRight;
            Color cor = Colors.orange[700];
            if (indice % 2 == 0) {
              //par
              alinhamento = Alignment.centerLeft;
              cor = Colors.white;
            }

            return Align(
              alignment: alinhamento,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Container(
                  width: larguraContainer,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          }),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 20,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(_autenticacaoStore.autenticacao.full_name),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              listView,
              caixaMensagem,
            ],
          ),
        )),
      ),
    );
  }
}
