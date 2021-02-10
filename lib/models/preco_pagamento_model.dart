import 'package:json_annotation/json_annotation.dart';

part 'preco_pagamento_model.g.dart';

@JsonSerializable()
class PrecoPagamento {
  String id;
  bool active;
  String object;
  String name;
  int amount;
  String amount_decimal;
  String product;
  String quantidade;
  PrecoPagamento({
    this.id,
    this.active,
    this.object,
    this.name,
    this.amount,
    this.amount_decimal,
    this.product,
    this.quantidade,
  });

  factory PrecoPagamento.fromJson(Map<String, dynamic> json) =>
      _$PrecoPagamentoFromJson(json);

  Map<String, dynamic> toJson() => _$PrecoPagamentoToJson(this);
}
