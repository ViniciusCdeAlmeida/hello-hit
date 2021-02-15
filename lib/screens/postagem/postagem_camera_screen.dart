import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/service/stores/postagem_store.dart';
import 'package:hellohit/screens/postagem/postagem_comentario_screen.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PostagemCameraScreen extends StatefulWidget {
  static const routeName = '/postagemCameraScreen';
  @override
  _PostagemCameraScreenState createState() => _PostagemCameraScreenState();
}

class _PostagemCameraScreenState extends State<PostagemCameraScreen> {
  PostagemStore _postagemStore;
  File _imagem;
  String idArgs;
  Stream<FileResponse> fileStream;
  var _postInicial = Post(
    comments: [],
    file: '',
    hitCount: 0,
    text: '',
    tip: '0',
  );

  Future _recuperarImagem(bool daCamera) async {
    final picker = ImagePicker();
    File imagemSelecionada;

    if (daCamera) {
      var _camera = await picker.getImage(source: ImageSource.camera);
      //camera
      imagemSelecionada = File(_camera.path);
    } else {
      var _galeria = await picker.getImage(source: ImageSource.gallery);
      //galeria
      imagemSelecionada = File(_galeria.path);
    }

    setState(() {
      _imagem = imagemSelecionada;
    });
  }

  void setImagemPostagem() {
    // print(_imagem.path);
    _postagemStore.postagemImagem(_imagem.path);
    Navigator.of(context).pushNamed(PostagemComentarioScreen.routeName);
  }

  @override
  void didChangeDependencies() {
    _postagemStore = Provider.of<PostagemStore>(context);
    idArgs = ModalRoute.of(context).settings.arguments;
    if (idArgs != null) {
      _postagemStore.buscaPostagem(idArgs);
    } else
      _postagemStore.postagemInicial(_postInicial);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Opção não disponível no momento!"),
      actions: [
        okButton,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          Center(
            child: InkWell(
              onTap: setImagemPostagem,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'Photo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      // ignore: missing_return
      body: Observer(builder: (_) {
        switch (_postagemStore.postagemState) {
          case PostagemState.inicial:
            return Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    _imagem == null
                        ? Container()
                        : Image.file(
                            _imagem,
                            fit: BoxFit.cover,
                            height: 370,
                            cacheHeight: 1080,
                            cacheWidth: 1080,
                          ),
                  ],
                ),
              ),
            );
          case PostagemState.carregado:
            return Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    Image.file(
                      _postagemStore.postagemImagemEdit,
                      fit: BoxFit.cover,
                      height: 370,
                      cacheHeight: 1080,
                      cacheWidth: 1080,
                    ),
                  ],
                ),
              ),
            );
          case PostagemState.carregando:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      }),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                elevation: 0,
                child: Text(
                  "Library",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.white,
                onPressed: () {
                  _recuperarImagem(false);
                },
              ),
              RaisedButton(
                elevation: 0,
                child: Text(
                  "Photo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.white,
                onPressed: () {
                  _recuperarImagem(true);
                },
              ),
              RaisedButton(
                elevation: 0,
                child: Text(
                  "Video",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.white,
                onPressed: () {
                  // show the dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
