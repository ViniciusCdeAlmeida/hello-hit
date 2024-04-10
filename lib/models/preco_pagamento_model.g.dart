// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preco_pagamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrecoPagamento _$PrecoPagamentoFromJson(Map<String, dynamic> json) {
  return PrecoPagamento(
    id: json['id'] as String,
    active: json['active'] as bool,
    object: json['object'] as String,
    name: json['name'] as String,
    amount: json['amount'] as int,
    product: json['product'] as String,
    quantidade: json['quantidade'] as String,
  );
}

Map<String, dynamic> _$PrecoPagamentoToJson(PrecoPagamento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'object': instance.object,
      'name': instance.name,
      'amount': instance.amount,
      'product': instance.product,
      'quantidade': instance.quantidade,
    };
