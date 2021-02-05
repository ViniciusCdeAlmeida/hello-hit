// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oportunidade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Oportunidade _$OportunidadeFromJson(Map<String, dynamic> json) {
  return Oportunidade(
    id: json['id'] as String,
    nomeOrganizacao: json['nomeOrganizacao'] as String,
    imagem: json['imagem'] as String,
    categoria: json['categoria'] as String,
    descricao: json['descricao'] as String,
    duracaoOportunidade: json['duracaoOportunidade'] == null
        ? null
        : DateTime.parse(json['duracaoOportunidade'] as String),
    video: json['video'] as String,
    banner: json['banner'] as String,
  );
}

Map<String, dynamic> _$OportunidadeToJson(Oportunidade instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomeOrganizacao': instance.nomeOrganizacao,
      'imagem': instance.imagem,
      'banner': instance.banner,
      'categoria': instance.categoria,
      'descricao': instance.descricao,
      'duracaoOportunidade': instance.duracaoOportunidade?.toIso8601String(),
      'video': instance.video,
    };
