import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:hellohit/screens/camera_post/camera_post.dart';
import 'package:hellohit/screens/escolha_categoria/escolha_categoria_screen.dart';
import 'package:hellohit/screens/marketplace/marketplace_screen.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_screen.dart';
import 'package:hellohit/screens/profile/profile_procura_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_screen.dart';
>>>>>>> 1da31164c53db984e2bc9e44984b92056d128eb0
import 'package:provider/provider.dart';

import 'package:hellohit/utils/providers.dart';
import 'package:hellohit/utils/rotas.dart';

import 'package:hellohit/screens/conversas/conversas_screen.dart';

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
        home: ConversasScreen(),
        routes: rotas(),
      ),
    );
  }
}
