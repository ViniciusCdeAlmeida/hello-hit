import 'package:flutter/material.dart';
import 'package:hellohit/screens/autenticacao/autenticacao_time_screen.dart';
import 'package:hellohit/screens/autenticacao/autenticacao_usuario_screen.dart';
import 'package:hellohit/screens/autenticacao/escolha_usuario_screen.dart';
import 'package:hellohit/screens/autenticacao/esqueci_senha_screen.dart';
import 'package:hellohit/screens/cadastro/cadastro_screen.dart';
import 'package:hellohit/screens/feed/feed_screen.dart';
import 'package:hellohit/screens/login/login_screen.dart';
import 'package:hellohit/screens/marketplace/marketplace_screen.dart';
import 'package:hellohit/screens/marketplace/marketplace_viewall_screen.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_criacao_screen.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_pagamento_screen.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_screen.dart';
import 'package:hellohit/screens/profile/profile_membro_screen.dart';
import 'package:hellohit/screens/profile/profile_procura_screen.dart';
import 'package:hellohit/screens/profile/profile_time_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_edicao_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_screen.dart';
import 'package:hellohit/screens/time/tela_explicacao_time_screen.dart';
import 'package:hellohit/screens/time/tela_pagamento_time_screen.dart';
import 'package:hellohit/screens/time/time_screen.dart';
import 'package:hellohit/screens/usuario/times_oportunidades_screen.dart';

Map<String, Widget Function(BuildContext)> rotas() {
  return {
    MarketplaceViewallScreen.routeName: (ctx) => MarketplaceViewallScreen(),
    OportunidadeScreen.routeName: (ctx) => OportunidadeScreen(),
    ProfileUsuarioScreen.routeName: (ctx) => ProfileUsuarioScreen(),
    ProfileTimeScreen.routeName: (ctx) => ProfileTimeScreen(),
    AutenticacaoTimeScreen.routeName: (ctx) => AutenticacaoTimeScreen(),
    AutenticacaoUsuarioScreen.routeName: (ctx) => AutenticacaoUsuarioScreen(),
    EscolhaUsuarioScreen.routeName: (ctx) => EscolhaUsuarioScreen(),
    FeedScreen.routeName: (ctx) => FeedScreen(),
    ProfileProcuraScreen.routeName: (ctx) => ProfileProcuraScreen(),
    MarketPlaceScreen.routeName: (ctx) => MarketPlaceScreen(),
    TimesOportunidadesScreen.routeName: (ctx) => TimesOportunidadesScreen(),
    TelaExplicacaoTimeScreen.routeName: (ctx) => TelaExplicacaoTimeScreen(),
    OportunidadeCriacaoScreen.routeName: (ctx) => OportunidadeCriacaoScreen(),
    OportunidadePagamentoScreen.routeName: (ctx) =>
        OportunidadePagamentoScreen(),
    EsqueciSenhaScreen.routeName: (ctx) => EsqueciSenhaScreen(),
    CadastroScreen.routeName: (ctx) => CadastroScreen(),
    TimeScreen.routeName: (ctx) => TimeScreen(),
    TelaPagamentoTimeScreen.routeName: (ctx) => TelaPagamentoTimeScreen(),
    ProfileMembroScreen.routeName: (ctx) => ProfileMembroScreen(),
    ProfileUsuarioEdicaoScreen.routeName: (ctx) => ProfileUsuarioEdicaoScreen(),
    LoginScreen.routeName: (ctx) => LoginScreen()
  };
}
