import 'package:flutter/material.dart';
import 'package:hellohit/screens/splach/splachscreen.dart';

final ThemeData temaPadrao =
    ThemeData(primaryColor: Color(0xffE0651F), accentColor: Color(0xffE0651F));

void main() {
  runApp(MaterialApp(
    title: 'HelloHit',
    theme: ThemeData(),
    home: Splach_Screen(),
    debugShowCheckedModeBanner: false,
  ));
}
