import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:hellohit/providers/stores/feed_store.dart';
import 'package:hellohit/screens/postagem/postagem_camera_screen.dart';
import 'package:hellohit/screens/marketplace/marketplace_screen.dart';
import 'package:hellohit/screens/profile/profile_procura_screen.dart';
import 'package:hellohit/screens/profile/profile_time_screen.dart';
import 'package:hellohit/screens/profile/profile_usuario_screen.dart';
import 'package:hellohit/screens/time/time_screen.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/widgets/post_card.dart';
import 'package:hellohit/widgets/custom_drawer.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = '/feedScreen';
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  FeedStore _feedStore;
  AutenticacaoStore _autenticacaoStore;
  int id;
  Usuario _usuario;

  @override
  void didChangeDependencies() {
    _feedStore = Provider.of<FeedStore>(context);
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    _feedStore.feedList();
    _usuario = _autenticacaoStore.usuarioLogado;
    super.didChangeDependencies();
  }

  Future<void> atualizarFeed() async {
    await _feedStore.feedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        iconSize: 35,
        selectedItemColor: Color(0xffF26525),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          color: Color(0xffF26525),
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          color: Color(0xffF26525),
          fontSize: 14,
        ),
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/perfil_assets/Barra_fixa_newsfeed.png'),
              color: Color(0xffF26525),
              // size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/perfil_assets/Barra_fixa_teams.png'),
              color: Color(0xffF26525),
              // size: 20,
            ),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/oportunidades_assets/icone_destaque_oport_recom.png'),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/perfil_assets/Barra_fixa_jobs.png'),
              color: Color(0xffF26525),
              // size: 20,
            ),
            label: 'Recruit',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/perfil_assets/Barra_fixa_perfil.png'),
              color: Color(0xffF26525),
              // size: 20,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).pushNamed(FeedScreen.routeName);
              break;
            case 1:
              Navigator.of(context).pushNamed(TimeScreen.routeName);
              break;
            case 2:
              Navigator.of(context).pushNamed(PostagemCameraScreen.routeName);
              break;
            case 3:
              Navigator.of(context).pushNamed(MarketPlaceScreen.routeName);
              break;
            case 4:
              _usuario.userType == 'TEAM'
                  ? Navigator.of(context).pushNamed(ProfileTimeScreen.routeName,
                      arguments: _usuario.id)
                  : Navigator.of(context).pushNamed(
                      ProfileUsuarioScreen.routeName,
                      arguments: _usuario.id);
              break;
          }
        },
      ),
      backgroundColor: Colors.grey[100],
      drawer: CustomDrawer(usuario: _usuario),
      body: RefreshIndicator(
        onRefresh: atualizarFeed,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.grey[100],
              title: Container(
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logos/logo_hello.png'),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => Navigator.of(context)
                      .pushNamed(ProfileProcuraScreen.routeName),
                ),
              ],
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: ImageIcon(
                      AssetImage(
                          'assets/images/perfil_post_assets/Icon_menu.png'),
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              elevation: 0,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Observer(
                // ignore: missing_return
                builder: (_) {
                  switch (_feedStore.feedState) {
                    case FeedState.inicial:
                    case FeedState.carregando:
                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      );
                    case FeedState.carregado:
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _feedStore.feed.length,
                          itemBuilder: (_, idx) => Column(
                            children: [
                              Observer(
                                builder: (_) {
                                  return PostCard(
                                    post: _feedStore.feed[idx],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                  }
                },
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
