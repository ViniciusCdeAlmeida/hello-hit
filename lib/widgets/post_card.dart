import 'package:flutter/material.dart';
import 'package:hellohit/utils/keys.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/screens/index_screens.dart';
import 'package:hellohit/service/stores/index_stores.dart';
import 'package:hellohit/widgets/acoes.dart';
import 'package:hellohit/widgets/popup_menu.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    @required this.post,
    this.id,
  });

  final Post post;
  final String id;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  var now = DateTime.now();
  PostagemStore _postStore;
  AutenticacaoStore _autenticacaoStore;
  FeedStore _feedStore;

  void _actionButtons(Post post, Acoes acoes) {
    switch (acoes) {
      case Acoes.editarPost:
        Navigator.of(context).pushNamed(
          PostagemCameraScreen.routeName,
          arguments: widget.post.id,
        );
        break;
      case Acoes.removerPost:
        showAlertDialogRemove(context, post);
        break;
      case Acoes.denunciarPost:
        break;
    }
  }

  showAlertDialogRemove(BuildContext context, Post post) {
    AlertDialog alert = AlertDialog(
      title: Text('Are you sure?'),
      content: Text('This action will delete your post.'),
      actions: <Widget>[
        FlatButton(
          key: Key(Keys.feedScreen.deleteCancelPostFeedScreen),
          onPressed: () async {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          key: Key(Keys.feedScreen.deleteOkPostFeedScreen),
          onPressed: () async {
            await _postStore.removerPostagem(post.id).then((_) => _feedStore.updateFeed(post.id));
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> makeHitPost() async {
    _postStore.makeHitPost(widget.post.id).catchError((erro) {
      setState(() {
        widget.post.hitCount -= 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _postStore = Provider.of<PostagemStore>(context);
    _autenticacaoStore = Provider.of<AutenticacaoStore>(context);
    _feedStore = Provider.of<FeedStore>(context);
    final difference = now.difference(widget.post.createdAt);
    var timeAgo = timeago.format(now.subtract(difference), locale: 'en');
    return Card(
      margin: const EdgeInsets.only(top: 0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => widget.post.user.userType == 'TEAM'
                          ? Navigator.of(context).pushNamed(ProfileTimeScreen.routeName, arguments: widget.post.user.id)
                          : Navigator.of(context)
                              .pushNamed(ProfileUsuarioScreen.routeName, arguments: widget.post.user.id),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20.0,
                        backgroundImage: widget.post.user.avatar == null
                            ? AssetImage('assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                            : NetworkImage(
                                widget.post.user.avatar['url']
                                    .toString()
                                    .replaceAll(RegExp(r'localhost'), '192.168.15.8')
                                    .toString(),
                              ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 100,
                        ),
                        child: Text(
                          widget.post.user.username,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0, right: 10.0),
                        child: Text(
                          timeAgo,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      if (widget.post.user.id == _autenticacaoStore.usuarioLogado.id)
                        PopupMenuButton<Acoes>(
                          key: Key(Keys.feedScreen.actionsFeedScreen),
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                          ),
                          onSelected: (value) {
                            _actionButtons(widget.post, value);
                          },
                          offset: Offset(0, 100),
                          itemBuilder: (context) => <PopupMenuEntry<Acoes>>[
                            PopupMenuItem<Acoes>(
                              key: Key(Keys.feedScreen.editPostFeedScreen),
                              child: PopupMenuCustom('Edit', Icons.edit),
                              value: Acoes.editarPost,
                            ),
                            const PopupMenuDivider(),
                            PopupMenuItem<Acoes>(
                              key: Key(Keys.feedScreen.deletePostFeedScreen),
                              child: PopupMenuCustom('Remove', Icons.highlight_remove),
                              value: Acoes.removerPost,
                            ),
                            // const PopupMenuDivider(),
                            // PopupMenuItem<Acoes>(
                            //   child: PopupMenuCustom('Report', Icons.report),
                            //   value: Acoes.denunciarPost,
                            // ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.post.team != null && widget.post.team.isNotEmpty) Text(widget.post.team),
                  if (widget.post.event != null && widget.post.event.isNotEmpty) Text(widget.post.event),
                  if (widget.post.location != null && widget.post.location.isNotEmpty) Text(widget.post.location),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.post.text,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 350,
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              child: Image.network(
                widget.post.file['url'].toString().replaceAll(RegExp(r'localhost'), '192.168.15.8').toString(),
                fit: BoxFit.fill,
                cacheHeight: 1080,
                cacheWidth: 1080,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8.0),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        key: Key('${Keys.feedScreen.makeHitFeedScreen}_${widget.post.id}'),
                        onPressed: () {
                          setState(() {
                            if (widget.post.user.id != _autenticacaoStore.usuarioLogado.id) {
                              if (widget.post.hits.contains(_autenticacaoStore.usuarioLogado.id)) {
                                widget.post.hitCount -= 1;
                                widget.post.hits
                                    .removeWhere((element) => element == _autenticacaoStore.usuarioLogado.id);
                                var snackBar = SnackBar(content: Text('You removed your hit.'));
                                Scaffold.of(context).showSnackBar(snackBar);
                              } else {
                                widget.post.hitCount += 1;
                                widget.post.hits.insert(0, _autenticacaoStore.usuarioLogado.id);
                                var snackBar = SnackBar(
                                    content: Text(
                                        'Yay! You Hitted ${widget.post.user.username == null ? widget.post.user.fullName : widget.post.user.username}'));
                                Scaffold.of(context).showSnackBar(snackBar);
                              }
                              makeHitPost();
                            } else {
                              var snackBar = SnackBar(
                                content: Text('A post owner cannot give a hit to himself.'),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            }
                          });
                        },
                        icon: Icon(
                          Icons.star,
                          color: widget.post.hits.contains(_autenticacaoStore.usuarioLogado.id)
                              ? Colors.orange
                              : Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        key: Key('${Keys.feedScreen.commentIconFeedScreen}_${widget.post.id}'),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            ComentarioPostScreen.routeName,
                            arguments: widget.post.id,
                          );
                        },
                        icon: Icon(
                          Icons.comment_sharp,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 5.0),
                    //   child: Icon(
                    //     Icons.monetization_on_outlined,
                    //     color: Colors.orange,
                    //   ),
                    // ),
                    // Text(
                    //   'SEND TIP',
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
                Spacer(),
                // Padding(
                //   padding: const EdgeInsets.only(right: 15.0),
                //   child: Icon(
                //     Icons.bookmark_border,
                //     color: Colors.orange,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8.0),
            child: Row(
              children: [
                Text(
                  '${widget.post.hitCount} Hits',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 15.0),
                //   child: Text(
                //     '\$${widget.post.hits} Tips',
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 17.0,
              top: 8.0,
              bottom: 18.0,
            ),
            child: Row(
              children: [
                GestureDetector(
                  key: Key('${Keys.feedScreen.commentFeedScreen}_${widget.post.id}'),
                  onTap: () => Navigator.of(context).pushNamed(
                    ComentarioPostScreen.routeName,
                    arguments: widget.post.id,
                  ),
                  child: Text('View all ${widget.post.comments.length} comments'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
