import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/autenticacao_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/screens/autenticacao/esqueci_senha_screen.dart';
import 'package:hellohit/screens/cadastro/cadastro_screen.dart';
import 'package:hellohit/screens/feed/feed_screen.dart';
import 'package:hellohit/teste.dart';
import 'package:provider/provider.dart';

class AutenticacaoUsuarioScreen extends StatefulWidget {
  static const routeName = '/autenticacaoUsuarioScreen';
  @override
  _AutenticacaoUsuarioScreenState createState() =>
      _AutenticacaoUsuarioScreenState();
}

class _AutenticacaoUsuarioScreenState extends State<AutenticacaoUsuarioScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  AutenticacaoStore _autenticacaoStore;

  var _loginData = Autenticacao(
    email: '',
    password: '',
  );

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    _autenticacaoStore
        .autenticacaoUsuario(_loginData)
        .then((_) => Navigator.of(context).pushNamed(Teste.routeName))
        .catchError(
      (onError) {
        showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Error'),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.2,
                decoration: BoxDecoration(
                  color: Colors.orange[700],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          Image.asset(
                              'assets/images/logos/Logo_hellohit_white.png'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: TextFormField(
                                onSaved: (value) => _loginData.email = value,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  labelStyle: TextStyle(color: Colors.white),
                                  labelText: 'E-MAIL',
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  hoverColor: Colors.white,
                                ),
                              ),
                            ),
                            TextFormField(
                              obscureText: true,
                              onSaved: (value) => _loginData.password = value,
                              autofocus: false,
                              textAlignVertical: TextAlignVertical.center,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'Password',
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RaisedButton(
                              child: const Text('LOGIN'),
                              padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
                              textColor: Colors.orange[700],
                              // onPressed: _submit,
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(Teste.routeName),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(EsqueciSenhaScreen.routeName),
                              child: Text(
                                'Forgot my password?',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                'NOT A MEMBER YET?',
                style: TextStyle(
                  color: Color(0xffE0651F),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                child: RaisedButton(
                  child: const Text('REGISTER'),
                  textColor: Colors.white,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(CadastroScreen.routeName),
                  color: Colors.orange[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
