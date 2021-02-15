import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class MarketPlaceController {
  Future<List<Oportunidade>> getOportunidade() async {
    try {
      Response res = await Endpoint.getOportunidadesList();
      return res.data
          .map<Oportunidade>((content) => Oportunidade.fromJson(content))
          .toList() as List<Oportunidade>;
    } catch (e) {
      throw e;
    }
  }
}
