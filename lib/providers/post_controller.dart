import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/utils/custom_dio.dart';

class PostController {
  List<Post> posts;

  Future<List<Post>> seed() async {
    Dio dio = Dio()..options.baseUrl = "http://192.168.60.2:3000/";
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

  Future<List<Post>> findAll() {
    var dio = CustomDio.withAuthentication().instance;
    return dio.get('http://localhost:3000/posts').then((res) {
      return res.data.map<Post>((c) => Post.fromJson(c)).toList() as List<Post>;
    }).catchError((err) => print(err));
  }

  Future<List<Post>> findFilter(String nome) {
    var dio = CustomDio.withAuthentication().instance;
    return dio
        .get('http://localhost:3000/contatos/filtrar?nome=$nome')
        .then((res) {
      return res.data.map<Post>((c) => Post.fromJson(c)).toList() as List<Post>;
    });
  }
}
