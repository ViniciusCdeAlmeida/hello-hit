import 'package:flutter/material.dart';
import 'package:hellohit/screens/esqueci_senha/esqueci_senhascreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'HelloHit',
    theme: ThemeData(
      primaryColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
    ),
    home: EsqueciSenhaScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
