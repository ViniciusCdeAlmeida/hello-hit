import 'package:flutter/material.dart';

class CadastroScreen01 extends StatelessWidget {
  const CadastroScreen01({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    "assets/logo_hello.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Hello :)',
                    style: TextStyle(
                      color: Color(0xffE0651F),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Welcome to HelloHit.',
                    style: TextStyle(
                      color: Color(0xffE0651F),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      const Text(
                          'To start the registration enter below the passcode sent to your email.',
                          style: TextStyle(
                            color: Color(0xffE0651F),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
