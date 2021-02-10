import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/comentario_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/comentario_post_store.dart';
import 'package:hellohit/providers/stores/post_store.dart';
import 'package:hellohit/screens/comentario_post/widget/comentario_post_item.dart';
import 'package:provider/provider.dart';
import 'package:hellohit/models/post_model.dart';

class ComentarioPostScreen extends StatefulWidget {
  static const routeName = '/comentarioPostScreen';
  final Post post;
  ComentarioPostScreen({this.post});

  @override
  _ComentarioPostScreenState createState() => _ComentarioPostScreenState();
}

class _ComentarioPostScreenState extends State<ComentarioPostScreen> {
  ComentarioPostStore _comentarioStore;
  AutenticacaoStore _usuarioStore;
  PostStore _postStore;
  String idArgs;

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
    print(ModalRoute.of(context).settings.arguments.toString());
    idArgs = ModalRoute.of(context).settings.arguments;
    _comentario.id = idArgs;
    print(_comentario.id);
    print(idArgs);
    print(_comentario);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Observer(
                builder: (_) {
                  switch (_comentarioStore.comentarioState) {
                    case ComentarioPostState.inicial:
                      return Container();
                    case ComentarioPostState.carregando:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ComentarioPostState.carregado:
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _comentarioStore.carreiras.length,
                            itemBuilder: (_, idx) => ComentarioPostItem(
                                  _comentarioStore.carreiras[idx],
                                )),
                      );
                  }
                },
              ),
            ),
          ),
          TextFormField(
            onSaved: (value) => _comentario.text = value,
            onChanged: (text) => _comentario.text = text,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.orange[700],
                  width: 2.0,
                ),
              ),
              labelStyle: TextStyle(color: Colors.black),
              labelText: 'Comment',
              fillColor: Colors.white,
              focusColor: Colors.white,
              hoverColor: Colors.white,
            ),
          ),
          Observer(
            builder: (_) => _comentarioStore.req
                ? Center(
                    child: CircularProgressIndicator(
                    backgroundColor: Colors.orange[700],
                  ))
                : FloatingActionButton(
                    backgroundColor: Colors.orange[700],
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    mini: true,
                    onPressed: submit,
                  ),
          )
        ],
      ),
    );
  }
}
