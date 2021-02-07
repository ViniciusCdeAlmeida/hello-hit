// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oportunidade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Oportunidade _$OportunidadeFromJson(Map<String, dynamic> json) {
  return Oportunidade(
    id: json['id'] as String,
    title: json['title'] as String,
    imageUrl: json['imageUrl'] as String,
    location: json['location'] as String,
    typeOpportunity: json['typeOpportunity'] as String,
    urlYoutube: json['urlYoutube'] as String,
    duracaoOportunidade: json['duracaoOportunidade'] == null
        ? null
        : DateTime.parse(json['duracaoOportunidade'] as String),
    team: json['team'] as String,
    website: json['website'] as String,
  );
}

Map<String, dynamic> _$OportunidadeToJson(Oportunidade instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'typeOpportunity': instance.typeOpportunity,
      'urlYoutube': instance.urlYoutube,
      'duracaoOportunidade': instance.duracaoOportunidade?.toIso8601String(),
      'team': instance.team,
      'website': instance.website,
    };
