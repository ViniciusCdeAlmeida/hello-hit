import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/stores/index_stores.dart';

class ComentarioPostScreen extends StatefulWidget {
  static const routeName = '/comentarioPostScreen';
  final Post post;
  ComentarioPostScreen({this.post});

  @override
  _ComentarioPostScreenState createState() => _ComentarioPostScreenState();
}

class _ComentarioPostScreenState extends State<ComentarioPostScreen> {
  ComentarioPostStore _comentarioStore;
  AutenticacaoStore _autenticacaoStore;

  String idArgs;
  List<Comentario> _comentarios;

  var _comentario = Comentario(
    text: '',
  );

  @override
  void didChangeDependencies() {
    _comentarioStore = Provider.of<ComentarioPostStore>(context);
    super.didChangeDependencies();
  }

  Future<void> submit() async {
    _comentarioStore
        .fazerComentario(_comentario.id, _comentario)
        .then(
          (_) => Navigator.pop(context),
        )
        .catchError((onError) {
      showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('teste'),
          content: Text('onError'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('OK'),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    idArgs = ModalRoute.of(context).settings.arguments;
    _comentario.id = idArgs;
    _comentarios = _comentarioStore.carreiras;
    //_post = _postStore.posts;

    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);

    var caixaMensagem = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                //controller: _controllerMensagem,
                //onSaved: (value) => _comentario.text = value,
                onChanged: (text) => _comentario.text = text,
                autofocus: false,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 8, 25, 8),
                  hintText: "Comments",
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
          FloatingActionButton(
            backgroundColor: Colors.orange[700],
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
            mini: true,
            onPressed: submit,
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        actions: [
          /*IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () {},
          )*/
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
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
                            itemCount: _comentarios.length,
                            itemBuilder: (_, idx) => Column(
                              children: [
                                ListTile(
                                  title: Text(_comentarios[idx].text),
                                  /*leading: CircleAvatar(
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
                                    ),*/
                                  onTap: () {},
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
          ),
          caixaMensagem,
        ],
      ),
    );
  }
}
