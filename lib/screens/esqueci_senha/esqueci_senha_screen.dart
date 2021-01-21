import 'package:flutter/material.dart';

class EsqueciSenhaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Color(0xffE0651F)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Image.asset(
                    "assets/logo_hello.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                TextField(
                  autofocus: true,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
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
                        onPressed: () {},
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
