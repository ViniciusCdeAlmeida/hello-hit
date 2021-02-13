import 'dart:io';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/postagem_store.dart';
import 'package:hellohit/screens/feed/feed_screen.dart';
import 'package:hellohit/screens/postagem/widget/tag_post_text_field.dart';

class TagPostScreen extends StatefulWidget {
  static const routeName = '/tagPostScreen';
  @override
  _TagPostScreenState createState() => _TagPostScreenState();
}

class _TagPostScreenState extends State<TagPostScreen> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  PostagemStore _postagemStore;
  AutenticacaoStore _usuarioStore;
  String currentText = "";
  final _locationController = TextEditingController();
  final _teamController = TextEditingController();
  final _eventController = TextEditingController();
  var _postagem = Post();
  var _usuarioLogado = Usuario();

  @override
  void didChangeDependencies() {
    _postagemStore = Provider.of<PostagemStore>(context);
    _usuarioStore = Provider.of<AutenticacaoStore>(context);
    _usuarioLogado = _usuarioStore.usuarioLogado;
    _postagem = _postagemStore.postagem;
    super.didChangeDependencies();
  }

  List<String> _suggestions = [];

  Future<void> submit() async {
    _postagem.location = _locationController.text;
    _postagem.event = _eventController.text;
    _postagem.team = _teamController.text;

    await _postagemStore
        .fazerPostagem(_postagem)
        .then(
          (_) => Navigator.of(context).pushNamed(FeedScreen.routeName),
        )
        .catchError((onError) {
      showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text('Your connection is not available.'),
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
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            toolbarHeight: 80,
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: _usuarioLogado.avatar != null
                          ? NetworkImage(_usuarioLogado.avatar)
                          : AssetImage(
                              'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png',
                            ),
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _usuarioLogado.fullName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Team',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SimpleAutoCompleteTextField(
                              key: key,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Team',
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withAlpha(100),
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                counterText: '',
                              ),
                              controller: _teamController,
                              suggestions: _suggestions,
                              textChanged: (text) => currentText = text,
                              clearOnSubmit: false,
                              submitOnSuggestionTap: true,
                              textSubmitted: (value) {
                                // print(value);
                                // _teamController.text = value;
                                // print(_teamController.text);
                              },
                            ),
                            // TagPostTextField(
                            //   title: 'Team',
                            //   hint: 'Puma',
                            //   controller: _teamController,
                            // ),
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
                            // ignore: missing_return
                            Observer(builder: (_) {
                              switch (_postagemStore.postagemState) {
                                case PostagemState.carregando:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                case PostagemState.carregado:
                                case PostagemState.inicial:
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                              }
                            })
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
