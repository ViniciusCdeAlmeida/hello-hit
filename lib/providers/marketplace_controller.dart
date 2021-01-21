import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hellohit/models/oportunidade_model.dart';

class MarketPlaceController {
  List<Oportunidade> carreira;

  Future<List<Oportunidade>> seed() async {
    ByteData data =
        await rootBundle.load('assets/resources/marketplace_seed.json');
    var json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
    carreira = List<Oportunidade>.from(
      (json['objects'] as List).map(
        (item) => Oportunidade(
          id: item['id'],
          banner: item['banner'],
          categoria: item['categoria'],
          descricao: item['descricao'],
          imagem: item['imagem'],
          nomeOrganizacao: item['nomeOrganizacao'],
          video: item['video'],
        ),
      ),
    );
    return carreira;
  }
}
