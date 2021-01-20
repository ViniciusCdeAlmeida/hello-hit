import 'package:flutter/material.dart';
import 'package:hellohit/screens/login/loginscreen.dart';
import 'package:hellohit/screens/splach/splachscreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'HelloHit',
    theme: ThemeData(
      primaryColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
    ),
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
