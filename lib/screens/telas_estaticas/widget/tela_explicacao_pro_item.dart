import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_pagamento_pro_item.dart';

class TelaExplicacaoProItem extends StatefulWidget {
  static const routeName = '/telaExplicacaoProItem';
  @override
  _TelaExplicacaoProItemState createState() => _TelaExplicacaoProItemState();
}

class _TelaExplicacaoProItemState extends State<TelaExplicacaoProItem> {
  bool isSwitched = true;
  String _valor = '57.00';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('data'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/tela_pro_1.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Take control of your Arts \& Sports career',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 38,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Hello Hit Pro is the most powerful way to showcase your talent and get discovered as a Sports or Arts professional. It\'s everything you need to put your carreer forward.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlineButton(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                              child: Text(
                                'Learn More',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              color: Colors.white,
                              child: Text('I\'m Ready to Go Pro'),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                // width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Get the Work or Sponsor You Want',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'With Hello Hit Pro, you\'ll be recommended for jobs and Sponsors from any team on the plataform. Set your own job parameters and let us filter ou the noise for you.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.grey[850],
                          margin: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  'Player',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 00.0),
                                child: Text(
                                  'FREE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 60,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  'Always free. Must be invited.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              FadeDivider(),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Upload Shots.',
                                corIcon: Colors.white,
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Give/Receive Comments.',
                                corIcon: Colors.white,
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Work Opportunities',
                                corIcon: Colors.white,
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Set The Rates you Want',
                                corIcon: Colors.white,
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Sell Goods',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Downloads \& Scheduling',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 12,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Go Ad Free',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Video',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Advanced Statistics',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Exclusive Deals',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                              FadeDivider(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  'You\'re a prospect waiting for an invitation.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/logos/logo_hello.png',
                                      fit: BoxFit.cover,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                    ),
                                  ),
                                  // Container(
                                  //   decoration: const BoxDecoration(
                                  //     borderRadius: BorderRadius.all(
                                  //       Radius.circular(10.0),
                                  //     ),
                                  //     gradient: LinearGradient(
                                  //       colors: <Color>[
                                  //         Color(0xFF0D47A1),
                                  //         Color(0xFF1976D2),
                                  //         Color(0xFF42A5F5),
                                  //       ],
                                  //     ),
                                  //   ),
                                  //   padding: const EdgeInsets.all(12.0),
                                  //   child: const Text(
                                  //     'Hire......',
                                  //     style: TextStyle(
                                  //       fontSize: 20,
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '\$',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                    TextSpan(
                                      text: _valor,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 60,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\/mo',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Billed Monthly',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: !isSwitched
                                            ? Colors.black
                                            : Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Switch(
                                      value: isSwitched,
                                      onChanged: (value) {
                                        setState(() {
                                          value
                                              ? _valor = '57.00'
                                              : _valor = '4.90';
                                          isSwitched = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Billed Annually',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSwitched
                                            ? Colors.black
                                            : Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FadeDivider(),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Upload Shots.',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Give/Receive Comments.',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Work Opportunities',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Set The Rates you Want',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Sell Goods',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Downloads \& Scheduling',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Go Ad Free',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Video',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Advanced Statistics',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Exclusive Deals',
                                corIcon: Colors.black,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                              FadeDivider(),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Don\'t have an invite? ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    TextSpan(
                                      text: 'Skip the wait.',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: RaisedButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(
                                          TelaPagamentoProItem.routeName),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff374ABE),
                                          Color(0xff64B6FF)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 300.0,
                                        minHeight: 50.0,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Go Pro",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FadeDivider extends StatelessWidget {
  const FadeDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        height: 1,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.transparent,
                Colors.grey[600],
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BannerRow extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color corIcon;
  final Color corFonte;

  const BannerRow({
    Key key,
    this.icon,
    this.texto,
    this.corIcon,
    this.corFonte,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  icon,
                  color: corIcon,
                ),
              ),
              Text(
                texto,
                style: TextStyle(
                  fontSize: 16,
                  color: corFonte,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
