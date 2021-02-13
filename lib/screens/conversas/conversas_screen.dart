import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/conversation_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/screens/chat/chat_screen.dart';
import 'package:hellohit/screens/lista_usuarios/lista_usuarios_screen.dart';
import 'package:provider/provider.dart';

class ConversasScreen extends StatefulWidget {
  static const routeName = "/conversasScreen";
  @override
  _ConversasScreenState createState() => _ConversasScreenState();
}

class _ConversasScreenState extends State<ConversasScreen> {
  AutenticacaoStore _autenticacaoStore;
  String id;
  String idUsuario;
  List<Conversation> _conversations;

  @override
  void didChangeDependencies() {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    idUsuario = _autenticacaoStore.usuarioLogado.id;
    id = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    _conversations = _autenticacaoStore.conversations;

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
                Navigator.of(context).pushNamed(ListaUsuarios.routeName);
                //newChat(); /* Chamada! */
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Observer(
            builder: (_) {
              switch (_autenticacaoStore.autenticacaoState) {
                case AutenticacaoState.inicial:
                case AutenticacaoState.carregando:
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  );
                case AutenticacaoState.carregado:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _conversations.length,
                      itemBuilder: (_, idx) => Column(
                        children: [
                          if (_conversations[idx].sender.id ==
                              _autenticacaoStore.usuarioLogado.id)
                            ListTile(
                              title:
                                  Text(_conversations[idx].receiver.username),
                              leading: CircleAvatar(
                                backgroundImage: _conversations[idx]
                                            .receiver
                                            .avatar ==
                                        null
                                    ? AssetImage(
                                        'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                                    : NetworkImage(
                                        _conversations[idx]
                                            .receiver
                                            .avatar['url'],
                                      ),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    ChatScreen.routeName,
                                    arguments: {
                                      _conversations[idx].receiver.username,
                                      _conversations[idx].id,
                                    }
                                    //_conversations[idx].receiver.username,
                                    //_conversations[idx],
                                    );
                              },
                            ),
                        ],
                      ),
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
