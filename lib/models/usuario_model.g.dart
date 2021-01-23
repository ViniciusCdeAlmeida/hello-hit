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
    skills: json['skills'] as List,
    imagem: json['imagem'] as String,
    localizacao: json['localizacao'] as String,
    posts: (json['posts'] as List)
        ?.map(
            (e) => e == null ? null : Post.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    usuarios: (json['usuarios'] as List)
        ?.map((e) =>
            e == null ? null : Usuario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    idUsuarios: json['idUsuarios'] as List,
    idOportunidades: json['idOportunidades'] as List,
    oportunidades: (json['oportunidades'] as List)
        ?.map((e) =>
            e == null ? null : Oportunidade.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    categoria: json['categoria'] as String,
    mensagem: json['mensagem'] as String,
    tipoUsuario: json['tipoUsuario'] as String,
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
      'categoria': instance.categoria,
      'mensagem': instance.mensagem,
      'posts': instance.posts,
      'idUsuarios': instance.idUsuarios,
      'usuarios': instance.usuarios,
      'idOportunidades': instance.idOportunidades,
      'oportunidades': instance.oportunidades,
      'tipoUsuario': instance.tipoUsuario,
    };
