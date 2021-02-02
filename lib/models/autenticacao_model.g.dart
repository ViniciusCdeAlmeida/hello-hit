// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Autenticacao _$AutenticacaoFromJson(Map<String, dynamic> json) {
  return Autenticacao(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AutenticacaoToJson(Autenticacao instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
