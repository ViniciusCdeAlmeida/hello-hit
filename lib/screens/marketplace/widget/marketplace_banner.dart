import 'package:flutter/material.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_criacao_screen.dart';
import 'package:hellohit/screens/time/tela_explicacao_time_screen.dart';

class MarketplaceBanner extends StatelessWidget {
  final Size deviceSize;

  MarketplaceBanner(this.deviceSize);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
                'assets/images/oportunidades_assets/box_encontrar_oportunidades.png'),
          ),
        ),
        width: deviceSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 48.0,
                right: 48.0,
                top: 10.0,
              ),
              child: Center(
                child: Text(
                  'Hello, Hit is the heart of the Sports and Arts community and the best resource to discover and connect.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () => Navigator.of(context)
                  .pushNamed(OportunidadeCriacaoScreen.routeName),
              // icon: Icon(Icons.),
              child: Text(
                'POST A JOB - AS LOW AS 199/MO',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaketplaceDivider extends StatelessWidget {
  final Size deviceSize;

  MaketplaceDivider(this.deviceSize);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: deviceSize.height / 21,
        margin: const EdgeInsets.only(top: 5.0),
        color: Colors.grey[200],
        child: Text('CAREER OPPORTUNITIES'),
      ),
    );
  }
}
