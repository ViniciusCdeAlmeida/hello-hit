import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hellohit/models/post_model.dart';

class PostController {
  List<Post> posts;

  Future<List<Post>> seed() async {
    ByteData data = await rootBundle.load('assets/resources/post_seed.json');
    var json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
    posts = List<Post>.from(
      (json['objects'] as List).map(
        (item) => Post(
          id: item['id'],
          comentario: item['comentario'],
          hits: item['hits'],
          idsComentario: item['idsComentario'],
          imagem: item['imagem'],
          idUsuario: item['idUsuario'],
        ),
      ),
    );
    return posts;
  }
}
