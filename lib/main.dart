import 'package:flutter/material.dart';
import 'package:hellohit/screens/tag_post/tag_post_screen.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/utils/providers.dart';
import 'package:hellohit/utils/rotas.dart';

import 'package:hellohit/screens/cards/cards_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        title: 'HelloHit',
        theme: ThemeData(
          textSelectionColor: Colors.white,
          primaryColor: Colors.orange[700],
          toggleableActiveColor: const Color(0xFF2247C7),
          errorColor: const Color(0xFF7A1C02),
          fontFamily: 'Lato',
        ),
        home: TagPostScreen(),
        routes: rotas(),
      ),
    );
  }
}
