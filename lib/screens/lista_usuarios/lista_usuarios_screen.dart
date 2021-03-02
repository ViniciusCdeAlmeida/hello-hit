import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/service/controllers/chat_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/screens/index_screens.dart';
import 'package:hellohit/service/stores/index_stores.dart';

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
                      itemCount: _usuarios.length,
                      itemBuilder: (_, idx) => Column(
                        children: [
                          if (_usuarios[idx].id != _autenticacaoStore.usuarioLogado.id)
                            ListTile(
                              title: Text(_usuarios[idx].username),
                              leading: CircleAvatar(
                                backgroundImage: _usuarios[idx].avatar == null
                                    ? AssetImage('assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                                    : NetworkImage(
                                        _usuarios[idx]
                                            .avatar['url']
                                            .toString()
                                            .replaceAll(RegExp(r'localhost'), '192.168.159.130')
                                            .toString(),
                                      ),
                              ),
                              onTap: () => Navigator.of(context).pushNamed(
                                ChatScreen.routeName,
                                arguments: {
                                  'username': _usuarios[idx].username,
                                  'idReceiver': _usuarios[idx].id,
                                },
                              ),
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
