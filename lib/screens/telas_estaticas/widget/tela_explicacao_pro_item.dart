import 'dart:ui';

import 'package:flutter/material.dart';

class TelaExplicacaoProItem extends StatefulWidget {
  @override
  _TelaExplicacaoProItemState createState() => _TelaExplicacaoProItemState();
}

class _TelaExplicacaoProItemState extends State<TelaExplicacaoProItem> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1.1,
                foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/tela_pro_1.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage('assets/images/tela_pro_1.jpg'),
                //     // fit: BoxFit.fitWidth,
                //   ),
                // ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Lorem ipsum elit lorem dui quisque, elementum quam pharetra non.',
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
                            'Lorem ipsum elementum urna vel ornare platea vivamus, mi fermentum curae tristique nisl sed, nostra sociosqu imperdiet consequat dictumst vehicula. ',
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
                width: MediaQuery.of(context).size.width / 1.1,
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
                            'Lorem ipsum elit lorem dui quisque, elementum quam pharetra non.',
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
                            'Lorem ipsum elementum urna vel ornare platea vivamus, mi fermentum curae tristique nisl sed, nostra sociosqu imperdiet consequat dictumst vehicula. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 90.0,
                          backgroundImage: NetworkImage(
                              'https://vectorlogoseek.com/wp-content/uploads/2018/09/san-diego-padres-baseball-club-vector-logo.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: RaisedButton(
                            onPressed: () {},
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF0D47A1),
                                    Color(0xFF1976D2),
                                    Color(0xFF42A5F5),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child: const Text('Hire......',
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/comment_icon.jpg'),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Lorem ipsum elit lorem dui quisque, elementum quam pharetra non.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        'https://vectorlogoseek.com/wp-content/uploads/2018/09/san-diego-padres-baseball-club-vector-logo.png'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'San Diego Team',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        FadeDivider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Lorem ipsum elit lorem dui quisque, elementum quam pharetra non.',
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
                            'Lorem ipsum elementum urna vel ornare platea vivamus, mi fermentum curae tristique nisl sed, nostra sociosqu imperdiet consequat dictumst vehicula. ',
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
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.white,
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.white,
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.white,
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.white,
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 12,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.grey[600],
                                corFonte: Colors.white,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
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
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF0D47A1),
                                          Color(0xFF1976D2),
                                          Color(0xFF42A5F5),
                                        ],
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(12.0),
                                    child: const Text(
                                      'Hire......',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
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
                                      text: '5',
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
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.check,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.black,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 12,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
                                corIcon: Colors.black,
                              ),
                              BannerRow(
                                icon: Icons.clear,
                                texto: 'Lorem ipsum elit lorem dui quisque.',
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
                                  onPressed: () {},
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
