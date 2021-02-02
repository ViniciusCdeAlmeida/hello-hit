import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:hellohit/screens/tag_post/widgets/tag_post_text_field.dart';

class TagPostScreen extends StatefulWidget {
  @override
  _TagPostScreenState createState() => _TagPostScreenState();
}

class _TagPostScreenState extends State<TagPostScreen> {
  File _imagem;

  bool state = true;

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 20,
          color: Colors.white,
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 156),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
            ),
          ),
        ],
        backgroundColor: Colors.black87,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black87,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Usain Bolt',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/around_the_world.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TagPostTextField(
                      title: 'Team',
                      hint: 'Puma',
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    TagPostTextField(
                      title: 'Place',
                      hint: 'Maracanã',
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    TagPostTextField(
                      title: 'Event',
                      hint: 'Summer Olympics',
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 155),
                      child: Text(
                        'Show your Team and place On',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Hello Hit Page',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 37),
                              child: Text(
                                'usainbolt',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          activeColor: Colors.orange[700],
                          value: state,
                          onChanged: (bool v) {
                            setState(() {
                              state = v;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RaisedButton(
                          child: const Text(
                            'Post',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textColor: Colors.black,
                          onPressed: () {},
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
