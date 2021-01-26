import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/providers/stores/post_store.dart';
import 'package:hellohit/widgets/post_card.dart';
import 'package:hellohit/widgets/custom_drawer.dart';

class FeedScreen extends StatefulWidget {
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
        backgroundColor: Colors.blue[100],
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('sssss'),
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
                child: Text(
                  'Following',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
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
          ],
        ),
      ),
    );
  }
}
