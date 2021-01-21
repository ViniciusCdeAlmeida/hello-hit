import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hellohit/models/carreira_model.dart';

class MarketPlaceController {
  List<Carreira> carreira;

  Future<List<Carreira>> seed() async {
    ByteData data =
        await rootBundle.load('assets/resources/marketplace_seed.json');
    var json = jsonDecode(utf8.decode(data.buffer.asUint8List()));
    carreira = List<Carreira>.from(
      (json['objects'] as List).map(
        (item) => Carreira(
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
