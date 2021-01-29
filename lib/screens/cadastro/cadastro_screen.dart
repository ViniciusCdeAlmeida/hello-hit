import 'package:flutter/material.dart';
import 'package:hellohit/screens/autenticacao/escolha_usuario_screen.dart';

class CadastroScreen extends StatefulWidget {
  static const routeName = '/cadastroScreen';
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logos/logo_hello.png",
                  width: 250,
                ),
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 50.0,
                        ),
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            cursorColor: Colors.deepOrange,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 16, 20, 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              labelText: 'Full name',
                              fillColor: Colors.deepOrange,
                              focusColor: Colors.deepOrange,
                              hoverColor: Colors.deepOrange,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 16, 20, 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              labelText: 'E-mail',
                              fillColor: Colors.deepOrange,
                              focusColor: Colors.deepOrange,
                              hoverColor: Colors.deepOrange,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 16, 20, 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              labelText: 'Username',
                              fillColor: Colors.deepOrange,
                              focusColor: Colors.deepOrange,
                              hoverColor: Colors.deepOrange,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 16, 20, 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              labelText: 'Gender',
                              fillColor: Colors.deepOrange,
                              focusColor: Colors.deepOrange,
                              hoverColor: Colors.deepOrange,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 16, 20, 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              labelText: 'User Type',
                              fillColor: Colors.deepOrange,
                              focusColor: Colors.deepOrange,
                              hoverColor: Colors.deepOrange,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 16, 20, 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              labelText: 'Password',
                              fillColor: Colors.deepOrange,
                              focusColor: Colors.deepOrange,
                              hoverColor: Colors.deepOrange,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 16, 20, 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              labelText: 'Confirm password',
                              fillColor: Colors.deepOrange,
                              focusColor: Colors.deepOrange,
                              hoverColor: Colors.deepOrange,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                ),
                RaisedButton(
                  child: Text(
                    "Finalize",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  color: Color(0xffE0651F),
                  padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
