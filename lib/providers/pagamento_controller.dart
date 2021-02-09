import 'package:dio/dio.dart';
import 'package:hellohit/utils/endpoint.dart';
// import 'package:stripe_payment/stripe_payment.dart';

class PagamentoController {
  // Token _paymentToken;
  // PaymentMethod _paymentMethod;

  // Future<void> makeTimePayment() async {
  //   Response res = await Endpoint.createSubscription();
  //   print(res);
  // }

  Future<void> makeTimePayment(String pm) async {
    try {
      Response res = await Endpoint.makePayment(pm);
      print(res);
    } catch (e) {
      print(e);
    }
  }
}
