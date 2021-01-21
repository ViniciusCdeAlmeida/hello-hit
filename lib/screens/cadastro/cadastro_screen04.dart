import 'package:flutter/material.dart';

class CadastroScreen04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Image.asset(
                    "assets/logo_hello.png",
                    width: 250,
                    height: 250,
                  ),
                ),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 15),
                  cursorColor: Color(0xffE0651F),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xffE0651F)),
                    hoverColor: Color(0xffE0651F),
                    //filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 15),
                  cursorColor: Color(0xffE0651F),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Confirm password",
                    hintStyle: TextStyle(color: Color(0xffE0651F)),
                    //filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                ),
                RaisedButton(
                  child: Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  color: Color(0xffE0651F),
                  padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
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
