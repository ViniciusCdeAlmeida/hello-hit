import 'package:json_annotation/json_annotation.dart';

import 'package:hellohit/models/preco_pagamento_model.dart';

part 'produtos_pagamento_model.g.dart';

@JsonSerializable()
class ProdutosPagamento {
  String id;
  bool active;
  String description;
  String name;
  List<PrecoPagamento> prices;
  ProdutosPagamento({
    this.id,
    this.active,
    this.description,
    this.name,
    this.prices,
  });

  factory ProdutosPagamento.fromJson(Map<String, dynamic> json) =>
      _$ProdutosPagamentoFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutosPagamentoToJson(this);
}
