import 'package:flutter/material.dart';
import 'package:hellohit/screens/postagem/postagem_screen.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CameraPostScreen extends StatefulWidget {
  @override
  _CameraPostScreenState createState() => _CameraPostScreenState();
}

class _CameraPostScreenState extends State<CameraPostScreen> {
  File _imagem;

  Future _recuperarImagem(bool daCamera) async {
    File imagemSelecionada;
    if (daCamera) {
      //camera
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      //galeria
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = imagemSelecionada;
    });
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
          onTap: () {},
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
        title: Text(
          'Photo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_next_outlined),
            color: Colors.black,
            onPressed: () =>
                Navigator.of(context).pushNamed(PostagemScreen.routeName),
          ),
        ],
      ),
      body: Container(
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
                    ),
            ],
          ),
        ),
      ),
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
