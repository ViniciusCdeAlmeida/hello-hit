import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/screens/index_screens.dart';
import 'package:hellohit/service/stores/index_stores.dart';

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
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Observer(
            // ignore: missing_return
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
                          if (_conversations[idx].sender.id == _autenticacaoStore.usuarioLogado.id)
                            ListTile(
                              title: Text(_conversations[idx].receiver.username),
                              leading: CircleAvatar(
                                backgroundImage: _conversations[idx].receiver.avatar == null
                                    ? AssetImage('assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                                    : NetworkImage(
                                        _conversations[idx]
                                            .receiver
                                            .avatar['url']
                                            .toString()
                                            .replaceAll(RegExp(r'localhost'), '192.168.15.14')
                                            .toString(),
                                      ),
                              ),
                              onTap: () {
                                Map args = {
                                  'username': _conversations[idx].receiver.username,
                                  'idReceiver': _conversations[idx].receiver.id,
                                  'idConversation': _conversations[idx].id
                                };
                                Navigator.of(context).pushNamed(ChatScreen.routeName, arguments: args);
                              },
                            )
                          else
                            ListTile(
                              title: Text(_conversations[idx].sender.username),
                              leading: CircleAvatar(
                                backgroundImage: _conversations[idx].sender.avatar == null
                                    ? AssetImage('assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                                    : NetworkImage(
                                        _conversations[idx]
                                            .sender
                                            .avatar['url']
                                            .toString()
                                            .replaceAll(RegExp(r'localhost'), '192.168.15.14')
                                            .toString(),
                                      ),
                              ),
                              onTap: () {
                                Map args = {
                                  'username': _conversations[idx].sender.username,
                                  'idReceiver': _conversations[idx].sender.id,
                                  'idConversation': _conversations[idx].id
                                };
                                Navigator.of(context).pushNamed(ChatScreen.routeName, arguments: args);
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
