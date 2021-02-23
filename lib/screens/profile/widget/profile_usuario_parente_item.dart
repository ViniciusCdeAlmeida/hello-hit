import 'package:flutter/material.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/screens/comentario_post/comentario_post_screen.dart';

class UsuarioParente extends StatelessWidget {
  final Post post;

  UsuarioParente({
    this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          ComentarioPostScreen.routeName,
          arguments: post.id,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            const Radius.circular(3),
          ),
          child: Image.network(
            post.file['url'].toString().replaceAll(RegExp(r'localhost'), '192.168.15.8').toString(),
            height: 10,
            cacheHeight: 500,
            cacheWidth: 500,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
