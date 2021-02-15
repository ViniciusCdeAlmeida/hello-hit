import 'package:dio/dio.dart';
import 'package:hellohit/models/index_models.dart';
import 'package:hellohit/utils/endpoint.dart';
// import 'package:stripe_payment/stripe_payment.dart';

class PagamentoController {
  // ignore: missing_return
  Future<List<ProdutosPagamento>> getProdutos() async {
    try {
      Response res = await Endpoint.getProdutos();
      return res.data
          .map<ProdutosPagamento>(
              (content) => ProdutosPagamento.fromJson(content))
          .toList() as List<ProdutosPagamento>;
    } catch (e) {
      throw e;
    }
  }

  Future<void> makeTimePayment(String pm, String priceId) async {
    try {
      await Endpoint.makePayment(pm, priceId);
    } catch (e) {
      throw e;
    }
  }
}
