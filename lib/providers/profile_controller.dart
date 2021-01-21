import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hellohit/models/usuario_model.dart';

class ProfileController {
  List<Usuario> usuario;

  Future<List<Usuario>> seed() async {
    ByteData data = await rootBundle.load('assets/resources/usuario_seed.json');
    var json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
    usuario = List<Usuario>.from(
      (json['objects'] as List).map(
        (item) => Usuario(
          id: item['id'],
          fans: item['fans'],
          categoria: item['categoria'],
          hits: item['descrhitsicao'],
          idUsuario: item['imaidUsuariogem'],
          imagem: item['imagem'],
          localizacao: item['localizacao'],
          mensagem: item['mensagem'],
          nome: item['nome'],
          posts: item['posts'],
          premium: item['premium'],
          skills: item['skills'],
          time: item['time'],
        ),
      ),
    );
    return usuario;
  }
}
