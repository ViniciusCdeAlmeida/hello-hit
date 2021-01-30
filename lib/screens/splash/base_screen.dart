import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hellohit/screens/intro/intro_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 15),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => IntroScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
    );
  }
}
