import 'package:flutter/material.dart';
import 'package:hellohit/models/conversation_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ConversasScreen extends StatefulWidget {
  @override
  _ConversasScreenState createState() => _ConversasScreenState();
}

class _ConversasScreenState extends State<ConversasScreen> {
  AutenticacaoStore _autenticacaoStore;
  newChat() {
    Socket socket = io(
        'http://3.16.49.191:3000',
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.connect();

    /**
     *  
     *  conversation: {
     *    members: [
     *     {
     *        id: _autenticacaoStore._id
     *     },
     *     {
     *       id: 6023e2895df84a001ef4ef68 <UserId>
     *     }
     *    ],
     *    creator: _autenticacaoStore._id
     *  }
     * 
    */

    var conversation = {
      "members": [
        {"id": _autenticacaoStore.autenticacao.id},
        {"id": "6023e2895df84a001ef4ef68"}
      ],
      "creator": _autenticacaoStore.autenticacao.id,
    };

    socket.emit('new_chat', conversation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 20,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Conversas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/images/1.jpg'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              iconSize: 20,
              color: Colors.white,
              onPressed: () {
                newChat(); /* Chamada! */
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  //ContatosFavoritos(),
                  //ConversasRecentes(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
