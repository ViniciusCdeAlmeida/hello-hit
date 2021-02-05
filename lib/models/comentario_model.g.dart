// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comentario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comentario _$ComentarioFromJson(Map<String, dynamic> json) {
  return Comentario(
    id: json['id'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$ComentarioToJson(Comentario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
    };
