// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as String,
    comments: json['comments'] as List,
    hits: json['hits'] as int,
    tip: json['tip'] as String,
    text: json['text'] as String,
    user: json['user'],
    file: json['file'],
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'hits': instance.hits,
      'tip': instance.tip,
      'comments': instance.comments,
      'text': instance.text,
      'user': instance.user,
      'file': instance.file,
    };
