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
        borderRadius: BorderRadius.circular(10.0),
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
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              child: Image.network(
                post.imagem,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Text('${post.hits} Hits'),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.chat_bubble,
                    color: Colors.orange,
                  ),
                ),
                Text('${post.idsComentario.length} Comentários')
              ],
            ),
          )
        ],
      ),
    );
  }
}
