import 'package:flutter/material.dart';
import 'package:hellohit/screens/autenticacao/autenticacao_usuario_screen.dart';
import 'package:hellohit/screens/autenticacao/email_confirmacao_screen.dart';
import 'package:hellohit/screens/autenticacao/esqueci_senha_screen.dart';
import 'package:hellohit/screens/cadastro/cadastro_screen.dart';
import 'package:hellohit/screens/chat/chat_screen.dart';
import 'package:hellohit/screens/comentario_post/comentario_post_screen.dart';
import 'package:hellohit/screens/conversas/conversas_screen.dart';
import 'package:hellohit/screens/escolha_categoria/escolha_categoria_screen.dart';
import 'package:hellohit/screens/full_post/full_post_screen.dart';
import 'package:hellohit/screens/lista_usuarios/lista_usuarios_screen.dart';
import 'package:hellohit/screens/postagem/postagem_camera_screen.dart';
import 'package:hellohit/screens/feed/feed_screen.dart';
import 'package:hellohit/screens/marketplace/marketplace_screen.dart';
import 'package:hellohit/screens/marketplace/marketplace_viewall_screen.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_criacao_screen.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_pagamento_screen.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_screen.dart';
import 'package:hellohit/screens/postagem/postagem_comentario_screen.dart';
import 'package:hellohit/screens/postagem/postagem_screen.dart';
import 'package:hellohit/screens/postagem/tag_post_screen.dart';
import 'package:hellohit/screens/profile/profile_membro_screen.dart';
import 'package:hellohit/screens/profile/profile_procura_screen.dart';
import 'package:hellohit/screens/profile/profile_time_edicao_screen.dart';
import 'package:hellohit/screens/profile/profile_time_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_edicao_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_screen.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_pro_item.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_explicacao_talento_screen.dart';
import 'package:hellohit/screens/telas_estaticas/widget/tela_pagamento_pro_item.dart';
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
    AutenticacaoUsuarioScreen.routeName: (ctx) => AutenticacaoUsuarioScreen(),
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
    TelaExplicacaoTalentoScreen.routeName: (ctx) =>
        TelaExplicacaoTalentoScreen(),
    ProfileUsuarioEdicaoScreen.routeName: (ctx) => ProfileUsuarioEdicaoScreen(),
    TelaPagamentoProItem.routeName: (ctx) => TelaPagamentoProItem(),
    TelaExplicacaoProItem.routeName: (ctx) => TelaExplicacaoProItem(),
    PostagemCameraScreen.routeName: (ctx) => PostagemCameraScreen(),
    EmailConfirmacaoScreen.routeName: (ctx) => EmailConfirmacaoScreen(),
    PostagemScreen.routeName: (ctx) => PostagemScreen(),
    FullPostScreen.routeName: (ctx) => FullPostScreen(),
    TagPostScreen.routeName: (ctx) => TagPostScreen(),
    ProfileTimeEdicaoScreen.routeName: (ctx) => ProfileTimeEdicaoScreen(),
    ChatScreen.routeName: (ctx) => ChatScreen(),
    ComentarioPostScreen.routeName: (ctx) => ComentarioPostScreen(),
    PostagemComentarioScreen.routeName: (ctx) => PostagemComentarioScreen(),
    ConversasScreen.routeName: (ctx) => ConversasScreen(),
    EscolhaCategoriaScreen.routeName: (ctx) => EscolhaCategoriaScreen(),
    ListaUsuarios.routeName: (ctx) => ListaUsuarios(),
  };
}
