// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    id: json['_id'] as String,
    fullName: json['fullName'] as String,
    hits: json['hits'] as int,
    fans: json['fans'] as int,
    skills: json['skills'] as List,
    email: json['email'] as String,
    userType: json['userType'] as String,
    username: json['username'] as String,
    signatureStatus: json['signatureStatus'] as String,
    token: json['token'] as String,
    avatar: json['avatar'],
    avatarImg: json['avatarImg'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    existeCategoria: json['existeCategoria'] as bool,
    categoria: json['categoria'] == null
        ? null
        : Categoria.fromJson(json['categoria'] as Map<String, dynamic>),
    avatarUrl: json['avatarUrl'] as String,
    bookmarkPosts: json['bookmarkPosts'] as List,
    bookmarkedPostsCounts: json['bookmarkedPostsCounts'] as int,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'hits': instance.hits,
      'fans': instance.fans,
      'skills': instance.skills,
      'email': instance.email,
      'userType': instance.userType,
      'username': instance.username,
      'signatureStatus': instance.signatureStatus,
      'token': instance.token,
      'avatar': instance.avatar,
      'avatarImg': instance.avatarImg,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'existeCategoria': instance.existeCategoria,
      'categoria': instance.categoria,
      'avatarUrl': instance.avatarUrl,
      'bookmarkPosts': instance.bookmarkPosts,
      'bookmarkedPostsCounts': instance.bookmarkedPostsCounts,
    };
