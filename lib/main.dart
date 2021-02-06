import 'package:flutter/material.dart';
import 'package:hellohit/screens/autenticacao/autenticacao_usuario_screen.dart';
import 'package:hellohit/screens/postagem/postagem_camera_screen.dart';
import 'package:hellohit/screens/cards/cards_screen.dart';
import 'package:hellohit/screens/feed/feed_screen.dart';
import 'package:hellohit/screens/postagem/postagem_comentario_screen.dart';
import 'package:hellohit/screens/postagem/postagem_screen.dart';
import 'package:hellohit/screens/profile/profile_time_edicao_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_edicao_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_screen.dart';
import 'package:hellohit/screens/postagem/tag_post_screen.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_pagamento_talento_item.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

import 'package:hellohit/screens/splash/base_screen.dart';
import 'package:hellohit/utils/providers.dart';
import 'package:hellohit/utils/rotas.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await DotEnv.load(fileName: '.env');
  // openBox();
  runApp(MyApp());
}

// Future<void> openBox() async {
//   final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
//   Hive.init(appDocumentDir.path);
//   await Hive.openBox('tokenBox');
// }

// TODO OK - COLOCAR AS FRASES CORRETAS NA TELA DE PRO USUARIO
// TODO OK - ARRUMAR A TELA DE PAGAMENTO DE PRO USUARIO
// TODO OK - CENTRALIZAR O TEXTO NA TELA DE VIRAR PRO USUARIO
// TODO OK - COLOCAR AS FRASES EM UM ARQUIVO ERRO
// TODO OK - COLOCAR O ICONE DE BATALHA NO DRAWER
// TODO OK - COLOCAR CAIXA DE SELEÇÃO GENDER E USER TYPE NO CADASTRO
// TODO OK - TIRAR TODOS OS SEEDS
// TODO OK - DELETAR TELAS DE CADASTRO COM NUMERO
// TODO OK - COLOCAR O REENVIO DO EMAIL DE CONFIRMAÇÃO
// TODO OK - USAR A API PARA OS CADASTRO E AUTENTICAÇÃO
// TODO TROCAR TODOS OS CAMPOS QUE NÃO ESTÃO NO PADRÃO DO MATERIAL DESING
// TODO COLOCAR AS VARIAVEIS NAS TELAS DE EDIÇÃO DE PROFILE TIME/USUARIO, CADASTRO, POST, COMENTARIO, OPORTUNIDADE
// TODO COLOCAR SNACKBAR NAS MENSAGENS DE ERRO
// TODO COLOCAR AS FRASES ERRO NAS TELAS
// TODO COLOCAR A LISTA DE CARTÕES EXISTENTE NAS TELAS DE PAGAMENTO
// TODO ARRUMAR AS ROTAS QUE ESTÃO FALTANDO
// TODO USAR A API PARA OS POSTS/COMENTÁRIOS
// TODO USAR A API PARA A EDIÇÃO DO PERFIL USUARIO/TIME
// TODO PODER ADICIONAR MAIS DE UM JOB, EDUCATION E AWARD NA TELA DE EDIÇÃO DO PROFILE TIME/USUARIO
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        title: 'HelloHit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionColor: Colors.white,
          primaryColor: Colors.orange[700],
          toggleableActiveColor: const Color(0xFF2247C7),
          errorColor: const Color(0xFF7A1C02),
          fontFamily: 'Lato',
        ),
        home: BaseScreen(),
        routes: rotas(),
      ),
    );
  }
}
