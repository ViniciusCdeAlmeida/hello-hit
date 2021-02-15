import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/service/stores/postagem_store.dart';
import 'package:hellohit/screens/postagem/tag_post_screen.dart';

class PostagemScreen extends StatefulWidget {
  static const routeName = '/postagemScreen';
  @override
  _PostagemScreenState createState() => _PostagemScreenState();
}

class _PostagemScreenState extends State<PostagemScreen> {
  PostagemStore _postagemStore;
  final GlobalKey<FormState> _formKeyPostagem = GlobalKey();
  String texto;

  void _submit() {
    if (!_formKeyPostagem.currentState.validate()) {
      return;
    }
    _formKeyPostagem.currentState.save();
    _postagemStore.postagemTexto(texto);
    Navigator.of(context).pushNamed(TagPostScreen.routeName);
  }

  @override
  void didChangeDependencies() {
    _postagemStore = Provider.of<PostagemStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(0),
              title: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.orange[700],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.chevron_left,
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _submit,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.height / 2,
                          child: Form(
                            key: _formKeyPostagem,
                            child: TextFormField(
                              autofocus: true,
                              maxLengthEnforced: true,
                              maxLength: 300,
                              maxLines: 50,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  top: 5,
                                  left: 5,
                                  bottom: 12,
                                ),
                                hintText:
                                    'Hello! Write something to your fans.',
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              onSaved: (value) => texto = value,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
