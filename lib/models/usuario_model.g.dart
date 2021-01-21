// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    id: json['id'] as int,
    nome: json['nome'] as String,
    hits: json['hits'] as int,
    fans: json['fans'] as int,
    skills: (json['skills'] as List)?.map((e) => e as String)?.toList(),
    imagem: json['imagem'] as String,
    localizacao: json['localizacao'] as String,
    posts: (json['posts'] as List)
        ?.map(
            (e) => e == null ? null : Post.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    idUsuario: (json['idUsuario'] as List)
        ?.map((e) =>
            e == null ? null : Usuario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'hits': instance.hits,
      'fans': instance.fans,
      'skills': instance.skills,
      'localizacao': instance.localizacao,
      'imagem': instance.imagem,
      'posts': instance.posts,
      'idUsuario': instance.idUsuario,
    };
