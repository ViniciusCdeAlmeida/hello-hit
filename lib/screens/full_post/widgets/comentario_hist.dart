import 'package:flutter/material.dart';

class ComentarioHitsFullPost extends StatelessWidget {
  const ComentarioHitsFullPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.comment_sharp,
            color: Colors.orange[700],
            size: 20,
          ),
          Text(
            '103 Coments',
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.star,
            color: Colors.orange[700],
            size: 20,
          ),
          Text(
            '392 Hits',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
