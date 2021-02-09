// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['_id'] as String,
    comments: json['comments'] as List,
    hits: json['hits'] as int,
    tip: json['tip'] as String,
    text: json['text'] as String,
    user: json['user'] == null
        ? null
        : Usuario.fromJson(json['user'] as Map<String, dynamic>),
    file: json['file'],
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  )
    ..location = json['location'] as String
    ..event = json['event'] as String
    ..team = json['team'] as String;
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      '_id': instance.id,
      'hits': instance.hits,
      'tip': instance.tip,
      'comments': instance.comments,
      'text': instance.text,
      'location': instance.location,
      'event': instance.event,
      'team': instance.team,
      'user': instance.user,
      'file': instance.file,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
