import 'package:flutter/material.dart';
import 'package:hellohit/screens/bookmark/bookmark_screen.dart';
import 'package:hellohit/screens/index_screens.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_pro_item.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_talento_screen.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_pagamento_pro_item.dart';

Map<String, Widget Function(BuildContext)> rotas() {
  return {
    MarketplaceViewallScreen.routeName: (ctx) => MarketplaceViewallScreen(),
    OportunidadeScreen.routeName: (ctx) => OportunidadeScreen(),
    ProfileUsuarioScreen.routeName: (ctx) => ProfileUsuarioScreen(),
    ProfileTimeScreen.routeName: (ctx) => ProfileTimeScreen(),
    AutenticacaoUsuarioScreen.routeName: (ctx) => AutenticacaoUsuarioScreen(),
    FeedScreen.routeName: (ctx) => FeedScreen(),
    ProfileProcuraScreen.routeName: (ctx) => ProfileProcuraScreen(),
    MarketPlaceScreen.routeName: (ctx) => MarketPlaceScreen(),
    TimesOportunidadesScreen.routeName: (ctx) => TimesOportunidadesScreen(),
    TelaExplicacaoTimeScreen.routeName: (ctx) => TelaExplicacaoTimeScreen(),
    OportunidadeCriacaoScreen.routeName: (ctx) => OportunidadeCriacaoScreen(),
    OportunidadePagamentoScreen.routeName: (ctx) => OportunidadePagamentoScreen(),
    EsqueciSenhaScreen.routeName: (ctx) => EsqueciSenhaScreen(),
    CadastroScreen.routeName: (ctx) => CadastroScreen(),
    TimeScreen.routeName: (ctx) => TimeScreen(),
    TelaPagamentoTimeScreen.routeName: (ctx) => TelaPagamentoTimeScreen(),
    ProfileMembroScreen.routeName: (ctx) => ProfileMembroScreen(),
    TelaExplicacaoTalentoScreen.routeName: (ctx) => TelaExplicacaoTalentoScreen(),
    ProfileUsuarioEdicaoScreen.routeName: (ctx) => ProfileUsuarioEdicaoScreen(),
    TelaPagamentoProItem.routeName: (ctx) => TelaPagamentoProItem(),
    TelaExplicacaoProItem.routeName: (ctx) => TelaExplicacaoProItem(),
    PostagemCameraScreen.routeName: (ctx) => PostagemCameraScreen(),
    EmailConfirmacaoScreen.routeName: (ctx) => EmailConfirmacaoScreen(),
    PostagemComentarioScreen.routeName: (ctx) => PostagemComentarioScreen(),
    FullPostScreen.routeName: (ctx) => FullPostScreen(),
    PostagemConclusaoScreen.routeName: (ctx) => PostagemConclusaoScreen(),
    ProfileTimeEdicaoScreen.routeName: (ctx) => ProfileTimeEdicaoScreen(),
    ChatScreen.routeName: (ctx) => ChatScreen(),
    ComentarioPostScreen.routeName: (ctx) => ComentarioPostScreen(),
    ConversasScreen.routeName: (ctx) => ConversasScreen(),
    EscolhaCategoriaScreen.routeName: (ctx) => EscolhaCategoriaScreen(),
    ListaUsuarios.routeName: (ctx) => ListaUsuarios(),
    BookmarkScreen.routeName: (ctx) => BookmarkScreen(),
  };
}
