import 'package:flutter/material.dart';
import 'package:hellohit/models/cadastro_model.dart';
import 'package:hellohit/providers/stores/cadastro_store.dart';
import 'package:hellohit/screens/autenticacao/escolha_usuario_screen.dart';
import 'package:provider/provider.dart';

class CadastroScreen extends StatefulWidget {
  static const routeName = '/cadastroScreen';
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _form = GlobalKey<FormState>();
  final _fullNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();
  final _genderFocusNode = FocusNode();
  final _userTypeFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmedFocusNode = FocusNode();
  CadastroStore _cadastroStore;

  var _cadastroUsuario = Cadastro(
    email: '',
    fullName: '',
    gender: '',
    password: '',
    userName: '',
    userType: '',
    confirmPassword: '',
  );

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _userNameFocusNode.dispose();
    _genderFocusNode.dispose();
    _userTypeFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmedFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    _cadastroStore.cadastroUsuario(_cadastroUsuario).catchError(
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
    ).then((_) => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    _cadastroStore = Provider.of<CadastroStore>(context);
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
                  key: _form,
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
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_fullNameFocusNode);
                            },
                            onSaved: (value) =>
                                _cadastroUsuario.fullName = value,
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
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_emailFocusNode);
                            },
                            onSaved: (value) => _cadastroUsuario.email = value,
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
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_userNameFocusNode);
                            },
                            onSaved: (value) =>
                                _cadastroUsuario.userName = value,
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
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_genderFocusNode);
                            },
                            onSaved: (value) => _cadastroUsuario.gender = value,
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
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_userTypeFocusNode);
                            },
                            onSaved: (value) =>
                                _cadastroUsuario.userType = value,
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
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            onSaved: (value) =>
                                _cadastroUsuario.password = value,
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
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordConfirmedFocusNode);
                            },
                            onSaved: (value) =>
                                _cadastroUsuario.confirmPassword = value,
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
                  onPressed: _saveForm,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
