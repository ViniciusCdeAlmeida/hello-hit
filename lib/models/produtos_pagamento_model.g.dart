// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_pagamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdutosPagamento _$ProdutosPagamentoFromJson(Map<String, dynamic> json) {
  return ProdutosPagamento(
    id: json['id'] as String,
    active: json['active'] as bool,
    description: json['description'] as String,
    name: json['name'] as String,
    prices: (json['prices'] as List)
        ?.map((e) => e == null
            ? null
            : PrecoPagamento.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProdutosPagamentoToJson(ProdutosPagamento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'description': instance.description,
      'name': instance.name,
      'prices': instance.prices,
    };
