import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/models/post_model.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    @required this.post,
  });

  final Post post;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    var t = widget.post.file['url']
        .toString()
        .replaceAll(RegExp(r'localhost'), '192.168.15.7');
    print(t);
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
                      backgroundImage: NetworkImage(widget.post.file['url']
                          .toString()
                          .replaceAll(RegExp(r'localhost'), '192.168.15.7')
                          .toString()),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Teste',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '10h atrás',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
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
                          'Horario',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_horiz),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
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
          Container(
            height: 300,
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              child: Image.network(
                widget.post.file['url']
                    .toString()
                    .replaceAll(RegExp(r'localhost'), '192.168.15.7')
                    .toString(),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      'SEND TIP',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    '\$${widget.post.hits} Tips',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0, top: 8.0, bottom: 18.0),
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
