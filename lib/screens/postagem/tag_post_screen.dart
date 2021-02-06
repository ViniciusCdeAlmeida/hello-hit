import 'package:flutter/material.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/postagem_store.dart';
import 'package:hellohit/screens/feed/feed_screen.dart';
import 'package:hellohit/screens/postagem/widget/radiobutton.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:hellohit/screens/postagem/widget/tag_post_text_field.dart';
import 'package:hellohit/screens/postagem/widget/checkbox.dart';
import 'package:provider/provider.dart';

class TagPostScreen extends StatefulWidget {
  static const routeName = '/tagPostScreen';
  @override
  _TagPostScreenState createState() => _TagPostScreenState();
}

class _TagPostScreenState extends State<TagPostScreen> {
  PostagemStore _postagemStore;
  AutenticacaoStore _usuarioStore;
  final _locationController = TextEditingController();
  final _teamController = TextEditingController();
  final _eventController = TextEditingController();
  var _postagem = Post();
  var _usuarioLogado = Usuario();
  @override
  void didChangeDependencies() {
    _postagemStore = Provider.of<PostagemStore>(context);
    _usuarioStore = Provider.of<AutenticacaoStore>(context);
    _usuarioLogado = _usuarioStore.autenticacao;
    _postagem = _postagemStore.postagem;
    super.didChangeDependencies();
  }

  Future<void> submit() async {
    if (_locationController.text == '' ||
        _eventController.text == '' ||
        _teamController.text == '') return;
    _postagem.location = _locationController.text;
    _postagem.event = _eventController.text;
    _postagem.team = _teamController.text;

    try {
      await _postagemStore
          .fazerPostagem(_postagem)
          .then(
            (_) => Navigator.of(context).pushNamed(FeedScreen.routeName),
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

  @override
  void dispose() {
    _locationController.dispose();
    _eventController.dispose();
    _teamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            backgroundColor: Colors.grey[850],
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    Text(
                      _usuarioLogado.full_name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.grey[850],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 400,
                                  // width: 400,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(_postagem.file),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TagPostTextField(
                              title: 'Team',
                              hint: 'Puma',
                              controller: _teamController,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            TagPostTextField(
                              title: 'Place',
                              hint: 'Maracanã',
                              controller: _locationController,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            TagPostTextField(
                              title: 'Event',
                              hint: 'Summer Olympics',
                              controller: _eventController,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 155),
                            //   child: Text(
                            //     'Show your Team and place On',
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Column(
                            //       children: [
                            //         Text(
                            //           'Hello Hit Page',
                            //           style: TextStyle(
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           height: 1,
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(right: 37),
                            //           child: Text(
                            //             'usainbolt',
                            //             style: TextStyle(
                            //               fontSize: 12,
                            //               color: Colors.grey,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Switch(
                            //       activeColor: Colors.orange[700],
                            //       value: state,
                            //       onChanged: (bool v) {
                            //         setState(() {
                            //           state = v;
                            //         });
                            //       },
                            //     ),
                            //   ],
                            // ),
                            Divider(),
                            // Row(
                            //   children: [
                            //     Text(
                            //       'WHO CAN SEE THE POST?',
                            //       style: TextStyle(color: Colors.white),
                            //     ),
                            //   ],
                            // ),
                            // RadioButton(),
                            // Row(
                            //   children: [
                            //     Text(
                            //       'Select wich tiers have access',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // CheckBox(),
                            // Text(
                            //   '(10% Tax will be applied in each transfer to your paypal or banck account)',
                            //   style: TextStyle(
                            //     fontSize: 10,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
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
                                    onPressed: submit,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
