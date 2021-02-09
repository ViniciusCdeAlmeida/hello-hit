// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oportunidade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Oportunidade _$OportunidadeFromJson(Map<String, dynamic> json) {
  return Oportunidade(
    id: json['_id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    isOpen: json['isOpen'] as bool,
    team: json['team'],
    location: json['location'] as String,
    typeOpportunity: json['typeOpportunity'],
    urlYoutube: json['urlYoutube'] as String,
    website: json['website'] as String,
    expireAt: json['expireAt'] == null
        ? null
        : DateTime.parse(json['expireAt'] as String),
    categoria: json['categoria'] == null
        ? null
        : Categoria.fromJson(json['categoria'] as Map<String, dynamic>),
    candidates: json['candidates'] as List,
    hitCount: json['hitCount'] as int,
    hits: (json['hits'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$OportunidadeToJson(Oportunidade instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'isOpen': instance.isOpen,
      'team': instance.team,
      'location': instance.location,
      'typeOpportunity': instance.typeOpportunity,
      'urlYoutube': instance.urlYoutube,
      'website': instance.website,
      'expireAt': instance.expireAt?.toIso8601String(),
      'categoria': instance.categoria,
      'candidates': instance.candidates,
      'hitCount': instance.hitCount,
      'hits': instance.hits,
    };
