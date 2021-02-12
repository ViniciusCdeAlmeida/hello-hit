import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';
import 'package:hellohit/models/produtos_pagamento_model.dart';
import 'package:hellohit/providers/pagamento_controller.dart';
import 'package:hellohit/providers/stores/autenticacao_store.dart';
import 'package:mobx/mobx.dart';

part 'pagamento_store.g.dart';

class PagamentoStore = _PostStore with _$PagamentoStore;

enum PagamentoState {
  inicial,
  carregando,
  carregado,
}

abstract class _PostStore with Store {
  final PagamentoController _pagamentoController;
  final AutenticacaoStore _autenticacaoStore;
  _PostStore(this._pagamentoController, this._autenticacaoStore);

  final _stripePayment = FlutterStripePayment();

  @observable
  bool pagando = false;

  @observable
  ObservableList<ProdutosPagamento> _produtosObservable =
      ObservableList<ProdutosPagamento>();

  @observable
  ObservableFuture<List<ProdutosPagamento>> _produtosFuture;

  @computed
  List<ProdutosPagamento> get produtos {
    return [..._produtosObservable];
  }

  @computed
  List<ProdutosPagamento> get produtosProTalento {
    var temp = [
      ..._produtosObservable.where((element) => element.name == 'Pro Plan')
    ];
    temp[0].prices.forEach((element) {
      if (element.amount == 490) element.quantidade = '3';
      if (element.amount == 5700) element.quantidade = '100';
    });
    return temp;
  }

  @computed
  List<ProdutosPagamento> get produtosAdicionarMembroTime {
    return [
      ..._produtosObservable
          .where((element) => element.name == 'Pro Time Membros')
    ];
  }

  @computed
  List<ProdutosPagamento> get produtosCriarOportunidadeTime {
    return [
      ..._produtosObservable
          .where((element) => element.name == 'Pro Time Oportunidade')
    ];
  }

  @computed
  // ignore: missing_return
  PagamentoState get pagamentoState {
    if ((_produtosFuture == null ||
        _produtosFuture.status == FutureStatus.rejected)) {
      return PagamentoState.inicial;
    }

    if (_produtosFuture.status == FutureStatus.pending) {
      return PagamentoState.carregando;
    }

    if (_produtosFuture.status == FutureStatus.fulfilled)
      return PagamentoState.carregado;
  }

  @action
  Future<void> getProdutos() async {
    try {
      _produtosFuture = ObservableFuture(_pagamentoController.getProdutos());
      _produtosObservable = (await _produtosFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> makePagamentoTime(String priceId) async {
    pagando = true;
    _stripePayment.setStripeSettings(
        "pk_test_51IGZOsAIZbIeL4kbzXM2d0xQWrYaANIfsEGpSjniCSOWBZacXYOgZBUgPkDHMp0WJlmtHyq6kqURt8twkbzcHusW00xKkjr7bV");
    try {
      PaymentResponse paymentResponse = await _stripePayment.addPaymentMethod();
      await _pagamentoController
          .makeTimePayment(paymentResponse.paymentMethodId, priceId)
          .whenComplete(() => pagando = false);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> makePagamentoTalentoPro(String priceId) async {
    _stripePayment.setStripeSettings(
        "pk_test_51IGZOsAIZbIeL4kbzXM2d0xQWrYaANIfsEGpSjniCSOWBZacXYOgZBUgPkDHMp0WJlmtHyq6kqURt8twkbzcHusW00xKkjr7bV");
    try {
      PaymentResponse paymentResponse = await _stripePayment.addPaymentMethod();
      pagando = true;
      await _pagamentoController
          .makeTimePayment(paymentResponse.paymentMethodId, priceId)
          .then((_) {
        _autenticacaoStore.usuarioLogado.userType = 'PRO';
        _autenticacaoStore.usuarioLogado.signatureStatus = 'ACTIVE';
        pagando = false;
      }).whenComplete(() => pagando = false);
    } catch (e) {
      throw e;
    }
  }
}
