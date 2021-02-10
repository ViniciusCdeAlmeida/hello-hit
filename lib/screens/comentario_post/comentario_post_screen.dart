import 'package:flutter/material.dart';
import 'package:hellohit/models/comentario_model.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/comentario_post_store.dart';
import 'package:hellohit/providers/stores/post_store.dart';
import 'package:hellohit/screens/postagem/postagem_comentario_screen.dart';

class ComentarioPostScreen extends StatefulWidget {
  static const routeName = '/comentarioPostScreen';
  ComentarioPostScreen({Key key}) : super(key: key);

  @override
  _ComentarioPostScreenState createState() => _ComentarioPostScreenState();
}

class _ComentarioPostScreenState extends State<ComentarioPostScreen> {
  ComentarioPostStore _comentarioStore;
  AutenticacaoStore _usuarioStore;
  PostStore _postStore;
  String idArgs;

  var _comentario = Comentario();
  var _post = Post();

  List<String> _comentarios = [
    "Que da hora!",
    "Muito massa :)",
  ];

  Future<void> submit() async {
    try {
      await _comentarioStore
          .fazerComentario(_post.id, _comentario)
          .then(
            (_) => Navigator.of(context)
                .pushNamed(PostagemComentarioScreen.routeName),
          )
          .catchError((onError) {
        showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('teste'),
            content: Text(onError),
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
    } catch (error) {
      throw error;
    }
  }

  _enviarFoto() {}

  TextEditingController _controllerMensagem = TextEditingController();

  Widget _buildComentarioLista() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _comentarios.length)
          return _buildComentarioItem(_comentarios[index]);
      },
    );
  }

  Widget _buildComentarioItem(String itemComentario) {
    return ListTile(
      title: Text(itemComentario),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.arguments.toString());
    idArgs = ModalRoute.of(context).settings.arguments;
    print(idArgs);
    var caixaMensagem = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                controller: _controllerMensagem,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                cursorColor: Colors.orange[700],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                  hintText: "Digite uma comentário",
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
            onPressed: submit,
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comentários'),
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
            child: _buildComentarioLista(),
          ),
          caixaMensagem,
        ],
      ),
    );
  }
}
