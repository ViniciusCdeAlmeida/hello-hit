// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as int,
    comentario: (json['comentario'] as List)
        ?.map((e) =>
            e == null ? null : Comentario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hits: json['hits'] as int,
    idsComentario:
        (json['idsComentario'] as List)?.map((e) => e as int)?.toList(),
    imagem: json['imagem'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'comentario': instance.comentario,
      'hits': instance.hits,
      'idsComentario': instance.idsComentario,
      'imagem': instance.imagem,
    };
