import 'package:flutter/material.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_criacao_screen.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/screens/splash/base_screen.dart';
import 'package:hellohit/utils/providers.dart';
import 'package:hellohit/utils/rotas.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load(fileName: '.env');
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
        home: OportunidadeCriacaoScreen(),
        routes: rotas(),
      ),
    );
  }
}
