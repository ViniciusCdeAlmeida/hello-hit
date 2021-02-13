import 'package:flutter/material.dart';
import 'package:hellohit/models/categoria_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/screens/feed/feed_screen.dart';
import 'package:provider/provider.dart';

class EscolhaCategoriaScreen extends StatefulWidget {
  static const routeName = '/escolhaCategoriaScreen';
  @override
  _EscolhaCategoriaScreenState createState() => _EscolhaCategoriaScreenState();
}

class _EscolhaCategoriaScreenState extends State<EscolhaCategoriaScreen> {
  String _currentSelected;
  List<Categoria> _categories = [];

  AutenticacaoStore _autenticacaoStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> submit() async {
    if (_autenticacaoStore.usuarioLogado.userType == 'TEAM')
      _autenticacaoStore.atualizaCategoriaTime(_currentSelected).then(
        (_) {
          Navigator.of(context).pushNamed(FeedScreen.routeName);
        },
      ).catchError((onError) {
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
    else
      _autenticacaoStore.atualizaCategoriaUsuario(_currentSelected).then(
        (_) {
          Navigator.of(context).pushNamed(FeedScreen.routeName);
        },
      ).catchError((onError) {
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
  Widget build(BuildContext context) {
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    _categories = _autenticacaoStore.categorias;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Interest Categories",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Search and select the Skills you love'),
              ],
            ),
            Container(
              height: 100,
              // width: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 10.0,
                ),
                child: FormField(
                  // onSaved: (value) => _cadastroUsuario.gender = value,
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
                        labelText: 'Categories',
                        fillColor: Colors.deepOrange,
                        focusColor: Colors.deepOrange,
                        hoverColor: Colors.deepOrange,
                      ),
                      isEmpty: _currentSelected == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelected,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelected = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _categories.map((value) {
                            return DropdownMenuItem<String>(
                              value: value.id,
                              child: Text(value.name),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange[700],
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(FeedScreen.routeName),
                child: const Text(
                  'SKIP',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: submit,
                child: const Text(
                  'DONE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
