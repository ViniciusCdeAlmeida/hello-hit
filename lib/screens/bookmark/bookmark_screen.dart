import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hellohit/utils/keys.dart';
import 'package:provider/provider.dart';

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/screens/index_screens.dart';
import 'package:hellohit/service/stores/index_stores.dart';
import 'package:hellohit/widgets/custom_drawer.dart';
import 'package:hellohit/widgets/post_card.dart';

class BookmarkScreen extends StatefulWidget {
  static const routeName = '/bookmarkScreen';
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  FeedStore _feedStore;
  AutenticacaoStore _autenticacaoStore;
  int id;
  Usuario _usuario;
  ScrollController scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    _feedStore = Provider.of<FeedStore>(context);
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    _usuario = _autenticacaoStore.usuarioLogado;
    _feedStore.feedBookmarkList(_usuario.id);
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) _feedStore.feedBookmarkListPagination(_usuario.id);
      }
    });
    super.didChangeDependencies();
  }

  Future<void> atualizarFeed() async {
    await _feedStore.feedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(usuario: _usuario),
      body: RefreshIndicator(
        onRefresh: atualizarFeed,
        child: CustomScrollView(
          // key: Key(Keys.feedScreen.drawerBookmarkScreen),
          controller: scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.grey[100],
              title: Text('Bookmarks'),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              elevation: 0,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Observer(
                    // ignore: missing_return
                    builder: (_) {
                      switch (_feedStore.feedBookmarkState) {
                        case FeedState.inicial:
                          return Container();
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
                            padding: const EdgeInsets.all(0.0),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _feedStore.feedBookmark.length,
                              itemBuilder: (_, idx) => Column(
                                children: [
                                  Observer(
                                    builder: (_) => PostCard(
                                      post: _feedStore.feedBookmark[idx],
                                    ),
                                  ),
                                  Divider(),
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
          ],
        ),
      ),
    );
  }
}
