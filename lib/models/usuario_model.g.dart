// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    id: json['id'] as String,
    full_name: json['full_name'] as String,
    hits: json['hits'] as int,
    fans: json['fans'] as int,
    skills: json['skills'] as List,
    email: json['email'] as String,
    userType: json['userType'] as String,
    signature_status: json['signature_status'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.full_name,
      'hits': instance.hits,
      'fans': instance.fans,
      'skills': instance.skills,
      'email': instance.email,
      'userType': instance.userType,
      'signature_status': instance.signature_status,
      'token': instance.token,
    };
