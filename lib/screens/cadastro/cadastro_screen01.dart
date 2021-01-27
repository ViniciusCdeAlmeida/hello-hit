import 'package:flutter/material.dart';

class CadastroScreen01 extends StatefulWidget {
  @override
  _CadastroScreen01State createState() => _CadastroScreen01State();
}

class _CadastroScreen01State extends State<CadastroScreen01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "assets/images/logos/logo_hello.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                RaisedButton(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      color: Color(0xffF26525),
                      fontSize: 20,
                    ),
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
