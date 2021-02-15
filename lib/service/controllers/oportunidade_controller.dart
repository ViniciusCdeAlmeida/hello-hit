import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';

class OportunidadeController {
  Future<List<Oportunidade>> getOportunidadeList() async {
    try {
      Response res = await Endpoint.getOportunidadesList();
      return res.data
          .map<Oportunidade>((content) => Oportunidade.fromJson(content))
          .toList() as List<Oportunidade>;
    } catch (e) {
      throw e;
    }
  }

  Future<Oportunidade> getOportunidade(String id) async {
    try {
      Response res = await Endpoint.getOportunidade(id);
      return Oportunidade.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }

  Future<void> patchHitOportunidade(String id, Map body) async {
    try {
      await Endpoint.patchHitOportunidade(id, body);
    } catch (e) {
      throw e;
    }
  }

  Future<void> makeOportunidade(Oportunidade oportunidade) async {
    try {
      await Endpoint.postOportunidade(oportunidade);
    } catch (e) {
      throw e;
    }
  }
}
