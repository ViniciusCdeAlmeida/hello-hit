import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ListaUsuarios extends StatefulWidget {
  static const routeName = '/listaUsuarios';
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  List<Usuario> _usuarios;
  AutenticacaoStore _autenticacaoStore;
  String idArgs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    _usuarios = _autenticacaoStore.usuarios;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
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
                      itemCount: _usuarios.length,
                      itemBuilder: (_, idx) => Column(
                        children: [
                          if (_usuarios[idx].id !=
                              _autenticacaoStore.usuarioLogado.id)
                            ListTile(
                              title: Text(_usuarios[idx].username),
                              leading: CircleAvatar(
                                backgroundImage: _usuarios[idx].avatar == null
                                    ? AssetImage(
                                        'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                                    : NetworkImage(
                                        _usuarios[idx].avatar['url'],
                                      ),
                              ),
                              onTap: () {
                                Socket socket = io(
                                    'http://developer.api.hellohit.co',
                                    OptionBuilder()
                                        .setTransports([
                                          'websocket'
                                        ]) // for Flutter or Dart VM
                                        .disableAutoConnect() // disable auto-connection
                                        .setExtraHeaders(
                                            {'foo': 'bar'}) // optional
                                        .build());
                                socket.connect();

                                var conversation = {
                                  "receiver": _usuarios[idx].id,
                                  "sender": _autenticacaoStore.usuarioLogado.id,
                                };

                                socket.emit('new_chat', conversation);

                                /* Redirecionar para a tela de chat */
                                Navigator.of(context).pushNamed(
                                  ChatScreen.routeName,
                                  arguments: _usuarios[idx].username,
                                );
                                print(
                                  'Criador: ' +
                                      _autenticacaoStore.usuarioLogado.id +
                                      '\n' +
                                      'Outro Menmbro: ' +
                                      _usuarios[idx].id,
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
