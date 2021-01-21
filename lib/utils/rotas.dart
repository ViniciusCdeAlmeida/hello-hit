import 'package:flutter/material.dart';
import 'package:hellohit/screens/marketplace/marketplace_viewall_screen.dart';
import 'package:hellohit/screens/oportunidade/oportunidade_screen.dart';

Map<String, Widget Function(BuildContext)> rotas() {
  return {
    MarketplaceViewallScreen.routeName: (ctx) => MarketplaceViewallScreen(),
    OportunidadeScreen.routeName: (ctx) => OportunidadeScreen(),
  };
}
