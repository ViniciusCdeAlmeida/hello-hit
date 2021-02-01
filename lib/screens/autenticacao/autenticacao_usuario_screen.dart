import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/screens/autenticacao/esqueci_senha_screen.dart';
import 'package:hellohit/screens/cadastro/cadastro_screen.dart';
import 'package:hellohit/screens/feed/feed_screen.dart';

class AutenticacaoUsuarioScreen extends StatefulWidget {
  static const routeName = '/autenticacaoUsuarioScreen';
  @override
  _AutenticacaoUsuarioScreenState createState() =>
      _AutenticacaoUsuarioScreenState();
}

class _AutenticacaoUsuarioScreenState extends State<AutenticacaoUsuarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: TextField(
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
                              TextField(
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
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(FeedScreen.routeName),
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
                    onPressed: () => Navigator.of(context)
                        .pushNamed(CadastroScreen.routeName),
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
      ),
    );
  }
}
