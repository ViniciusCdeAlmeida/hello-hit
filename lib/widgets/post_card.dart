import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohit/models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
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
                      backgroundImage: NetworkImage(post.imagem),
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
              'Lorem ipsum elementum urna vel ornare platea vivamus, mi fermentum curae tristique nisl sed, nostra sociosqu imperdiet consequat dictumst vehicula. Lorem ipsum elementum urna vel ornare platea vivamus, mi fermentum curae tristique nisl sed, nostra sociosqu imperdiet consequat dictumst vehicula. ',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ClipRRect(
            child: Image.network(
              post.imagem,
              fit: BoxFit.cover,
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
                      child: Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 30,
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
                          color: Colors.grey, fontWeight: FontWeight.bold),
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
                  '${post.hits} Hits',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    '\$${post.hits} Tips',
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
                  child: Text('View all ${post.idsComentario.length} comments'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
