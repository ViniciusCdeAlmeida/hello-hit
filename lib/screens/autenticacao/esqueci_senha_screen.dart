import 'package:flutter/material.dart';

class EsqueciSenhaScreen extends StatefulWidget {
  static const routeName = '/esqueciSenhaScreen';
  @override
  _EsqueciSenhaScreenState createState() => _EsqueciSenhaScreenState();
}

class _EsqueciSenhaScreenState extends State<EsqueciSenhaScreen> {
  @override
  Widget build(BuildContext context) {
    var t = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffE0651F),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Image.asset(
                    "assets/images/logos/Logo_hellohit_white.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 50.0,
                  ),
                  child: TextField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                // Text(t.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 200),
                      child: RaisedButton(
                        child: const Text(
                          "SEND",
                          style: TextStyle(
                            color: Color(0xffE0651F),
                            fontSize: 20,
                          ),
                        ),
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
