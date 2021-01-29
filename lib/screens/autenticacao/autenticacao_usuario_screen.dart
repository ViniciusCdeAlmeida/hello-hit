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
      backgroundColor: Color(0xFFF26525),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: Image.asset(
                  "assets/images/logos/Logo_hellohit_white.png",
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 50.0,
                  ),
                  child: Container(
                    height: 40,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      initialValue: null,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {},
                      onSaved: (value) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Container(
                    height: 40,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      textAlignVertical: TextAlignVertical.center,
                      initialValue: null,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {},
                      onSaved: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 40.0, top: 40),
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: FlatButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    textColor: Color(0xffF26525),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(FeedScreen.routeName),
                  ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 58.0),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Center(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: Text(
                              'NOT A MEMBER YET?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: FlatButton(
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              padding: const EdgeInsets.all(15),
                              color: Color(0xffF26525),
                              textColor: Colors.white,
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(CadastroScreen.routeName),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
