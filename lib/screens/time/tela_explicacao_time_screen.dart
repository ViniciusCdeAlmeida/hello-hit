import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/service/stores/index_stores.dart';

class TelaExplicacaoTimeScreen extends StatefulWidget {
  static const routeName = '/telaExplicacaoTimeScreen';
  @override
  _TelaExplicacaoTimeScreenState createState() => _TelaExplicacaoTimeScreenState();
}

class _TelaExplicacaoTimeScreenState extends State<TelaExplicacaoTimeScreen> {
  List<ProdutosPagamento> _produtos;
  int idx = 0;
  PagamentoStore _pagamentoStore;

  final oCcy = NumberFormat("#,##", "en_US");

  @override
  void didChangeDependencies() {
    _pagamentoStore = Provider.of<PagamentoStore>(context, listen: false);
    if (_pagamentoStore.produtos.isEmpty) _pagamentoStore.getProdutos();
    super.didChangeDependencies();
  }

  Future pagar(String pm) async {
    _pagamentoStore.makePagamentoTime(pm).catchError((onError) {
      showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('onError'),
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
    return Scaffold(
      // ignore: missing_return
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 20.0,
          right: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: Center(
                  child: Text(
                    'Team features',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.cloud_upload,
                    texto: 'Post to the Team Profile',
                  ),
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.create_new_folder,
                    texto: 'Create Team Posts',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.perm_media,
                    texto: 'Add 8 Images or Videos Per Post',
                  ),
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.apps,
                    texto: 'Customize Team Post Layout',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.business_center,
                    texto: 'Instant portifolio with Playbook',
                  ),
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.schedule,
                    texto: 'Schedule posts',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.storefront,
                    texto: 'Sell your Team\'s Goods',
                  ),
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.verified,
                    texto: 'Advanced Team Stats',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.bar_chart,
                    texto: 'Advanced Team Stats',
                  ),
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.search,
                    texto: 'Search for athletes or artists by location and skill',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.toc,
                    texto: 'Search advanced',
                  ),
                  ListaRowTimePagamento(
                    height: 50,
                    width: 80,
                    icon: Icons.mail,
                    texto: 'Message Talents',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: Center(
                  child: Text(
                    'Teams and Jobs are a Perfect Match',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 30.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Your team avatar appears next to the job listing',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 30.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Talents seeking jobs or Sponsorship can search for both jobs posted by teams and teams hiring.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 30.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Job listings appear on your tema profile.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 30.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Learn more abaout Hello Hit Jobs',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 30.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Interested in hand picking talent for your sports, arts or brand team? Learn more about our hiring tools.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: Center(
                  child: Text(
                    'Teams and Jobs are a Perfect Match',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // ignore: missing_return
              Observer(builder: (_) {
                switch (_pagamentoStore.pagamentoState) {
                  case PagamentoState.inicial:
                  case PagamentoState.carregando:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case PagamentoState.carregado:
                    _produtos = _pagamentoStore.produtosProTalento;
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            4,
                          ),
                        ),
                        side: BorderSide(width: 1, color: Colors.grey[300]),
                      ),
                      elevation: 3,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '\$',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 56,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${oCcy.format(_produtos[0].prices[idx].amount)}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 56,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Per Month',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Text(
                                          'BILLED ANNUALY',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  border: Border.all(
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: _decrementCounter,
                                    ),
                                    Text(
                                      'Up to ${_produtos[0].prices[idx].quantidade} Team Members',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: _incrementCounter,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              width: 300.0,
                              child: RaisedButton(
                                onPressed: () => pagar(_produtos[0].prices[idx].id),
                                color: Colors.blue[400],
                                child: Text(
                                  'Create a Team',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      idx = (idx + 1) % _produtos[0].prices.length;
    });
  }

  void _decrementCounter() {
    setState(() {
      idx = (idx - 1) % _produtos[0].prices.length;
    });
  }
}

class ListaRowTimePagamento extends StatelessWidget {
  final String texto;
  final IconData icon;
  final double height;
  final double width;
  const ListaRowTimePagamento({
    Key key,
    this.texto,
    this.icon,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 130,
      child: Column(
        children: [
          Container(
            // margin: EdgeInsets.all(10),
            width: width / 1.2,
            height: height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  color: Colors.orange[900],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                texto,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
