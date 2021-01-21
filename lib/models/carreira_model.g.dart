// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carreira_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Carreira _$CarreiraFromJson(Map<String, dynamic> json) {
  return Carreira(
    id: json['id'] as int,
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

Map<String, dynamic> _$CarreiraToJson(Carreira instance) => <String, dynamic>{
      'id': instance.id,
      'nomeOrganizacao': instance.nomeOrganizacao,
      'imagem': instance.imagem,
      'banner': instance.banner,
      'categoria': instance.categoria,
      'descricao': instance.descricao,
      'duracaoOportunidade': instance.duracaoOportunidade?.toIso8601String(),
      'video': instance.video,
    };
