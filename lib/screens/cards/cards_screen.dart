import 'package:flutter/material.dart';
import 'package:hellohit/screens/cards/widgets/credit_card.dart';
import 'package:path/path.dart';

class CardsScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container( //My container or any other widget
            color: Colors.blue,
          ),
          new Positioned( //Place it at the top, and not use the entire screen
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(title: Text('Hello world'),
            backgroundColor: Colors.transparent, //No more green
            elevation: 0.0, //Shadow gone
          ),),
        ], ),
    );
  }