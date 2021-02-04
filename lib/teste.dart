import 'package:flutter/material.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/providers/post_controller.dart';

class Teste extends StatefulWidget {
  static const routeName = '/teste';
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  Future<List<Post>> postFuture;
  PostController _post;
  TextEditingController _buscaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo DIO')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _buscaController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (_buscaController.text.isEmpty) {
                        postFuture = _post.findAll();
                      } else {
                        postFuture = _post.findFilter(_buscaController.text);
                      }
                    });
                  },
                  child: Text('Buscar'),
                ),
              )
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: this.postFuture,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                print(snapshot.hasData);
                print(snapshot.data);
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Text('Error: ${snapshot.error}'),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      var item = snapshot.data[index];
                      return ListTile(
                        title: Text(item.imagem),
                        subtitle: Text(item.imagem),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
