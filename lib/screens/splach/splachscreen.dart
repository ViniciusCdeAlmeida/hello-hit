import 'package:flutter/material.dart';
import 'package:hellohit/main.dart';
import 'package:hellohit/screens/intro/introscreen01.dart';
import 'package:hellohit/screens/intro/introscreen02.dart';
import 'package:hellohit/screens/intro/introscreen03.dart';
import 'package:hellohit/screens/intro/introscreen04.dart';
import 'package:hellohit/screens/intro/introscreen05.dart';

class Splach_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Color(0xffE0651F),
            padding: EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Image.asset(
                        "assets/logo_hello.png",
                        width: 200,
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IntroScreen01(),
          IntroScreen02(),
          IntroScreen03(),
          IntroScreen04(),
          IntroScreen05(),
        ],
      ),
    );
  }
}
