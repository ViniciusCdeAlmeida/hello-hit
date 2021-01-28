import 'dart:ui';

import 'package:flutter/material.dart';

class TelaExplicacaoTimeItem extends StatefulWidget {
  @override
  _TelaExplicacaoTimeItemState createState() => _TelaExplicacaoTimeItemState();
}

class _TelaExplicacaoTimeItemState extends State<TelaExplicacaoTimeItem> {
  List _valorTeams = [
    {"preco": "12", "quantidade": "3"},
    {"preco": "30", "quantidade": "10"},
    {"preco": "100", "quantidade": "20"},
    {"preco": "200", "quantidade": "30"},
    {"preco": "1000", "quantidade": "50"},
  ];
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    icon: Icons.storefront,
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
                    texto:
                        'Search for athletes or artists by location and skill',
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
                padding: const EdgeInsets.only(bottom: 20.0),
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
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
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
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
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
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
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
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
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
                          fontSize: 18,
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
              Card(
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
                                        text: '${_valorTeams[idx]["preco"]}',
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
                                'Up to ${_valorTeams[idx]["quantidade"]} Team Members',
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
                          onPressed: () {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      idx = (idx + 1) % _valorTeams.length;
    });
  }

  void _decrementCounter() {
    setState(() {
      idx = (idx - 1) % _valorTeams.length;
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
      height: 170,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
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
              color: Colors.white,
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
