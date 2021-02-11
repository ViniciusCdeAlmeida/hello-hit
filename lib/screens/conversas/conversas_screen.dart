import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/conversation_store.dart';
import 'package:hellohit/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ConversasScreen extends StatefulWidget {
  static const routeName = "/conversasScreen";
  @override
  _ConversasScreenState createState() => _ConversasScreenState();
}

class _ConversasScreenState extends State<ConversasScreen> {
  AutenticacaoStore _autenticacaoStore;
  ConversationStore _conversationStore;
  String id;
  String idUsuario;

  @override
  void didChangeDependencies() {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    _conversationStore = Provider.of<ConversationStore>(context);
    idUsuario = _autenticacaoStore.usuarioLogado.id;
    id = ModalRoute.of(context).settings.arguments;
    _conversationStore.conversationList();
    super.didChangeDependencies();
  }

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
    */

    var conversation = {
      "members": [
        {"id": "6022b6eb51f309001d3e8bbe"},
        {"id": "6023e2895df84a001ef4ef68"}
      ],
      "creator": '6022b6eb51f309001d3e8bbe',
    };

    socket.emit('new_chat', conversation);

    /* [GET] /chats/user <- Lista as conversas do seu usuário (precisa estar autenticado) */

    //socket.emit("new_message" {...messsage}) <- Para enviar mensagens

    //var messa

    /* Redirecionar para a tela de chat */
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(),
      ),
    );
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
      body: Observer(
        builder: (_) {
          switch (_conversationStore.conversationState) {
            case ConversationState.inicial:
            case ConversationState.carregando:
              return Center(
                child: CircularProgressIndicator(
                    //backgroundColor: Colors.orange[700],
                    ),
              );
            case ConversationState.carregado:
              return CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      /*OportunidadeItem(
                        _conversationStore.conv,
                        idUsuario,
                      ),*/
                    ]),
                  ),
                ],
              );
          }
          ConversationState.carregado == null
              ? Center(
                  child: const Text('Inicie uma conversa'),
                )
              : Center(
                  child: const Text('Inicie uma conversa'),
                );
        },
      ),
    );
  }
}
