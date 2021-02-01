import 'package:flutter/material.dart';
import 'package:hellohit/screens/autenticacao/autenticacao_time_screen.dart';
import 'package:hellohit/screens/autenticacao/autenticacao_usuario_screen.dart';
import 'package:hellohit/screens/login/login_screen.dart';

class EscolhaUsuarioScreen extends StatefulWidget {
  static const routeName = '/escolhaUsuarioScreen';
  @override
  _EscolhaUsuarioScreenState createState() => _EscolhaUsuarioScreenState();
}

class _EscolhaUsuarioScreenState extends State<EscolhaUsuarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFFeef2f3),
              Color(0xFF8e9eab),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  "assets/images/logos/logo_hello.png",
                  width: 200,
                  height: 150,
                ),
              ),
            ),
            Text(
              'CHOOSE YOUR DESTINY HAHAHAHAHA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: FlatButton(
                    child: const Text(
                      'TEAM/BRANDING',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.all(15),
                    color: Color(0xffF26525),
                    textColor: Colors.white,
                    onPressed: () => Navigator.of(context)
                        .pushNamed(AutenticacaoTimeScreen.routeName),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: FlatButton(
                    child: const Text(
                      'USER',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.all(15),
                    color: Color(0xffF26525),
                    textColor: Colors.white,
                    onPressed: () => Navigator.of(context)
                        .pushNamed(AutenticacaoUsuarioScreen.routeName),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
