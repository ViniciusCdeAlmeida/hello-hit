// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comentario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comentario _$ComentarioFromJson(Map<String, dynamic> json) {
  return Comentario(
    id: json['_id'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$ComentarioToJson(Comentario instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
    };
