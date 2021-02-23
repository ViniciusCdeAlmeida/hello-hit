import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/stores/index_stores.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AutenticacaoStore _autenticacaoStore;

  String idUsuario;
  String idConversation;
  String userName;
  String _textMessage;

  var _text = Message(
    text: '',
  );

  _enviarFoto() {}

  @override
  void didChangeDependencies() {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context, listen: false);
    idUsuario = _autenticacaoStore.usuarioLogado.id;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context, listen: false);
    idUsuario = _autenticacaoStore.usuarioLogado.id;
    idConversation = ModalRoute.of(context).settings.arguments;
    userName = ModalRoute.of(context).settings.arguments;

    // print('Usuario Logado ' + idUsuario);
    // print("Id conversa " + idConversation);
    // print('User Name ' + userName);

    var caixaMensagem = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                //onChanged: (text) => _text.text = text,
                onChanged: (texto) => _textMessage,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.orange[700],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                  hintText: "Message",
                  hintStyle: TextStyle(fontSize: 15),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  /*prefixIcon: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: _enviarFoto,
                  ),*/
                ),
              ),
            ),
          ),
          IconButton(
            color: Colors.orange[700],
            icon: Icon(Icons.send),
            onPressed: () {
              Socket socket = io(
                  'http://developer.api.hellohit.co',
                  OptionBuilder()
                      .setTransports(
                        ['websocket'],
                      ) // for Flutter or Dart VM
                      .disableAutoConnect() // disable auto-connection
                      .setExtraHeaders({'foo': 'bar'}) // optional
                      .build());
              socket.connect();

              /*var conversation = {
                "receiver": _usuarios[idx].id,
                "sender": _autenticacaoStore.usuarioLogado.id,
              };*/

              var message = {'author': idUsuario, 'conversation': '_conversation.id', 'text': 'Olá'};

              socket.emit('new_message', message);
            },
          ),
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

          /*return Align(
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
          );*/
        },
      ),
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
        title: Text('idArgs'),
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
