import 'package:flutter/material.dart';

class EscolhaCategoraScreen extends StatefulWidget {
  @override
  _EscolhaCategoraScreenState createState() => _EscolhaCategoraScreenState();
}

class _EscolhaCategoraScreenState extends State<EscolhaCategoraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Interest categories',
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
