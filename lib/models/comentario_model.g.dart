// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comentario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comentario _$ComentarioFromJson(Map<String, dynamic> json) {
  return Comentario(
    id: json['id'] as int,
    comentario: json['comentario'] as String,
    idPost: json['idPost'] as int,
    idUsuario: json['idUsuario'] as int,
    usuario: json['usuario'] == null
        ? null
        : Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ComentarioToJson(Comentario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comentario': instance.comentario,
      'idPost': instance.idPost,
      'idUsuario': instance.idUsuario,
      'usuario': instance.usuario,
    };
