import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/widgets/acoes.dart';
import 'package:hellohit/widgets/popup_menu.dart';

import 'package:timeago/timeago.dart' as timeago;

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

  void _actionButtons(int id, Acoes acoes) {
    switch (acoes) {
      case Acoes.editarPost:
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => MoorDbViewer(db)));
        break;
      case Acoes.removerPost:
        // Navigator.of(context).pushNamed(BensInventariadosScreen.routeName);
        break;
      case Acoes.denunciarPost:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final difference = now.difference(widget.post.createdAt);
    var timeAgo = timeago.format(now.subtract(difference), locale: 'en');
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      backgroundImage: widget.post.user.avatar == null
                          ? AssetImage(
                              'assets/images/procurar_talentos_assets/icone_padrao_oportunidade.png')
                          : NetworkImage(widget.post.user.avatar['url']
                              // .toString()
                              // .replaceAll(RegExp(r'localhost'), '192.168.15.7')
                              // .toString()
                              ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.user.full_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Text(
                          timeAgo,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      PopupMenuButton<Acoes>(
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colors.black,
                        ),
                        // onSelected: (value) {
                        //   _redirecionamento(value,
                        //       widget.unidade.estruturaOrganizacional.id);
                        // },
                        offset: Offset(0, 100),
                        itemBuilder: (context) => <PopupMenuEntry<Acoes>>[
                          PopupMenuItem<Acoes>(
                            child: PopupMenuCustom('Edit Post', Icons.edit),
                            value: Acoes.editarPost,
                          ),
                          const PopupMenuDivider(),
                          PopupMenuItem<Acoes>(
                            child: PopupMenuCustom(
                                'Remove Post', Icons.highlight_remove),
                            value: Acoes.removerPost,
                          ),
                          const PopupMenuDivider(),
                          PopupMenuItem<Acoes>(
                            child: PopupMenuCustom('Report Post', Icons.report),
                            value: Acoes.denunciarPost,
                          ),
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
                children: [
                  if (widget.post.team != null) Text(widget.post.team),
                  if (widget.post.event != null) Text(widget.post.event),
                  if (widget.post.location != null) Text(widget.post.location),
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
            height: 300,
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              child: Image.network(
                widget.post.file['url'],
                // .toString()
                // .replaceAll(RegExp(r'localhost'), '192.168.15.7')
                // .toString(),
                fit: BoxFit.fill,
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ImageIcon(
                        AssetImage(
                            'assets/images/perfil_assets/comentario_inativo.png'),
                        color: Colors.grey,
                        size: 20,
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
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8.0),
            child: Row(
              children: [
                Text(
                  '${widget.post.hits} Hits',
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
                InkWell(
                  onTap: () {},
                  child:
                      Text('View all ${widget.post.comments.length} comments'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
