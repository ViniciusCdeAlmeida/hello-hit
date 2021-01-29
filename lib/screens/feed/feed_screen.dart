import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/screens/marketplace/marketplace_screen.dart';
import 'package:hellohit/screens/marketplace/marketplace_viewall_screen.dart';
import 'package:hellohit/screens/profile/profile_procura_screen.dart';
import 'package:hellohit/screens/profile/profile_time_screen.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/providers/stores/post_store.dart';
import 'package:hellohit/widgets/post_card.dart';
import 'package:hellohit/widgets/custom_drawer.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = '/feedScreen';
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  PostStore _postStore;
  int id;
  @override
  void didChangeDependencies() {
    _postStore = Provider.of<PostStore>(context);
    _postStore.seed();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
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
                AssetImage(
                    'assets/images/perfil_assets/Barra_fixa_newsfeed.png'),
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
                // child: ImageIcon(
                //   AssetImage(
                //       'assets/images/oportunidades_assets/icone_destaque_oport_recom.png'),
                // color: Color(0xffF26525),
                //   size: 50,
                // ),
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
                // Navigator.of(context).pushNamed(FeedScreen.routeName);
                break;
              case 2:
                // Navigator.of(context).pushNamed(FeedScreen.routeName);
                break;
              case 3:
                Navigator.of(context).pushNamed(MarketPlaceScreen.routeName);
                break;
              case 4:
                Navigator.of(context).pushNamed(ProfileTimeScreen.routeName);
                break;
            }
          },
        ),
        backgroundColor: Colors.blue[100],
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('STORIES'),
          // leadingWidth: 70,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: ImageIcon(
                  AssetImage('assets/images/perfil_post_assets/Icon_menu.png'),
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          elevation: 0,
          backgroundColor: Colors.blue[100],
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 13),
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.orange,
            ),
            tabs: [
              Tab(
                child: Text(
                  'All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Polular',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Talents',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Teams',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Fans',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => Navigator.of(context)
                      .pushNamed(ProfileProcuraScreen.routeName),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Observer(
              // ignore: missing_return
              builder: (_) {
                switch (_postStore.postState) {
                  case PostState.inicial:
                  case PostState.carregando:
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  case PostState.carregado:
                    // return Center(
                    //   child: CircularProgressIndicator(),
                    // );
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: _postStore.posts.length,
                        itemBuilder: (_, idx) => Column(
                          children: [
                            PostCard(
                              post: _postStore.posts[idx],
                            ),
                          ],
                        ),
                      ),
                    );
                }
              },
            ),
            Observer(
              // ignore: missing_return
              builder: (_) {
                switch (_postStore.postState) {
                  case PostState.inicial:
                  case PostState.carregando:
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  case PostState.carregado:
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: _postStore.posts.length,
                        itemBuilder: (_, idx) => Column(
                          children: [
                            PostCard(
                              post: _postStore.posts[idx],
                            ),
                          ],
                        ),
                      ),
                    );
                }
              },
            ),
            Observer(
              // ignore: missing_return
              builder: (_) {
                switch (_postStore.postState) {
                  case PostState.inicial:
                  case PostState.carregando:
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  case PostState.carregado:
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: _postStore.posts.length,
                        itemBuilder: (_, idx) => Column(
                          children: [
                            PostCard(
                              post: _postStore.posts[idx],
                            ),
                          ],
                        ),
                      ),
                    );
                }
              },
            ),
            Observer(
              // ignore: missing_return
              builder: (_) {
                switch (_postStore.postState) {
                  case PostState.inicial:
                  case PostState.carregando:
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  case PostState.carregado:
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: _postStore.posts.length,
                        itemBuilder: (_, idx) => Column(
                          children: [
                            PostCard(
                              post: _postStore.posts[idx],
                            ),
                          ],
                        ),
                      ),
                    );
                }
              },
            ),
            Observer(
              // ignore: missing_return
              builder: (_) {
                switch (_postStore.postState) {
                  case PostState.inicial:
                  case PostState.carregando:
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  case PostState.carregado:
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: _postStore.posts.length,
                        itemBuilder: (_, idx) => Column(
                          children: [
                            PostCard(
                              post: _postStore.posts[idx],
                            ),
                          ],
                        ),
                      ),
                    );
                }
              },
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
