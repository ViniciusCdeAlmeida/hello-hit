import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/utils/keys.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/stores/index_stores.dart';

class CadastroScreen extends StatefulWidget {
  static const routeName = '/cadastroScreen';
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _form = GlobalKey<FormState>();
  final _fullNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();
  final _genderFocusNode = FocusNode();
  final _userTypeFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmedFocusNode = FocusNode();
  CadastroStore _cadastroStore;
  String _currentSelectedGender;
  String _currentSelectedUserType;

  var _userType = [
    'Talent or Fan',
    'Team',
  ];

  var _gender = [
    'Male',
    'Female',
    'Other',
  ];

  var _cadastroUsuario = Cadastro(
    email: '',
    fullName: '',
    gender: '',
    password: '',
    username: '',
    userType: '',
    confirmPassword: '',
  );

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
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
    _cadastroStore.cadastroUsuario(_cadastroUsuario).then((_) => Navigator.of(context).pop()).catchError(
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
    _cadastroStore = Provider.of<CadastroStore>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              key: Key(Keys.registerScreen.columnFormRegister),
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
                          height: 60,
                          child: TextFormField(
                            key: Key(Keys.registerScreen.fullnameFormRegister),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Choose one';
                              }
                              return null;
                            },
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            cursorColor: Colors.deepOrange,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
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
                              FocusScope.of(context).requestFocus(_fullNameFocusNode);
                            },
                            onSaved: (value) => _cadastroUsuario.fullName = value,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          height: 60,
                          child: TextFormField(
                            key: Key(Keys.registerScreen.emailFormRegister),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Choose one';
                              }
                              return null;
                            },
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
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
                              FocusScope.of(context).requestFocus(_emailFocusNode);
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
                          height: 60,
                          child: TextFormField(
                            key: Key(Keys.registerScreen.usernameFormRegister),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Choose one';
                              }
                              return null;
                            },
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
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
                              FocusScope.of(context).requestFocus(_usernameFocusNode);
                            },
                            onSaved: (value) => _cadastroUsuario.username = value,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0,
                        ),
                        child: FormField(
                          validator: (value) {
                            if (value == null) {
                              return 'Choose one';
                            }
                            return null;
                          },
                          onSaved: (value) => _cadastroUsuario.userType = value,
                          builder: (FormFieldState state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                                helperText: 'Choose your user as talent or team',
                                labelStyle: TextStyle(color: Colors.deepOrange),
                                labelText: 'User Type',
                                fillColor: Colors.deepOrange,
                                focusColor: Colors.deepOrange,
                                hoverColor: Colors.deepOrange,
                              ),
                              isEmpty: _currentSelectedUserType == '',
                              child: DropdownButtonHideUnderline(
                                key: Key(Keys.registerScreen.usertypeFormRegister),
                                child: DropdownButton<String>(
                                  value: _currentSelectedUserType,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _currentSelectedUserType = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _userType.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (_currentSelectedUserType != null && _currentSelectedUserType.contains('Talent or Fan'))
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50.0,
                            vertical: 10.0,
                          ),
                          child: FormField(
                            key: Key(Keys.registerScreen.genderFormRegister),
                            onSaved: (value) => _cadastroUsuario.gender = value,
                            builder: (FormFieldState state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                                isEmpty: _currentSelectedGender == '',
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _currentSelectedGender,
                                    isDense: true,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _currentSelectedGender = newValue;
                                        state.didChange(newValue);
                                      });
                                    },
                                    items: _gender.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 50.0,
                          left: 50.0,
                          top: 10.0,
                        ),
                        child: Container(
                          height: 120,
                          child: TextFormField(
                            key: Key(Keys.registerScreen.passwordFormRegister),
                            validator: (value) {
                              if (value.length < 7) {
                                return 'Password not correct';
                              }
                              return null;
                            },
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.deepOrange),
                              labelText: 'Password',
                              helperMaxLines: 3,
                              helperText:
                                  'Minimal 7 characters and must contain one letter, one number and one non-alphabetic characters.',
                              fillColor: Colors.deepOrange,
                              focusColor: Colors.deepOrange,
                              hoverColor: Colors.deepOrange,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_passwordFocusNode);
                            },
                            onChanged: (value) => _cadastroUsuario.password = value,
                            onSaved: (value) => _cadastroUsuario.password = value,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          // vertical: 10.0,
                        ),
                        child: Container(
                          height: 65,
                          child: TextFormField(
                            key: Key(Keys.registerScreen.passwordconfirmFormRegister),
                            validator: (value) {
                              if (value != _cadastroUsuario.password || value.isEmpty) {
                                return 'Password must be equal';
                              }
                              return null;
                            },
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                            cursorColor: Colors.deepOrange,
                            textAlignVertical: TextAlignVertical.center,
                            initialValue: null,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
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
                              FocusScope.of(context).requestFocus(_passwordConfirmedFocusNode);
                            },
                            onSaved: (value) => _cadastroUsuario.confirmPassword = value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                ),
                Observer(builder: (_) => _cadastroStore.cadastrando ? loading() : showButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loading() {
    return CircularProgressIndicator();
  }

  Widget showButton() {
    return RaisedButton(
      key: Key(Keys.registerScreen.finalizeFormRegister),
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
    );
  }
}
