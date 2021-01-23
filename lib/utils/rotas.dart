import 'package:flutter/material.dart';
import 'package:hellohit/screens/marketplace/marketplace_viewall_screen.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_screen.dart';
import 'package:hellohit/screens/profile/profile_time_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_screen.dart';

Map<String, Widget Function(BuildContext)> rotas() {
  return {
    MarketplaceViewallScreen.routeName: (ctx) => MarketplaceViewallScreen(),
    OportunidadeScreen.routeName: (ctx) => OportunidadeScreen(),
    ProfileUsuarioScreen.routeName: (ctx) => ProfileUsuarioScreen(),
    ProfileTimeScreen.routeName: (ctx) => ProfileTimeScreen(),
  };
}
