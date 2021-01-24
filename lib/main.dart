import 'package:flutter/material.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_pro_item.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_pagamento_pro_item.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/screens/profile/profile_time_screen.dart';
import 'package:hellohit/utils/providers.dart';
import 'package:hellohit/utils/rotas.dart';

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
        home: TelaPagamentoProItem(),
        // home: ProfileUsuarioScreen(),
        routes: rotas(),
      ),
    );
  }
}
